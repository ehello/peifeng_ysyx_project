// Generated by CIRCT firtool-1.56.0
module WB_stage(	// @[<stdin>:948:3]
  input         clock,	// @[<stdin>:949:11]
                reset,	// @[<stdin>:950:11]
                WB_IO_ebreak_flag,	// @[playground/src/WB_stage.scala:7:12]
  input  [1:0]  WB_IO_wb_sel,	// @[playground/src/WB_stage.scala:7:12]
  input         WB_IO_wen,	// @[playground/src/WB_stage.scala:7:12]
  input  [4:0]  WB_IO_rd,	// @[playground/src/WB_stage.scala:7:12]
  input  [31:0] WB_IO_result,	// @[playground/src/WB_stage.scala:7:12]
                WB_IO_pc,	// @[playground/src/WB_stage.scala:7:12]
  output [4:0]  WB_to_id_waddr,	// @[playground/src/WB_stage.scala:7:12]
  output [31:0] WB_to_id_wdata,	// @[playground/src/WB_stage.scala:7:12]
  output        WB_to_id_wen,	// @[playground/src/WB_stage.scala:7:12]
  output [4:0]  WB_debug_waddr,	// @[playground/src/WB_stage.scala:7:12]
  output [31:0] WB_debug_wdata,	// @[playground/src/WB_stage.scala:7:12]
  output        WB_debug_wen	// @[playground/src/WB_stage.scala:7:12]
);

  wire [31:0] _WB_to_id_wdata_output =
    WB_IO_wb_sel == 2'h2 ? WB_IO_pc + 32'h4 : WB_IO_wb_sel == 2'h0 ? WB_IO_result : 32'h0;	// @[playground/src/WB_stage.scala:15:46, :17:24]
  dpi_ebreak dpi_ebreak (	// @[playground/src/WB_stage.scala:25:24]
    .clock       (clock),
    .reset       (reset),
    .ebreak_flag (WB_IO_ebreak_flag),
    .pc          (WB_IO_pc[0]),	// @[playground/src/WB_stage.scala:28:19]
    .ret_reg     (_WB_to_id_wdata_output)	// @[playground/src/WB_stage.scala:15:46]
  );
  assign WB_to_id_waddr = WB_IO_rd;	// @[<stdin>:948:3]
  assign WB_to_id_wdata = _WB_to_id_wdata_output;	// @[<stdin>:948:3, playground/src/WB_stage.scala:15:46]
  assign WB_to_id_wen = WB_IO_wen;	// @[<stdin>:948:3]
  assign WB_debug_waddr = WB_IO_rd;	// @[<stdin>:948:3]
  assign WB_debug_wdata = _WB_to_id_wdata_output;	// @[<stdin>:948:3, playground/src/WB_stage.scala:15:46]
  assign WB_debug_wen = WB_IO_wen;	// @[<stdin>:948:3]
endmodule

