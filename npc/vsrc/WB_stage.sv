// Generated by CIRCT firtool-1.56.0
module WB_stage(	// @[<stdin>:1399:3]
  input         clock,	// @[<stdin>:1400:11]
                reset,	// @[<stdin>:1401:11]
                WB_IO_valid,	// @[playground/src/WB_stage.scala:7:12]
                WB_IO_bits_dpic_bundle_id_inv_flag,	// @[playground/src/WB_stage.scala:7:12]
                WB_IO_bits_dpic_bundle_ex_func_flag,	// @[playground/src/WB_stage.scala:7:12]
                WB_IO_bits_dpic_bundle_ex_is_jal,	// @[playground/src/WB_stage.scala:7:12]
                WB_IO_bits_dpic_bundle_ex_is_ret,	// @[playground/src/WB_stage.scala:7:12]
                WB_IO_bits_dpic_bundle_ex_is_rd0,	// @[playground/src/WB_stage.scala:7:12]
                WB_IO_bits_pc_sel,	// @[playground/src/WB_stage.scala:7:12]
  input  [11:0] WB_IO_bits_csr_addr,	// @[playground/src/WB_stage.scala:7:12]
  input  [4:0]  WB_IO_bits_csr_cmd,	// @[playground/src/WB_stage.scala:7:12]
  input         WB_IO_bits_ebreak_flag,	// @[playground/src/WB_stage.scala:7:12]
                WB_IO_bits_wen,	// @[playground/src/WB_stage.scala:7:12]
  input  [4:0]  WB_IO_bits_rd,	// @[playground/src/WB_stage.scala:7:12]
  input  [31:0] WB_IO_bits_result,	// @[playground/src/WB_stage.scala:7:12]
                WB_IO_bits_nextpc,	// @[playground/src/WB_stage.scala:7:12]
                WB_IO_bits_pc,	// @[playground/src/WB_stage.scala:7:12]
                WB_IO_bits_inst,	// @[playground/src/WB_stage.scala:7:12]
  output        WB_IO_ready,	// @[playground/src/WB_stage.scala:7:12]
  output [4:0]  WB_to_rf_waddr,	// @[playground/src/WB_stage.scala:7:12]
  output [31:0] WB_to_rf_wdata,	// @[playground/src/WB_stage.scala:7:12]
  output        WB_to_rf_wen,	// @[playground/src/WB_stage.scala:7:12]
  output [31:0] WB_to_if_csr_epc,	// @[playground/src/WB_stage.scala:7:12]
  output        WB_to_if_epc_wen,	// @[playground/src/WB_stage.scala:7:12]
  output [4:0]  WB_debug_waddr,	// @[playground/src/WB_stage.scala:7:12]
  output [31:0] WB_debug_wdata,	// @[playground/src/WB_stage.scala:7:12]
  output        WB_debug_wen	// @[playground/src/WB_stage.scala:7:12]
);

  wire        _Csrfile_io_out_wen;	// @[playground/src/WB_stage.scala:26:21]
  wire [31:0] _Csrfile_io_out;	// @[playground/src/WB_stage.scala:26:21]
  wire        wb_ready_go = 1'h1;	// @[playground/src/WB_stage.scala:18:33, :19:14]
  reg         wb_valid;	// @[playground/src/WB_stage.scala:17:33]
  wire        _WB_IO_ready_output = ~wb_valid | wb_ready_go;	// @[playground/src/WB_stage.scala:17:33, :18:33, :20:{18,28}]
  wire [31:0] _WB_to_rf_wdata_output =
    _Csrfile_io_out_wen ? _Csrfile_io_out : WB_IO_bits_result;	// @[playground/src/WB_stage.scala:26:21, :36:22]
  wire        _WB_to_rf_wen_output = WB_IO_bits_wen & wb_valid;	// @[playground/src/WB_stage.scala:17:33, :38:33]
  always @(posedge clock) begin	// @[<stdin>:1400:11]
    if (reset)	// @[<stdin>:1400:11]
      wb_valid <= 1'h0;	// @[playground/src/WB_stage.scala:17:33]
    else if (_WB_IO_ready_output)	// @[playground/src/WB_stage.scala:20:28]
      wb_valid <= WB_IO_valid;	// @[playground/src/WB_stage.scala:17:33]
  end // always @(posedge)
  CsrFile Csrfile (	// @[playground/src/WB_stage.scala:26:21]
    .clock       (clock),
    .reset       (reset),
    .io_csr_cmd  (WB_IO_bits_csr_cmd),
    .io_pc       (WB_IO_bits_pc),
    .io_csr_addr (WB_IO_bits_csr_addr),
    .io_in       (WB_IO_bits_result),
    .io_out_wen  (_Csrfile_io_out_wen),
    .io_out      (_Csrfile_io_out),
    .io_epc      (WB_to_if_csr_epc)
  );
  DPI_stage DPI_stage (	// @[playground/src/WB_stage.scala:45:23]
    .clock            (clock),
    .reset            (reset),
    .DPI_wb_valid     (wb_valid),	// @[playground/src/WB_stage.scala:17:33]
    .DPI_pc           (WB_IO_bits_pc),
    .DPI_nextpc       (WB_IO_bits_nextpc),
    .DPI_inst         (WB_IO_bits_inst),
    .DPI_inv_flag     (WB_IO_bits_dpic_bundle_id_inv_flag),
    .DPI_func_flag    (WB_IO_bits_dpic_bundle_ex_func_flag),
    .DPI_is_jal       (WB_IO_bits_dpic_bundle_ex_is_jal),
    .DPI_is_ret       (WB_IO_bits_dpic_bundle_ex_is_ret),
    .DPI_is_rd0       (WB_IO_bits_dpic_bundle_ex_is_rd0),
    .DPI_is_ebreak    (WB_IO_bits_ebreak_flag),
    .DPI_ret_reg_data (_WB_to_rf_wdata_output[0])	// @[playground/src/WB_stage.scala:36:22, :56:29]
  );
  assign WB_IO_ready = _WB_IO_ready_output;	// @[<stdin>:1399:3, playground/src/WB_stage.scala:20:28]
  assign WB_to_rf_waddr = WB_IO_bits_rd;	// @[<stdin>:1399:3]
  assign WB_to_rf_wdata = _WB_to_rf_wdata_output;	// @[<stdin>:1399:3, playground/src/WB_stage.scala:36:22]
  assign WB_to_rf_wen = _WB_to_rf_wen_output;	// @[<stdin>:1399:3, playground/src/WB_stage.scala:38:33]
  assign WB_to_if_epc_wen = WB_IO_bits_pc_sel;	// @[<stdin>:1399:3]
  assign WB_debug_waddr = WB_IO_bits_rd;	// @[<stdin>:1399:3]
  assign WB_debug_wdata = _WB_to_rf_wdata_output;	// @[<stdin>:1399:3, playground/src/WB_stage.scala:36:22]
  assign WB_debug_wen = _WB_to_rf_wen_output;	// @[<stdin>:1399:3, playground/src/WB_stage.scala:38:33]
endmodule

