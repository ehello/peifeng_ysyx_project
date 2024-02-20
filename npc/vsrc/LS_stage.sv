// Generated by CIRCT firtool-1.56.0
module LS_stage(	// @[<stdin>:1165:3]
  input         clock,	// @[<stdin>:1166:11]
                reset,	// @[<stdin>:1167:11]
                LS_IO_valid,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_dpic_bundle_id_inv_flag,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_dpic_bundle_ex_func_flag,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_dpic_bundle_ex_is_jal,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_dpic_bundle_ex_is_ret,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_dpic_bundle_ex_is_rd0,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_pc_sel,	// @[playground/src/LS_stage.scala:7:12]
  input  [11:0] LS_IO_bits_csr_addr,	// @[playground/src/LS_stage.scala:7:12]
  input  [4:0]  LS_IO_bits_csr_cmd,	// @[playground/src/LS_stage.scala:7:12]
  input  [7:0]  LS_IO_bits_st_type,	// @[playground/src/LS_stage.scala:7:12]
  input  [2:0]  LS_IO_bits_ld_type,	// @[playground/src/LS_stage.scala:7:12]
  input         LS_IO_bits_ebreak_flag,	// @[playground/src/LS_stage.scala:7:12]
  input  [1:0]  LS_IO_bits_wb_sel,	// @[playground/src/LS_stage.scala:7:12]
  input         LS_IO_bits_wen,	// @[playground/src/LS_stage.scala:7:12]
  input  [4:0]  LS_IO_bits_rd,	// @[playground/src/LS_stage.scala:7:12]
  input  [31:0] LS_IO_bits_rdata2,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_result,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_nextpc,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_pc,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_inst,	// @[playground/src/LS_stage.scala:7:12]
  input         LS_to_wb_ready,	// @[playground/src/LS_stage.scala:7:12]
  output        LS_IO_ready,	// @[playground/src/LS_stage.scala:7:12]
  output [4:0]  LS_bypass_id_addr,	// @[playground/src/LS_stage.scala:7:12]
  output [31:0] LS_bypass_id_data,	// @[playground/src/LS_stage.scala:7:12]
  output        LS_to_wb_valid,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_dpic_bundle_id_inv_flag,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_dpic_bundle_ex_func_flag,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_dpic_bundle_ex_is_jal,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_dpic_bundle_ex_is_ret,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_dpic_bundle_ex_is_rd0,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_pc_sel,	// @[playground/src/LS_stage.scala:7:12]
  output [11:0] LS_to_wb_bits_csr_addr,	// @[playground/src/LS_stage.scala:7:12]
  output [4:0]  LS_to_wb_bits_csr_cmd,	// @[playground/src/LS_stage.scala:7:12]
  output        LS_to_wb_bits_ebreak_flag,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_wen,	// @[playground/src/LS_stage.scala:7:12]
  output [4:0]  LS_to_wb_bits_rd,	// @[playground/src/LS_stage.scala:7:12]
  output [31:0] LS_to_wb_bits_result,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_nextpc,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_pc,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_inst,	// @[playground/src/LS_stage.scala:7:12]
  output        LS_clog_id	// @[playground/src/LS_stage.scala:7:12]
);

  wire        wdata_ok;	// @[playground/src/LS_stage.scala:15:30]
  wire [31:0] _dpi_ls_rdata;	// @[playground/src/LS_stage.scala:31:20]
  reg  [31:0] casez_tmp;	// @[playground/src/LS_stage.scala:43:46]
  reg  [31:0] casez_tmp_0;	// @[playground/src/LS_stage.scala:59:57]
  reg         ls_valid;	// @[playground/src/LS_stage.scala:18:33]
  wire        rdata_ok;	// @[playground/src/LS_stage.scala:14:30]
  wire        ls_ready_go = ~((|LS_IO_bits_ld_type) & ls_valid & ~rdata_ok);	// @[playground/src/LS_stage.scala:14:30, :18:33, :19:33, :20:{19,46,63,66}]
  wire        _LS_IO_ready_output = ~ls_valid | ls_ready_go & LS_to_wb_ready;	// @[playground/src/LS_stage.scala:18:33, :19:33, :21:{18,28,43}]
  always_comb begin	// @[playground/src/LS_stage.scala:43:46]
    casez (LS_IO_bits_ld_type)	// @[playground/src/LS_stage.scala:43:46]
      3'b000:
        casez_tmp = 32'h0;	// @[playground/src/LS_stage.scala:43:46]
      3'b001:
        casez_tmp = _dpi_ls_rdata;	// @[playground/src/LS_stage.scala:31:20, :43:46]
      3'b010:
        casez_tmp = {{16{_dpi_ls_rdata[15]}}, _dpi_ls_rdata[15:0]};	// @[playground/src/Bundle.scala:115:{10,15,37}, playground/src/LS_stage.scala:31:20, :43:46, :45:34]
      3'b011:
        casez_tmp = {{24{_dpi_ls_rdata[7]}}, _dpi_ls_rdata[7:0]};	// @[playground/src/Bundle.scala:115:{10,15,37}, playground/src/LS_stage.scala:31:20, :43:46, :46:34]
      3'b100:
        casez_tmp = {16'h0, _dpi_ls_rdata[15:0]};	// @[playground/src/Bundle.scala:115:15, :126:10, playground/src/LS_stage.scala:31:20, :43:46, :45:34]
      3'b101:
        casez_tmp = {24'h0, _dpi_ls_rdata[7:0]};	// @[playground/src/Bundle.scala:115:15, :126:10, playground/src/LS_stage.scala:31:20, :43:46, :46:34]
      3'b110:
        casez_tmp = 32'h0;	// @[playground/src/LS_stage.scala:43:46]
      default:
        casez_tmp = 32'h0;	// @[playground/src/LS_stage.scala:43:46]
    endcase	// @[playground/src/LS_stage.scala:43:46]
  end // always_comb
  wire [31:0] ram_data = casez_tmp;	// @[playground/src/LS_stage.scala:30:30, :43:46]
  always_comb begin	// @[playground/src/LS_stage.scala:59:57]
    casez (LS_IO_bits_wb_sel)	// @[playground/src/LS_stage.scala:59:57]
      2'b00:
        casez_tmp_0 = LS_IO_bits_result;	// @[playground/src/LS_stage.scala:59:57]
      2'b01:
        casez_tmp_0 = ram_data;	// @[playground/src/LS_stage.scala:30:30, :59:57]
      2'b10:
        casez_tmp_0 = LS_IO_bits_pc + 32'h4;	// @[playground/src/LS_stage.scala:59:57, :62:29]
      default:
        casez_tmp_0 = LS_IO_bits_result;	// @[playground/src/LS_stage.scala:59:57]
    endcase	// @[playground/src/LS_stage.scala:59:57]
  end // always_comb
  always @(posedge clock) begin	// @[<stdin>:1166:11]
    if (reset)	// @[<stdin>:1166:11]
      ls_valid <= 1'h0;	// @[playground/src/LS_stage.scala:18:33]
    else if (_LS_IO_ready_output)	// @[playground/src/LS_stage.scala:21:28]
      ls_valid <= LS_IO_valid;	// @[playground/src/LS_stage.scala:18:33]
  end // always @(posedge)
  dpi_ls dpi_ls (	// @[playground/src/LS_stage.scala:31:20]
    .clock    (clock),
    .reset    (reset),
    .ld_wen   ((|LS_IO_bits_ld_type) & ls_valid),	// @[playground/src/LS_stage.scala:18:33, :20:46, :34:54]
    .st_wen   ((|LS_IO_bits_st_type) & ls_valid),	// @[playground/src/LS_stage.scala:18:33, :35:{47,54}]
    .raddr    (LS_IO_bits_result),
    .wmask    (LS_IO_bits_st_type),
    .waddr    (LS_IO_bits_result),
    .wdata    (LS_IO_bits_rdata2),
    .rdata    (_dpi_ls_rdata),
    .rdata_ok (rdata_ok),
    .wdata_ok (wdata_ok)
  );
  assign LS_IO_ready = _LS_IO_ready_output;	// @[<stdin>:1165:3, playground/src/LS_stage.scala:21:28]
  assign LS_bypass_id_addr = ls_valid & LS_IO_bits_wen ? LS_IO_bits_rd : 5'h0;	// @[<stdin>:1165:3, playground/src/LS_stage.scala:18:33, :70:{25,35}]
  assign LS_bypass_id_data = casez_tmp_0;	// @[<stdin>:1165:3, playground/src/LS_stage.scala:59:57]
  assign LS_to_wb_valid = ls_valid & ls_ready_go;	// @[<stdin>:1165:3, playground/src/LS_stage.scala:18:33, :19:33, :25:28]
  assign LS_to_wb_bits_dpic_bundle_id_inv_flag = LS_IO_bits_dpic_bundle_id_inv_flag;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_dpic_bundle_ex_func_flag = LS_IO_bits_dpic_bundle_ex_func_flag;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_dpic_bundle_ex_is_jal = LS_IO_bits_dpic_bundle_ex_is_jal;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_dpic_bundle_ex_is_ret = LS_IO_bits_dpic_bundle_ex_is_ret;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_dpic_bundle_ex_is_rd0 = LS_IO_bits_dpic_bundle_ex_is_rd0;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_pc_sel = LS_IO_bits_pc_sel;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_csr_addr = LS_IO_bits_csr_addr;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_csr_cmd = LS_IO_bits_csr_cmd;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_ebreak_flag = LS_IO_bits_ebreak_flag;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_wen = LS_IO_bits_wen;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_rd = LS_IO_bits_rd;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_result = casez_tmp_0;	// @[<stdin>:1165:3, playground/src/LS_stage.scala:59:57]
  assign LS_to_wb_bits_nextpc = LS_IO_bits_nextpc;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_pc = LS_IO_bits_pc;	// @[<stdin>:1165:3]
  assign LS_to_wb_bits_inst = LS_IO_bits_inst;	// @[<stdin>:1165:3]
  assign LS_clog_id = (|LS_IO_bits_ld_type) & ls_valid & ~rdata_ok;	// @[<stdin>:1165:3, playground/src/LS_stage.scala:14:30, :18:33, :20:{46,66}, :27:58]
endmodule

