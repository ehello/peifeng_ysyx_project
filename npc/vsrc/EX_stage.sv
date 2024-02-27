// Generated by CIRCT firtool-1.56.0
module EX_stage(	// @[<stdin>:1196:3]
  input         clock,	// @[<stdin>:1197:11]
                reset,	// @[<stdin>:1198:11]
                EX_IO_valid,	// @[playground/src/EX_stage.scala:6:12]
                EX_IO_bits_dpic_bundle_id_inv_flag,	// @[playground/src/EX_stage.scala:6:12]
                EX_IO_bits_pc_sel,	// @[playground/src/EX_stage.scala:6:12]
  input  [11:0] EX_IO_bits_csr_addr,	// @[playground/src/EX_stage.scala:6:12]
  input  [31:0] EX_IO_bits_csr_global_mtvec,	// @[playground/src/EX_stage.scala:6:12]
                EX_IO_bits_csr_global_mepc,	// @[playground/src/EX_stage.scala:6:12]
  input         EX_IO_bits_b_taken,	// @[playground/src/EX_stage.scala:6:12]
  input  [3:0]  EX_IO_bits_st_type,	// @[playground/src/EX_stage.scala:6:12]
  input  [2:0]  EX_IO_bits_ld_type,	// @[playground/src/EX_stage.scala:6:12]
  input  [4:0]  EX_IO_bits_csr_cmd,	// @[playground/src/EX_stage.scala:6:12]
  input  [1:0]  EX_IO_bits_wb_sel,	// @[playground/src/EX_stage.scala:6:12]
  input  [3:0]  EX_IO_bits_br_type,	// @[playground/src/EX_stage.scala:6:12]
  input         EX_IO_bits_rf_wen,	// @[playground/src/EX_stage.scala:6:12]
  input  [4:0]  EX_IO_bits_rd,	// @[playground/src/EX_stage.scala:6:12]
  input  [3:0]  EX_IO_bits_alu_op,	// @[playground/src/EX_stage.scala:6:12]
  input  [31:0] EX_IO_bits_src1,	// @[playground/src/EX_stage.scala:6:12]
                EX_IO_bits_src2,	// @[playground/src/EX_stage.scala:6:12]
                EX_IO_bits_rdata1,	// @[playground/src/EX_stage.scala:6:12]
                EX_IO_bits_rdata2,	// @[playground/src/EX_stage.scala:6:12]
                EX_IO_bits_nextpc,	// @[playground/src/EX_stage.scala:6:12]
                EX_IO_bits_pc,	// @[playground/src/EX_stage.scala:6:12]
                EX_IO_bits_inst,	// @[playground/src/EX_stage.scala:6:12]
  input         EX_to_ls_ready,	// @[playground/src/EX_stage.scala:6:12]
                EX_ar_ready,	// @[playground/src/EX_stage.scala:6:12]
                EX_aw_ready,	// @[playground/src/EX_stage.scala:6:12]
                EX_w_ready,	// @[playground/src/EX_stage.scala:6:12]
                EX_b_valid,	// @[playground/src/EX_stage.scala:6:12]
  input  [1:0]  EX_b_bits_resp,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_IO_ready,	// @[playground/src/EX_stage.scala:6:12]
                EX_to_ls_valid,	// @[playground/src/EX_stage.scala:6:12]
                EX_to_ls_bits_csr_commit_wen,	// @[playground/src/EX_stage.scala:6:12]
  output [11:0] EX_to_ls_bits_csr_commit_waddr,	// @[playground/src/EX_stage.scala:6:12]
  output [31:0] EX_to_ls_bits_csr_commit_wdata,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_to_ls_bits_csr_commit_exception_wen,	// @[playground/src/EX_stage.scala:6:12]
  output [31:0] EX_to_ls_bits_csr_commit_exception_pc_wb,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_to_ls_bits_dpic_bundle_id_inv_flag,	// @[playground/src/EX_stage.scala:6:12]
                EX_to_ls_bits_dpic_bundle_ex_func_flag,	// @[playground/src/EX_stage.scala:6:12]
                EX_to_ls_bits_dpic_bundle_ex_is_jal,	// @[playground/src/EX_stage.scala:6:12]
                EX_to_ls_bits_dpic_bundle_ex_is_ret,	// @[playground/src/EX_stage.scala:6:12]
                EX_to_ls_bits_dpic_bundle_ex_is_rd0,	// @[playground/src/EX_stage.scala:6:12]
                EX_to_ls_bits_ld_wen,	// @[playground/src/EX_stage.scala:6:12]
  output [2:0]  EX_to_ls_bits_ld_type,	// @[playground/src/EX_stage.scala:6:12]
  output [4:0]  EX_to_ls_bits_csr_cmd,	// @[playground/src/EX_stage.scala:6:12]
  output [1:0]  EX_to_ls_bits_wb_sel,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_to_ls_bits_rf_wen,	// @[playground/src/EX_stage.scala:6:12]
  output [4:0]  EX_to_ls_bits_rd,	// @[playground/src/EX_stage.scala:6:12]
  output [31:0] EX_to_ls_bits_result,	// @[playground/src/EX_stage.scala:6:12]
                EX_to_ls_bits_nextpc,	// @[playground/src/EX_stage.scala:6:12]
                EX_to_ls_bits_pc,	// @[playground/src/EX_stage.scala:6:12]
                EX_to_ls_bits_inst,	// @[playground/src/EX_stage.scala:6:12]
  output [4:0]  EX_to_id_fw_addr,	// @[playground/src/EX_stage.scala:6:12]
  output [31:0] EX_to_id_fw_data,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_to_id_csr_ecpt_wen,	// @[playground/src/EX_stage.scala:6:12]
  output [31:0] EX_to_id_csr_ecpt_pc_wb,	// @[playground/src/EX_stage.scala:6:12]
  output [11:0] EX_to_id_csr_waddr,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_to_id_csr_wen,	// @[playground/src/EX_stage.scala:6:12]
  output [31:0] EX_to_id_csr_wdata,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_to_id_clog,	// @[playground/src/EX_stage.scala:6:12]
  output [31:0] EX_to_if_epc_target,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_to_if_epc_taken,	// @[playground/src/EX_stage.scala:6:12]
                EX_to_if_Br_B_taken,	// @[playground/src/EX_stage.scala:6:12]
  output [31:0] EX_to_if_Br_B_target,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_to_if_flush,	// @[playground/src/EX_stage.scala:6:12]
                EX_ar_valid,	// @[playground/src/EX_stage.scala:6:12]
  output [31:0] EX_ar_bits_addr,	// @[playground/src/EX_stage.scala:6:12]
  output [2:0]  EX_ar_bits_prot,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_aw_valid,	// @[playground/src/EX_stage.scala:6:12]
  output [31:0] EX_aw_bits_addr,	// @[playground/src/EX_stage.scala:6:12]
  output [2:0]  EX_aw_bits_prot,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_w_valid,	// @[playground/src/EX_stage.scala:6:12]
  output [31:0] EX_w_bits_data,	// @[playground/src/EX_stage.scala:6:12]
  output [7:0]  EX_w_bits_strb,	// @[playground/src/EX_stage.scala:6:12]
  output        EX_b_ready	// @[playground/src/EX_stage.scala:6:12]
);

  wire        _Csr_alu_io_wen;	// @[playground/src/EX_stage.scala:92:21]
  wire [31:0] _Csr_alu_io_out;	// @[playground/src/EX_stage.scala:92:21]
  wire [31:0] _Alu_io_result;	// @[playground/src/EX_stage.scala:36:17]
  wire        ld_wen = |EX_IO_bits_ld_type;	// @[playground/src/EX_stage.scala:22:28, :61:37]
  reg         ex_valid;	// @[playground/src/EX_stage.scala:25:33]
  wire        st_wen;	// @[playground/src/EX_stage.scala:23:28]
  wire        ex_ready_go =
    ~(~EX_ar_ready & ld_wen | ~(EX_aw_ready & EX_w_ready) & st_wen);	// @[playground/src/EX_stage.scala:22:28, :23:28, :25:33, :26:33, :27:{19,21,33}, :28:{17,21,34,47}]
  wire        _EX_IO_ready_output = ~ex_valid | ex_ready_go & EX_to_ls_ready;	// @[playground/src/EX_stage.scala:25:33, :26:33, :29:{18,28,43}]
  wire        _EX_to_if_Br_B_taken_output = EX_IO_bits_b_taken & ex_valid;	// @[playground/src/EX_stage.scala:25:33, :43:42]
  wire        _EX_to_if_epc_target_T = EX_IO_bits_csr_cmd == 5'h3;	// @[playground/src/EX_stage.scala:57:39]
  wire        _EX_to_if_epc_target_T_1 = EX_IO_bits_csr_cmd == 5'h4;	// @[playground/src/EX_stage.scala:58:39]
  assign st_wen = |EX_IO_bits_st_type;	// @[playground/src/EX_stage.scala:23:28, :72:30]
  wire        _EX_aw_valid_T = st_wen & ex_valid;	// @[playground/src/EX_stage.scala:23:28, :25:33, :79:21]
  wire        _EX_to_id_csr_wen_output = _Csr_alu_io_wen & ex_valid;	// @[playground/src/EX_stage.scala:25:33, :92:21, :97:35]
  wire        _EX_to_id_csr_ecpt_wen_output = _EX_to_if_epc_target_T_1 & ex_valid;	// @[playground/src/EX_stage.scala:25:33, :58:39, :99:58]
  wire        _EX_to_ls_bits_dpic_bundle_ex_is_jal_T = EX_IO_bits_br_type == 4'h7;	// @[playground/src/EX_stage.scala:128:62]
  always @(posedge clock) begin	// @[<stdin>:1197:11]
    if (reset)	// @[<stdin>:1197:11]
      ex_valid <= 1'h0;	// @[playground/src/EX_stage.scala:25:33]
    else if (_EX_IO_ready_output)	// @[playground/src/EX_stage.scala:29:28]
      ex_valid <= EX_IO_valid;	// @[playground/src/EX_stage.scala:25:33]
  end // always @(posedge)
  Alu Alu (	// @[playground/src/EX_stage.scala:36:17]
    .io_op     (EX_IO_bits_alu_op),
    .io_src1   (EX_IO_bits_src1),
    .io_src2   (EX_IO_bits_src2),
    .io_result (_Alu_io_result)
  );
  Csr_alu Csr_alu (	// @[playground/src/EX_stage.scala:92:21]
    .io_csr_cmd   (EX_IO_bits_csr_cmd),
    .io_in_csr    (_Alu_io_result),	// @[playground/src/EX_stage.scala:36:17]
    .io_in_rdata1 (EX_IO_bits_rdata1),
    .io_wen       (_Csr_alu_io_wen),
    .io_out       (_Csr_alu_io_out)
  );
  assign EX_IO_ready = _EX_IO_ready_output;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:29:28]
  assign EX_to_ls_valid = ex_valid & ex_ready_go;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:25:33, :26:33, :33:28]
  assign EX_to_ls_bits_csr_commit_wen = _EX_to_id_csr_wen_output;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:97:35]
  assign EX_to_ls_bits_csr_commit_waddr = EX_IO_bits_csr_addr;	// @[<stdin>:1196:3]
  assign EX_to_ls_bits_csr_commit_wdata = _Csr_alu_io_out;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:92:21]
  assign EX_to_ls_bits_csr_commit_exception_wen = _EX_to_id_csr_ecpt_wen_output;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:99:58]
  assign EX_to_ls_bits_csr_commit_exception_pc_wb = EX_IO_bits_pc;	// @[<stdin>:1196:3]
  assign EX_to_ls_bits_dpic_bundle_id_inv_flag = EX_IO_bits_dpic_bundle_id_inv_flag;	// @[<stdin>:1196:3]
  assign EX_to_ls_bits_dpic_bundle_ex_func_flag =
    _EX_to_ls_bits_dpic_bundle_ex_is_jal_T | EX_IO_bits_br_type == 4'h8;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:128:{62,72,92}]
  assign EX_to_ls_bits_dpic_bundle_ex_is_jal = _EX_to_ls_bits_dpic_bundle_ex_is_jal_T;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:128:62]
  assign EX_to_ls_bits_dpic_bundle_ex_is_ret = EX_IO_bits_inst == 32'h8067;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:130:55]
  assign EX_to_ls_bits_dpic_bundle_ex_is_rd0 = EX_IO_bits_rd == 5'h0;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:65:24, :131:53]
  assign EX_to_ls_bits_ld_wen = ld_wen;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:22:28]
  assign EX_to_ls_bits_ld_type = EX_IO_bits_ld_type;	// @[<stdin>:1196:3]
  assign EX_to_ls_bits_csr_cmd = EX_IO_bits_csr_cmd;	// @[<stdin>:1196:3]
  assign EX_to_ls_bits_wb_sel = EX_IO_bits_wb_sel;	// @[<stdin>:1196:3]
  assign EX_to_ls_bits_rf_wen = EX_IO_bits_rf_wen;	// @[<stdin>:1196:3]
  assign EX_to_ls_bits_rd = EX_IO_bits_rd;	// @[<stdin>:1196:3]
  assign EX_to_ls_bits_result = _Alu_io_result;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:36:17]
  assign EX_to_ls_bits_nextpc = EX_IO_bits_nextpc;	// @[<stdin>:1196:3]
  assign EX_to_ls_bits_pc = EX_IO_bits_pc;	// @[<stdin>:1196:3]
  assign EX_to_ls_bits_inst = EX_IO_bits_inst;	// @[<stdin>:1196:3]
  assign EX_to_id_fw_addr = ex_valid & EX_IO_bits_rf_wen ? EX_IO_bits_rd : 5'h0;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:25:33, :65:{24,34}]
  assign EX_to_id_fw_data = _Alu_io_result;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:36:17]
  assign EX_to_id_csr_ecpt_wen = _EX_to_id_csr_ecpt_wen_output;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:99:58]
  assign EX_to_id_csr_ecpt_pc_wb = EX_IO_bits_pc;	// @[<stdin>:1196:3]
  assign EX_to_id_csr_waddr = EX_IO_bits_csr_addr;	// @[<stdin>:1196:3]
  assign EX_to_id_csr_wen = _EX_to_id_csr_wen_output;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:97:35]
  assign EX_to_id_csr_wdata = _Csr_alu_io_out;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:92:21]
  assign EX_to_id_clog = (|EX_IO_bits_ld_type) & ex_valid;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:25:33, :61:{37,44}]
  assign EX_to_if_epc_target =
    _EX_to_if_epc_target_T
      ? EX_IO_bits_csr_global_mepc
      : _EX_to_if_epc_target_T_1 ? EX_IO_bits_csr_global_mtvec : 32'h0;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:44:58, :57:39, :58:39, :104:27, :105:28]
  assign EX_to_if_epc_taken = EX_IO_bits_pc_sel & ex_valid;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:25:33, :103:51]
  assign EX_to_if_Br_B_taken = _EX_to_if_Br_B_taken_output;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:43:42]
  assign EX_to_if_Br_B_target =
    EX_IO_bits_br_type == 4'h6 | EX_IO_bits_br_type == 4'h5 | EX_IO_bits_br_type == 4'h4
    | EX_IO_bits_br_type == 4'h3 | EX_IO_bits_br_type == 4'h2 | EX_IO_bits_br_type == 4'h1
      ? _Alu_io_result
      : 32'h0;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:36:17, :44:58]
  assign EX_to_if_flush =
    (_EX_to_if_Br_B_taken_output | _EX_to_if_epc_target_T | _EX_to_if_epc_target_T_1)
    & ex_valid;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:25:33, :43:42, :57:39, :58:{17,39,53}]
  assign EX_ar_valid = ld_wen & ex_valid;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:22:28, :25:33, :75:22]
  assign EX_ar_bits_addr = _Alu_io_result;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:36:17]
  assign EX_ar_bits_prot = 3'h0;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:77:18]
  assign EX_aw_valid = _EX_aw_valid_T;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:79:21]
  assign EX_aw_bits_addr = _Alu_io_result;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:36:17]
  assign EX_aw_bits_prot = 3'h0;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:77:18]
  assign EX_w_valid = _EX_aw_valid_T;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:79:21]
  assign EX_w_bits_data = EX_IO_bits_rdata2;	// @[<stdin>:1196:3]
  assign EX_w_bits_strb = {4'h0, EX_IO_bits_st_type};	// @[<stdin>:1196:3, playground/src/EX_stage.scala:72:30, :81:17]
  assign EX_b_ready = 1'h1;	// @[<stdin>:1196:3, playground/src/EX_stage.scala:27:19]
endmodule

