// Generated by CIRCT firtool-1.56.0
module LS_stage(	// @[<stdin>:964:3]
  input         clock,	// @[<stdin>:965:11]
                reset,	// @[<stdin>:966:11]
  input  [1:0]  LS_IO_st_type,	// @[playground/src/LS_stage.scala:7:12]
  input  [2:0]  LS_IO_ld_type,	// @[playground/src/LS_stage.scala:7:12]
  input         LS_IO_ebreak_flag,	// @[playground/src/LS_stage.scala:7:12]
  input  [1:0]  LS_IO_wb_sel,	// @[playground/src/LS_stage.scala:7:12]
  input         LS_IO_wen,	// @[playground/src/LS_stage.scala:7:12]
  input  [4:0]  LS_IO_rd,	// @[playground/src/LS_stage.scala:7:12]
  input  [31:0] LS_IO_src2,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_result,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_nextpc,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_pc,	// @[playground/src/LS_stage.scala:7:12]
  output        LS_to_wb_ebreak_flag,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_wen,	// @[playground/src/LS_stage.scala:7:12]
  output [4:0]  LS_to_wb_rd,	// @[playground/src/LS_stage.scala:7:12]
  output [31:0] LS_to_wb_result,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_nextpc	// @[playground/src/LS_stage.scala:7:12]
);

  wire [31:0] _dpi_ls_rdata;	// @[playground/src/LS_stage.scala:12:20]
  reg  [31:0] casez_tmp;	// @[playground/src/LS_stage.scala:23:41]
  reg  [31:0] casez_tmp_0;	// @[playground/src/LS_stage.scala:34:47]
  always_comb begin	// @[playground/src/LS_stage.scala:23:41]
    casez (LS_IO_ld_type)	// @[playground/src/LS_stage.scala:23:41]
      3'b000:
        casez_tmp = 32'h0;	// @[playground/src/LS_stage.scala:23:41]
      3'b001:
        casez_tmp = _dpi_ls_rdata;	// @[playground/src/LS_stage.scala:12:20, :23:41]
      3'b010:
        casez_tmp = {{16{_dpi_ls_rdata[15]}}, _dpi_ls_rdata[15:0]};	// @[playground/src/Bundle.scala:69:{10,15,37}, playground/src/LS_stage.scala:12:20, :23:41, :25:34]
      3'b011:
        casez_tmp = {{24{_dpi_ls_rdata[7]}}, _dpi_ls_rdata[7:0]};	// @[playground/src/Bundle.scala:69:{10,15,37}, playground/src/LS_stage.scala:12:20, :23:41, :26:34]
      3'b100:
        casez_tmp = {16'h0, _dpi_ls_rdata[15:0]};	// @[playground/src/Bundle.scala:69:15, :80:10, playground/src/LS_stage.scala:12:20, :23:41, :25:34]
      3'b101:
        casez_tmp = {24'h0, _dpi_ls_rdata[7:0]};	// @[playground/src/Bundle.scala:69:15, :80:10, playground/src/LS_stage.scala:12:20, :23:41, :26:34]
      3'b110:
        casez_tmp = 32'h0;	// @[playground/src/LS_stage.scala:23:41]
      default:
        casez_tmp = 32'h0;	// @[playground/src/LS_stage.scala:23:41]
    endcase	// @[playground/src/LS_stage.scala:23:41]
  end // always_comb
  wire [31:0] ram_data = casez_tmp;	// @[playground/src/LS_stage.scala:11:30, :23:41]
  always_comb begin	// @[playground/src/LS_stage.scala:34:47]
    casez (LS_IO_wb_sel)	// @[playground/src/LS_stage.scala:34:47]
      2'b00:
        casez_tmp_0 = LS_IO_result;	// @[playground/src/LS_stage.scala:34:47]
      2'b01:
        casez_tmp_0 = ram_data;	// @[playground/src/LS_stage.scala:11:30, :34:47]
      2'b10:
        casez_tmp_0 = LS_IO_pc + 32'h4;	// @[playground/src/LS_stage.scala:34:47, :37:24]
      default:
        casez_tmp_0 = 32'h0;	// @[playground/src/LS_stage.scala:23:41, :34:47]
    endcase	// @[playground/src/LS_stage.scala:34:47]
  end // always_comb
  dpi_ls dpi_ls (	// @[playground/src/LS_stage.scala:12:20]
    .clock  (clock),
    .reset  (reset),
    .ld_wen (|LS_IO_ld_type),	// @[playground/src/LS_stage.scala:15:41]
    .st_wen (|LS_IO_st_type),	// @[playground/src/LS_stage.scala:16:41]
    .raddr  (LS_IO_result),
    .wmask  ({6'h0, LS_IO_st_type}),	// @[playground/src/LS_stage.scala:19:18]
    .waddr  (LS_IO_result),
    .wdata  (LS_IO_src2),
    .rdata  (_dpi_ls_rdata)
  );
  assign LS_to_wb_ebreak_flag = LS_IO_ebreak_flag;	// @[<stdin>:964:3]
  assign LS_to_wb_wen = LS_IO_wen;	// @[<stdin>:964:3]
  assign LS_to_wb_rd = LS_IO_rd;	// @[<stdin>:964:3]
  assign LS_to_wb_result = casez_tmp_0;	// @[<stdin>:964:3, playground/src/LS_stage.scala:34:47]
  assign LS_to_wb_nextpc = LS_IO_nextpc;	// @[<stdin>:964:3]
endmodule

