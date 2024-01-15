import chisel3._
import chisel3.util._  
import config.Configs._

class wb_bus extends Bundle{
  val waddr=UInt(5.W)
  val wdata=UInt(DATA_WIDTH.W)
  val wen=Bool()
}

class br_bus extends Bundle{
  val is_jump=Bool()
  val dnpc   =UInt(ADDR_WIDTH.W)
}

class if_to_id_bus extends Bundle{
  val nextpc=UInt(ADDR_WIDTH.W)
  val pc  =UInt(ADDR_WIDTH.W)
  val inst=UInt(32.W)
}


class id_to_ex_bus extends Bundle{
  val st_type=UInt(8.W)
  val ld_type=UInt(3.W)
  val ebreak_flag=Bool()
  val wb_sel =UInt(2.W)
  val br_type=UInt(4.W)
  val wen   =Bool()
  val rd    =UInt(5.W)
  val alu_op=UInt(4.W)
  val src1=UInt(DATA_WIDTH.W)
  val src2=UInt(DATA_WIDTH.W)
  val rdata1=UInt(DATA_WIDTH.W)
  val rdata2=UInt(DATA_WIDTH.W)
  val nextpc=UInt(ADDR_WIDTH.W)
  val pc  =UInt(ADDR_WIDTH.W)
  val inst=UInt(32.W)
}

class ex_to_ls_bus extends Bundle{
  val st_type=UInt(8.W)
  val ld_type=UInt(3.W)
  val ebreak_flag=Bool()
  val wb_sel =UInt(2.W)
  val wen   =Bool()
  val rd    =UInt(5.W)
  val rdata2=UInt(DATA_WIDTH.W)
  val result=UInt(DATA_WIDTH.W)
  val nextpc=UInt(ADDR_WIDTH.W)
  val pc  =UInt(ADDR_WIDTH.W)
  val inst=UInt(32.W)
}

class ls_to_wb_bus extends Bundle{
  val ebreak_flag=Bool()
  val wen   =Bool()
  val rd    =UInt(5.W)
  val result=UInt(DATA_WIDTH.W)
  val nextpc=UInt(ADDR_WIDTH.W)
  val pc  =UInt(ADDR_WIDTH.W)
  val inst=UInt(32.W)
}



object Sext{ //有符号位宽扩展
  def apply(num:UInt,e_width:Int) = {
    val num_width=num.getWidth
    if(num_width<e_width){
      Cat(Fill(e_width-num_width,num(num_width-1)),num(num_width-1,0))
    }else{
      num(num_width-1,0)
    }
  }
}

object Zext{ //无符号位宽扩展
  def apply(num:UInt,e_width:Int) = {
    val num_width=num.getWidth
    if(num_width<e_width){
      Cat(Fill(e_width-num_width,0.U),num(num_width-1,0))
    }else{
      num(num_width-1,0)
    }
  }
}