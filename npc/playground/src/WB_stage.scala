import chisel3._
import chisel3.util._
import config.Configs._
import Control._

class WB_stage extends Module {
  val WB=IO(new Bundle {
    val IO    =Input(new ls_to_wb_bus())
    val to_id =Output(new wb_bus())
    val debug_waddr=Output(UInt(5.W))
    val debug_wdata=Output(UInt(DATA_WIDTH.W))
    val debug_wen  =Output(Bool())
  })
  WB.to_id.waddr:=WB.IO.rd
  WB.to_id.wdata:=MuxLookup(WB.IO.wb_sel,0.U)(Seq(
    WB_ALU ->  WB.IO.result,
    WB_PC4 -> (WB.IO.pc+4.U)
  ))
  WB.to_id.wen  :=WB.IO.wen

  WB.debug_waddr:=WB.to_id.waddr
  WB.debug_wdata:=WB.to_id.wdata
  WB.debug_wen  :=WB.to_id.wen

  val dpi_ebreak=Module(new dpi_ebreak())
  dpi_ebreak.io.clock:=clock
  dpi_ebreak.io.reset:=reset
  dpi_ebreak.io.pc:=WB.IO.pc
  dpi_ebreak.io.ebreak_flag:=WB.IO.ebreak_flag
  dpi_ebreak.io.ret_reg:=WB.to_id.wdata
}


class dpi_ebreak extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle {
    val clock=Input(Clock())
    val reset=Input(Bool())
    val ebreak_flag=Input(Bool())
    val pc         =Input(UInt(32.W))
    val ret_reg    =Input(UInt(32.W))
  })
  setInline("dpi_ebreak.v",
    """
      |import "DPI-C" function void sim_break(input int pc,input int ret_reg);
      |module dpi_ebreak(
      |    input        clock,
      |    input        reset,
      |    input        ebreak_flag,
      |    input [31:0] pc,
      |    input [31:0] ret_reg
      |);
      | always @(posedge clock)begin
      |   if(~reset)begin
      |     if(ebreak_flag)  sim_break(pc,ret_reg);
      |   end
      |  end
      |endmodule
    """.stripMargin)
}