// Generated by CIRCT firtool-1.56.0
module LS_stage(	// @[<stdin>:1380:3]
  input         clock,	// @[<stdin>:1381:11]
                reset,	// @[<stdin>:1382:11]
                LS_IO_valid,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_csr_commit_wen,	// @[playground/src/LS_stage.scala:7:12]
  input  [11:0] LS_IO_bits_csr_commit_waddr,	// @[playground/src/LS_stage.scala:7:12]
  input  [31:0] LS_IO_bits_csr_commit_wdata,	// @[playground/src/LS_stage.scala:7:12]
  input         LS_IO_bits_csr_commit_exception_wen,	// @[playground/src/LS_stage.scala:7:12]
  input  [3:0]  LS_IO_bits_csr_commit_exception_mcause_in,	// @[playground/src/LS_stage.scala:7:12]
  input  [31:0] LS_IO_bits_csr_commit_exception_pc_wb,	// @[playground/src/LS_stage.scala:7:12]
  input         LS_IO_bits_dpic_bundle_id_inv_flag,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_dpic_bundle_ex_func_flag,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_dpic_bundle_ex_is_jal,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_dpic_bundle_ex_is_ret,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_dpic_bundle_ex_is_rd0,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_ld_wen,	// @[playground/src/LS_stage.scala:7:12]
  input  [2:0]  LS_IO_bits_ld_type,	// @[playground/src/LS_stage.scala:7:12]
  input  [4:0]  LS_IO_bits_csr_cmd,	// @[playground/src/LS_stage.scala:7:12]
  input  [1:0]  LS_IO_bits_wb_sel,	// @[playground/src/LS_stage.scala:7:12]
  input         LS_IO_bits_rf_wen,	// @[playground/src/LS_stage.scala:7:12]
  input  [4:0]  LS_IO_bits_rd,	// @[playground/src/LS_stage.scala:7:12]
  input  [31:0] LS_IO_bits_result,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_nextpc,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_pc,	// @[playground/src/LS_stage.scala:7:12]
                LS_IO_bits_inst,	// @[playground/src/LS_stage.scala:7:12]
  input         LS_to_wb_ready,	// @[playground/src/LS_stage.scala:7:12]
                LS_r_valid,	// @[playground/src/LS_stage.scala:7:12]
  input  [31:0] LS_r_bits_data,	// @[playground/src/LS_stage.scala:7:12]
  input  [1:0]  LS_r_bits_resp,	// @[playground/src/LS_stage.scala:7:12]
  output        LS_IO_ready,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_valid,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_csr_commit_wen,	// @[playground/src/LS_stage.scala:7:12]
  output [11:0] LS_to_wb_bits_csr_commit_waddr,	// @[playground/src/LS_stage.scala:7:12]
  output [31:0] LS_to_wb_bits_csr_commit_wdata,	// @[playground/src/LS_stage.scala:7:12]
  output        LS_to_wb_bits_csr_commit_exception_wen,	// @[playground/src/LS_stage.scala:7:12]
  output [3:0]  LS_to_wb_bits_csr_commit_exception_mcause_in,	// @[playground/src/LS_stage.scala:7:12]
  output [31:0] LS_to_wb_bits_csr_commit_exception_pc_wb,	// @[playground/src/LS_stage.scala:7:12]
  output        LS_to_wb_bits_dpic_bundle_id_inv_flag,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_dpic_bundle_ex_func_flag,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_dpic_bundle_ex_is_jal,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_dpic_bundle_ex_is_ret,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_dpic_bundle_ex_is_rd0,	// @[playground/src/LS_stage.scala:7:12]
  output [4:0]  LS_to_wb_bits_csr_cmd,	// @[playground/src/LS_stage.scala:7:12]
  output        LS_to_wb_bits_rf_wen,	// @[playground/src/LS_stage.scala:7:12]
  output [4:0]  LS_to_wb_bits_rd,	// @[playground/src/LS_stage.scala:7:12]
  output [31:0] LS_to_wb_bits_result,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_nextpc,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_pc,	// @[playground/src/LS_stage.scala:7:12]
                LS_to_wb_bits_inst,	// @[playground/src/LS_stage.scala:7:12]
  output [4:0]  LS_to_id_fw_addr,	// @[playground/src/LS_stage.scala:7:12]
  output [31:0] LS_to_id_fw_data,	// @[playground/src/LS_stage.scala:7:12]
  output        LS_r_ready	// @[playground/src/LS_stage.scala:7:12]
);

  reg  [31:0] casez_tmp;	// @[playground/src/LS_stage.scala:39:46]
  reg  [31:0] casez_tmp_0;	// @[playground/src/LS_stage.scala:51:57]
  reg         ls_valid;	// @[playground/src/LS_stage.scala:18:33]
  wire        _LS_r_ready_output = ls_valid;	// @[<stdin>:1380:3, playground/src/LS_stage.scala:18:33]
  wire        ls_ready_go = ~(~LS_r_valid & LS_IO_bits_ld_wen);	// @[playground/src/LS_stage.scala:18:33, :19:33, :20:{19,20,31}]
  wire        _LS_IO_ready_output = ~ls_valid | ls_ready_go & LS_to_wb_ready;	// @[playground/src/LS_stage.scala:18:33, :19:33, :21:{18,28,43}]
  wire [31:0] data_sram_rdata = _LS_r_ready_output & LS_r_valid ? LS_r_bits_data : 32'h0;	// @[<stdin>:1380:3, playground/src/LS_stage.scala:15:44, :29:18, :30:20, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  always_comb begin	// @[playground/src/LS_stage.scala:39:46]
    casez (LS_IO_bits_ld_type)	// @[playground/src/LS_stage.scala:39:46]
      3'b000:
        casez_tmp = 32'h0;	// @[playground/src/LS_stage.scala:15:44, :39:46]
      3'b001:
        casez_tmp = data_sram_rdata;	// @[playground/src/LS_stage.scala:15:44, :39:46]
      3'b010:
        casez_tmp = {{16{data_sram_rdata[15]}}, data_sram_rdata[15:0]};	// @[playground/src/Bundle.scala:194:{10,15,37}, playground/src/LS_stage.scala:15:44, :39:46, :41:34]
      3'b011:
        casez_tmp = {{24{data_sram_rdata[7]}}, data_sram_rdata[7:0]};	// @[playground/src/Bundle.scala:194:{10,15,37}, playground/src/LS_stage.scala:15:44, :39:46, :42:34]
      3'b100:
        casez_tmp = {16'h0, data_sram_rdata[15:0]};	// @[playground/src/Bundle.scala:194:15, :205:10, playground/src/LS_stage.scala:15:44, :39:46, :41:34]
      3'b101:
        casez_tmp = {24'h0, data_sram_rdata[7:0]};	// @[playground/src/Bundle.scala:194:15, :205:10, playground/src/LS_stage.scala:15:44, :39:46, :42:34]
      3'b110:
        casez_tmp = 32'h0;	// @[playground/src/LS_stage.scala:15:44, :39:46]
      default:
        casez_tmp = 32'h0;	// @[playground/src/LS_stage.scala:15:44, :39:46]
    endcase	// @[playground/src/LS_stage.scala:39:46]
  end // always_comb
  wire [31:0] ram_data = casez_tmp;	// @[playground/src/LS_stage.scala:37:30, :39:46]
  always_comb begin	// @[playground/src/LS_stage.scala:51:57]
    casez (LS_IO_bits_wb_sel)	// @[playground/src/LS_stage.scala:51:57]
      2'b00:
        casez_tmp_0 = LS_IO_bits_result;	// @[playground/src/LS_stage.scala:51:57]
      2'b01:
        casez_tmp_0 = ram_data;	// @[playground/src/LS_stage.scala:37:30, :51:57]
      2'b10:
        casez_tmp_0 = LS_IO_bits_pc + 32'h4;	// @[playground/src/LS_stage.scala:51:57, :54:29]
      default:
        casez_tmp_0 = LS_IO_bits_result;	// @[playground/src/LS_stage.scala:51:57]
    endcase	// @[playground/src/LS_stage.scala:51:57]
  end // always_comb
  always @(posedge clock) begin	// @[<stdin>:1381:11]
    if (reset)	// @[<stdin>:1381:11]
      ls_valid <= 1'h0;	// @[playground/src/LS_stage.scala:18:33]
    else if (_LS_IO_ready_output)	// @[playground/src/LS_stage.scala:21:28]
      ls_valid <= LS_IO_valid;	// @[playground/src/LS_stage.scala:18:33]
  end // always @(posedge)
  assign LS_IO_ready = _LS_IO_ready_output;	// @[<stdin>:1380:3, playground/src/LS_stage.scala:21:28]
  assign LS_to_wb_valid = ls_valid & ls_ready_go;	// @[<stdin>:1380:3, playground/src/LS_stage.scala:18:33, :19:33, :25:28]
  assign LS_to_wb_bits_csr_commit_wen = LS_IO_bits_csr_commit_wen;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_csr_commit_waddr = LS_IO_bits_csr_commit_waddr;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_csr_commit_wdata = LS_IO_bits_csr_commit_wdata;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_csr_commit_exception_wen = LS_IO_bits_csr_commit_exception_wen;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_csr_commit_exception_mcause_in =
    LS_IO_bits_csr_commit_exception_mcause_in;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_csr_commit_exception_pc_wb = LS_IO_bits_csr_commit_exception_pc_wb;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_dpic_bundle_id_inv_flag = LS_IO_bits_dpic_bundle_id_inv_flag;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_dpic_bundle_ex_func_flag = LS_IO_bits_dpic_bundle_ex_func_flag;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_dpic_bundle_ex_is_jal = LS_IO_bits_dpic_bundle_ex_is_jal;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_dpic_bundle_ex_is_ret = LS_IO_bits_dpic_bundle_ex_is_ret;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_dpic_bundle_ex_is_rd0 = LS_IO_bits_dpic_bundle_ex_is_rd0;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_csr_cmd = LS_IO_bits_csr_cmd;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_rf_wen = LS_IO_bits_rf_wen;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_rd = LS_IO_bits_rd;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_result = casez_tmp_0;	// @[<stdin>:1380:3, playground/src/LS_stage.scala:51:57]
  assign LS_to_wb_bits_nextpc = LS_IO_bits_nextpc;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_pc = LS_IO_bits_pc;	// @[<stdin>:1380:3]
  assign LS_to_wb_bits_inst = LS_IO_bits_inst;	// @[<stdin>:1380:3]
  assign LS_to_id_fw_addr = ls_valid & LS_IO_bits_rf_wen ? LS_IO_bits_rd : 5'h0;	// @[<stdin>:1380:3, playground/src/LS_stage.scala:18:33, :62:{24,34}]
  assign LS_to_id_fw_data = casez_tmp_0;	// @[<stdin>:1380:3, playground/src/LS_stage.scala:51:57]
  assign LS_r_ready = _LS_r_ready_output;	// @[<stdin>:1380:3]
endmodule

