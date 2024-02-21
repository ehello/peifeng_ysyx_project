// Generated by CIRCT firtool-1.56.0
module SimTop(	// @[<stdin>:1502:3]
  input         clock,	// @[<stdin>:1503:11]
                reset,	// @[<stdin>:1504:11]
  output [4:0]  io_debug_waddr,	// @[playground/src/SimTop.scala:6:14]
  output [31:0] io_debug_wdata,	// @[playground/src/SimTop.scala:6:14]
  output        io_debug_wen	// @[playground/src/SimTop.scala:6:14]
);

  wire [31:0] _Sram_io_out_rdata;	// @[playground/src/SimTop.scala:17:20]
  wire        _Sram_io_out_rdata_ok;	// @[playground/src/SimTop.scala:17:20]
  wire        _Sram_io_out_wdata_ok;	// @[playground/src/SimTop.scala:17:20]
  wire        _Br_option_io_out_taken;	// @[playground/src/SimTop.scala:16:23]
  wire [31:0] _Br_option_io_out_target;	// @[playground/src/SimTop.scala:16:23]
  wire        _WB_stage_WB_IO_ready;	// @[playground/src/SimTop.scala:15:24]
  wire [4:0]  _WB_stage_WB_to_rf_waddr;	// @[playground/src/SimTop.scala:15:24]
  wire [31:0] _WB_stage_WB_to_rf_wdata;	// @[playground/src/SimTop.scala:15:24]
  wire        _WB_stage_WB_to_rf_wen;	// @[playground/src/SimTop.scala:15:24]
  wire [31:0] _WB_stage_WB_to_if_csr_epc;	// @[playground/src/SimTop.scala:15:24]
  wire        _WB_stage_WB_to_if_epc_wen;	// @[playground/src/SimTop.scala:15:24]
  wire        _LS_stage_LS_IO_ready;	// @[playground/src/SimTop.scala:14:24]
  wire [4:0]  _LS_stage_LS_bypass_id_addr;	// @[playground/src/SimTop.scala:14:24]
  wire [31:0] _LS_stage_LS_bypass_id_data;	// @[playground/src/SimTop.scala:14:24]
  wire        _LS_stage_LS_to_wb_valid;	// @[playground/src/SimTop.scala:14:24]
  wire        _LS_stage_LS_to_wb_bits_dpic_bundle_id_inv_flag;	// @[playground/src/SimTop.scala:14:24]
  wire        _LS_stage_LS_to_wb_bits_dpic_bundle_ex_func_flag;	// @[playground/src/SimTop.scala:14:24]
  wire        _LS_stage_LS_to_wb_bits_dpic_bundle_ex_is_jal;	// @[playground/src/SimTop.scala:14:24]
  wire        _LS_stage_LS_to_wb_bits_dpic_bundle_ex_is_ret;	// @[playground/src/SimTop.scala:14:24]
  wire        _LS_stage_LS_to_wb_bits_dpic_bundle_ex_is_rd0;	// @[playground/src/SimTop.scala:14:24]
  wire        _LS_stage_LS_to_wb_bits_pc_sel;	// @[playground/src/SimTop.scala:14:24]
  wire [11:0] _LS_stage_LS_to_wb_bits_csr_addr;	// @[playground/src/SimTop.scala:14:24]
  wire [4:0]  _LS_stage_LS_to_wb_bits_csr_cmd;	// @[playground/src/SimTop.scala:14:24]
  wire        _LS_stage_LS_to_wb_bits_ebreak_flag;	// @[playground/src/SimTop.scala:14:24]
  wire        _LS_stage_LS_to_wb_bits_wen;	// @[playground/src/SimTop.scala:14:24]
  wire [4:0]  _LS_stage_LS_to_wb_bits_rd;	// @[playground/src/SimTop.scala:14:24]
  wire [31:0] _LS_stage_LS_to_wb_bits_result;	// @[playground/src/SimTop.scala:14:24]
  wire [31:0] _LS_stage_LS_to_wb_bits_nextpc;	// @[playground/src/SimTop.scala:14:24]
  wire [31:0] _LS_stage_LS_to_wb_bits_pc;	// @[playground/src/SimTop.scala:14:24]
  wire [31:0] _LS_stage_LS_to_wb_bits_inst;	// @[playground/src/SimTop.scala:14:24]
  wire        _EX_stage_EX_IO_ready;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_to_ls_valid;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_to_ls_bits_dpic_bundle_id_inv_flag;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_to_ls_bits_dpic_bundle_ex_func_flag;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_to_ls_bits_dpic_bundle_ex_is_jal;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_to_ls_bits_dpic_bundle_ex_is_ret;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_to_ls_bits_dpic_bundle_ex_is_rd0;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_to_ls_bits_pc_sel;	// @[playground/src/SimTop.scala:13:24]
  wire [11:0] _EX_stage_EX_to_ls_bits_csr_addr;	// @[playground/src/SimTop.scala:13:24]
  wire [4:0]  _EX_stage_EX_to_ls_bits_csr_cmd;	// @[playground/src/SimTop.scala:13:24]
  wire [2:0]  _EX_stage_EX_to_ls_bits_ld_type;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_to_ls_bits_ebreak_flag;	// @[playground/src/SimTop.scala:13:24]
  wire [1:0]  _EX_stage_EX_to_ls_bits_wb_sel;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_to_ls_bits_wen;	// @[playground/src/SimTop.scala:13:24]
  wire [4:0]  _EX_stage_EX_to_ls_bits_rd;	// @[playground/src/SimTop.scala:13:24]
  wire [31:0] _EX_stage_EX_to_ls_bits_result;	// @[playground/src/SimTop.scala:13:24]
  wire [31:0] _EX_stage_EX_to_ls_bits_nextpc;	// @[playground/src/SimTop.scala:13:24]
  wire [31:0] _EX_stage_EX_to_ls_bits_pc;	// @[playground/src/SimTop.scala:13:24]
  wire [31:0] _EX_stage_EX_to_ls_bits_inst;	// @[playground/src/SimTop.scala:13:24]
  wire [4:0]  _EX_stage_EX_bypass_id_addr;	// @[playground/src/SimTop.scala:13:24]
  wire [31:0] _EX_stage_EX_bypass_id_data;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_clog_id;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_flush_out;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_br_bus_taken;	// @[playground/src/SimTop.scala:13:24]
  wire [31:0] _EX_stage_EX_br_bus_target;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_data_sram_st_wen;	// @[playground/src/SimTop.scala:13:24]
  wire        _EX_stage_EX_data_sram_ld_wen;	// @[playground/src/SimTop.scala:13:24]
  wire [31:0] _EX_stage_EX_data_sram_addr;	// @[playground/src/SimTop.scala:13:24]
  wire [7:0]  _EX_stage_EX_data_sram_wmask;	// @[playground/src/SimTop.scala:13:24]
  wire [31:0] _EX_stage_EX_data_sram_wdata;	// @[playground/src/SimTop.scala:13:24]
  wire        _ID_stage_ID_IO_ready;	// @[playground/src/SimTop.scala:12:24]
  wire        _ID_stage_ID_to_ex_valid;	// @[playground/src/SimTop.scala:12:24]
  wire        _ID_stage_ID_to_ex_bits_dpic_bundle_id_inv_flag;	// @[playground/src/SimTop.scala:12:24]
  wire        _ID_stage_ID_to_ex_bits_pc_sel;	// @[playground/src/SimTop.scala:12:24]
  wire [11:0] _ID_stage_ID_to_ex_bits_csr_addr;	// @[playground/src/SimTop.scala:12:24]
  wire [4:0]  _ID_stage_ID_to_ex_bits_csr_cmd;	// @[playground/src/SimTop.scala:12:24]
  wire        _ID_stage_ID_to_ex_bits_b_taken;	// @[playground/src/SimTop.scala:12:24]
  wire [7:0]  _ID_stage_ID_to_ex_bits_st_type;	// @[playground/src/SimTop.scala:12:24]
  wire [2:0]  _ID_stage_ID_to_ex_bits_ld_type;	// @[playground/src/SimTop.scala:12:24]
  wire        _ID_stage_ID_to_ex_bits_ebreak_flag;	// @[playground/src/SimTop.scala:12:24]
  wire [1:0]  _ID_stage_ID_to_ex_bits_wb_sel;	// @[playground/src/SimTop.scala:12:24]
  wire [3:0]  _ID_stage_ID_to_ex_bits_br_type;	// @[playground/src/SimTop.scala:12:24]
  wire        _ID_stage_ID_to_ex_bits_wen;	// @[playground/src/SimTop.scala:12:24]
  wire [4:0]  _ID_stage_ID_to_ex_bits_rd;	// @[playground/src/SimTop.scala:12:24]
  wire [3:0]  _ID_stage_ID_to_ex_bits_alu_op;	// @[playground/src/SimTop.scala:12:24]
  wire [31:0] _ID_stage_ID_to_ex_bits_src1;	// @[playground/src/SimTop.scala:12:24]
  wire [31:0] _ID_stage_ID_to_ex_bits_src2;	// @[playground/src/SimTop.scala:12:24]
  wire [31:0] _ID_stage_ID_to_ex_bits_rdata2;	// @[playground/src/SimTop.scala:12:24]
  wire [31:0] _ID_stage_ID_to_ex_bits_nextpc;	// @[playground/src/SimTop.scala:12:24]
  wire [31:0] _ID_stage_ID_to_ex_bits_pc;	// @[playground/src/SimTop.scala:12:24]
  wire [31:0] _ID_stage_ID_to_ex_bits_inst;	// @[playground/src/SimTop.scala:12:24]
  wire        _ID_stage_ID_flush_out;	// @[playground/src/SimTop.scala:12:24]
  wire        _ID_stage_ID_j_cond_taken;	// @[playground/src/SimTop.scala:12:24]
  wire [31:0] _ID_stage_ID_j_cond_target;	// @[playground/src/SimTop.scala:12:24]
  wire        _IF_stage_IF_IO_valid;	// @[playground/src/SimTop.scala:11:24]
  wire [31:0] _IF_stage_IF_IO_bits_nextpc;	// @[playground/src/SimTop.scala:11:24]
  wire [31:0] _IF_stage_IF_IO_bits_pc;	// @[playground/src/SimTop.scala:11:24]
  wire [31:0] _IF_stage_IF_IO_bits_inst;	// @[playground/src/SimTop.scala:11:24]
  reg  [31:0] ID_stage_ID_IO_bits_r_nextpc;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] ID_stage_ID_IO_bits_r_pc;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] ID_stage_ID_IO_bits_r_inst;	// @[playground/src/SimTop.scala:67:27]
  reg         EX_stage_EX_IO_bits_r_dpic_bundle_id_inv_flag;	// @[playground/src/SimTop.scala:67:27]
  reg         EX_stage_EX_IO_bits_r_pc_sel;	// @[playground/src/SimTop.scala:67:27]
  reg  [11:0] EX_stage_EX_IO_bits_r_csr_addr;	// @[playground/src/SimTop.scala:67:27]
  reg  [4:0]  EX_stage_EX_IO_bits_r_csr_cmd;	// @[playground/src/SimTop.scala:67:27]
  reg         EX_stage_EX_IO_bits_r_b_taken;	// @[playground/src/SimTop.scala:67:27]
  reg  [7:0]  EX_stage_EX_IO_bits_r_st_type;	// @[playground/src/SimTop.scala:67:27]
  reg  [2:0]  EX_stage_EX_IO_bits_r_ld_type;	// @[playground/src/SimTop.scala:67:27]
  reg         EX_stage_EX_IO_bits_r_ebreak_flag;	// @[playground/src/SimTop.scala:67:27]
  reg  [1:0]  EX_stage_EX_IO_bits_r_wb_sel;	// @[playground/src/SimTop.scala:67:27]
  reg  [3:0]  EX_stage_EX_IO_bits_r_br_type;	// @[playground/src/SimTop.scala:67:27]
  reg         EX_stage_EX_IO_bits_r_wen;	// @[playground/src/SimTop.scala:67:27]
  reg  [4:0]  EX_stage_EX_IO_bits_r_rd;	// @[playground/src/SimTop.scala:67:27]
  reg  [3:0]  EX_stage_EX_IO_bits_r_alu_op;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] EX_stage_EX_IO_bits_r_src1;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] EX_stage_EX_IO_bits_r_src2;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] EX_stage_EX_IO_bits_r_rdata2;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] EX_stage_EX_IO_bits_r_nextpc;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] EX_stage_EX_IO_bits_r_pc;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] EX_stage_EX_IO_bits_r_inst;	// @[playground/src/SimTop.scala:67:27]
  reg         LS_stage_LS_IO_bits_r_dpic_bundle_id_inv_flag;	// @[playground/src/SimTop.scala:67:27]
  reg         LS_stage_LS_IO_bits_r_dpic_bundle_ex_func_flag;	// @[playground/src/SimTop.scala:67:27]
  reg         LS_stage_LS_IO_bits_r_dpic_bundle_ex_is_jal;	// @[playground/src/SimTop.scala:67:27]
  reg         LS_stage_LS_IO_bits_r_dpic_bundle_ex_is_ret;	// @[playground/src/SimTop.scala:67:27]
  reg         LS_stage_LS_IO_bits_r_dpic_bundle_ex_is_rd0;	// @[playground/src/SimTop.scala:67:27]
  reg         LS_stage_LS_IO_bits_r_pc_sel;	// @[playground/src/SimTop.scala:67:27]
  reg  [11:0] LS_stage_LS_IO_bits_r_csr_addr;	// @[playground/src/SimTop.scala:67:27]
  reg  [4:0]  LS_stage_LS_IO_bits_r_csr_cmd;	// @[playground/src/SimTop.scala:67:27]
  reg  [2:0]  LS_stage_LS_IO_bits_r_ld_type;	// @[playground/src/SimTop.scala:67:27]
  reg         LS_stage_LS_IO_bits_r_ebreak_flag;	// @[playground/src/SimTop.scala:67:27]
  reg  [1:0]  LS_stage_LS_IO_bits_r_wb_sel;	// @[playground/src/SimTop.scala:67:27]
  reg         LS_stage_LS_IO_bits_r_wen;	// @[playground/src/SimTop.scala:67:27]
  reg  [4:0]  LS_stage_LS_IO_bits_r_rd;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] LS_stage_LS_IO_bits_r_result;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] LS_stage_LS_IO_bits_r_nextpc;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] LS_stage_LS_IO_bits_r_pc;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] LS_stage_LS_IO_bits_r_inst;	// @[playground/src/SimTop.scala:67:27]
  reg         WB_stage_WB_IO_bits_r_dpic_bundle_id_inv_flag;	// @[playground/src/SimTop.scala:67:27]
  reg         WB_stage_WB_IO_bits_r_dpic_bundle_ex_func_flag;	// @[playground/src/SimTop.scala:67:27]
  reg         WB_stage_WB_IO_bits_r_dpic_bundle_ex_is_jal;	// @[playground/src/SimTop.scala:67:27]
  reg         WB_stage_WB_IO_bits_r_dpic_bundle_ex_is_ret;	// @[playground/src/SimTop.scala:67:27]
  reg         WB_stage_WB_IO_bits_r_dpic_bundle_ex_is_rd0;	// @[playground/src/SimTop.scala:67:27]
  reg         WB_stage_WB_IO_bits_r_pc_sel;	// @[playground/src/SimTop.scala:67:27]
  reg  [11:0] WB_stage_WB_IO_bits_r_csr_addr;	// @[playground/src/SimTop.scala:67:27]
  reg  [4:0]  WB_stage_WB_IO_bits_r_csr_cmd;	// @[playground/src/SimTop.scala:67:27]
  reg         WB_stage_WB_IO_bits_r_ebreak_flag;	// @[playground/src/SimTop.scala:67:27]
  reg         WB_stage_WB_IO_bits_r_wen;	// @[playground/src/SimTop.scala:67:27]
  reg  [4:0]  WB_stage_WB_IO_bits_r_rd;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] WB_stage_WB_IO_bits_r_result;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] WB_stage_WB_IO_bits_r_nextpc;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] WB_stage_WB_IO_bits_r_pc;	// @[playground/src/SimTop.scala:67:27]
  reg  [31:0] WB_stage_WB_IO_bits_r_inst;	// @[playground/src/SimTop.scala:67:27]
  always @(posedge clock) begin	// @[<stdin>:1503:11]
    if (_ID_stage_ID_IO_ready & _IF_stage_IF_IO_valid) begin	// @[playground/src/SimTop.scala:11:24, :12:24, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      ID_stage_ID_IO_bits_r_nextpc <= _IF_stage_IF_IO_bits_nextpc;	// @[playground/src/SimTop.scala:11:24, :67:27]
      ID_stage_ID_IO_bits_r_pc <= _IF_stage_IF_IO_bits_pc;	// @[playground/src/SimTop.scala:11:24, :67:27]
      ID_stage_ID_IO_bits_r_inst <= _IF_stage_IF_IO_bits_inst;	// @[playground/src/SimTop.scala:11:24, :67:27]
    end
    if (_EX_stage_EX_IO_ready & _ID_stage_ID_to_ex_valid) begin	// @[playground/src/SimTop.scala:12:24, :13:24, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      EX_stage_EX_IO_bits_r_dpic_bundle_id_inv_flag <=
        _ID_stage_ID_to_ex_bits_dpic_bundle_id_inv_flag;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_pc_sel <= _ID_stage_ID_to_ex_bits_pc_sel;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_csr_addr <= _ID_stage_ID_to_ex_bits_csr_addr;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_csr_cmd <= _ID_stage_ID_to_ex_bits_csr_cmd;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_b_taken <= _ID_stage_ID_to_ex_bits_b_taken;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_st_type <= _ID_stage_ID_to_ex_bits_st_type;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_ld_type <= _ID_stage_ID_to_ex_bits_ld_type;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_ebreak_flag <= _ID_stage_ID_to_ex_bits_ebreak_flag;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_wb_sel <= _ID_stage_ID_to_ex_bits_wb_sel;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_br_type <= _ID_stage_ID_to_ex_bits_br_type;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_wen <= _ID_stage_ID_to_ex_bits_wen;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_rd <= _ID_stage_ID_to_ex_bits_rd;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_alu_op <= _ID_stage_ID_to_ex_bits_alu_op;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_src1 <= _ID_stage_ID_to_ex_bits_src1;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_src2 <= _ID_stage_ID_to_ex_bits_src2;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_rdata2 <= _ID_stage_ID_to_ex_bits_rdata2;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_nextpc <= _ID_stage_ID_to_ex_bits_nextpc;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_pc <= _ID_stage_ID_to_ex_bits_pc;	// @[playground/src/SimTop.scala:12:24, :67:27]
      EX_stage_EX_IO_bits_r_inst <= _ID_stage_ID_to_ex_bits_inst;	// @[playground/src/SimTop.scala:12:24, :67:27]
    end
    if (_LS_stage_LS_IO_ready & _EX_stage_EX_to_ls_valid) begin	// @[playground/src/SimTop.scala:13:24, :14:24, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      LS_stage_LS_IO_bits_r_dpic_bundle_id_inv_flag <=
        _EX_stage_EX_to_ls_bits_dpic_bundle_id_inv_flag;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_dpic_bundle_ex_func_flag <=
        _EX_stage_EX_to_ls_bits_dpic_bundle_ex_func_flag;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_dpic_bundle_ex_is_jal <=
        _EX_stage_EX_to_ls_bits_dpic_bundle_ex_is_jal;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_dpic_bundle_ex_is_ret <=
        _EX_stage_EX_to_ls_bits_dpic_bundle_ex_is_ret;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_dpic_bundle_ex_is_rd0 <=
        _EX_stage_EX_to_ls_bits_dpic_bundle_ex_is_rd0;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_pc_sel <= _EX_stage_EX_to_ls_bits_pc_sel;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_csr_addr <= _EX_stage_EX_to_ls_bits_csr_addr;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_csr_cmd <= _EX_stage_EX_to_ls_bits_csr_cmd;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_ld_type <= _EX_stage_EX_to_ls_bits_ld_type;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_ebreak_flag <= _EX_stage_EX_to_ls_bits_ebreak_flag;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_wb_sel <= _EX_stage_EX_to_ls_bits_wb_sel;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_wen <= _EX_stage_EX_to_ls_bits_wen;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_rd <= _EX_stage_EX_to_ls_bits_rd;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_result <= _EX_stage_EX_to_ls_bits_result;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_nextpc <= _EX_stage_EX_to_ls_bits_nextpc;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_pc <= _EX_stage_EX_to_ls_bits_pc;	// @[playground/src/SimTop.scala:13:24, :67:27]
      LS_stage_LS_IO_bits_r_inst <= _EX_stage_EX_to_ls_bits_inst;	// @[playground/src/SimTop.scala:13:24, :67:27]
    end
    if (_WB_stage_WB_IO_ready & _LS_stage_LS_to_wb_valid) begin	// @[playground/src/SimTop.scala:14:24, :15:24, src/main/scala/chisel3/util/Decoupled.scala:52:35]
      WB_stage_WB_IO_bits_r_dpic_bundle_id_inv_flag <=
        _LS_stage_LS_to_wb_bits_dpic_bundle_id_inv_flag;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_dpic_bundle_ex_func_flag <=
        _LS_stage_LS_to_wb_bits_dpic_bundle_ex_func_flag;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_dpic_bundle_ex_is_jal <=
        _LS_stage_LS_to_wb_bits_dpic_bundle_ex_is_jal;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_dpic_bundle_ex_is_ret <=
        _LS_stage_LS_to_wb_bits_dpic_bundle_ex_is_ret;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_dpic_bundle_ex_is_rd0 <=
        _LS_stage_LS_to_wb_bits_dpic_bundle_ex_is_rd0;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_pc_sel <= _LS_stage_LS_to_wb_bits_pc_sel;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_csr_addr <= _LS_stage_LS_to_wb_bits_csr_addr;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_csr_cmd <= _LS_stage_LS_to_wb_bits_csr_cmd;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_ebreak_flag <= _LS_stage_LS_to_wb_bits_ebreak_flag;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_wen <= _LS_stage_LS_to_wb_bits_wen;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_rd <= _LS_stage_LS_to_wb_bits_rd;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_result <= _LS_stage_LS_to_wb_bits_result;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_nextpc <= _LS_stage_LS_to_wb_bits_nextpc;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_pc <= _LS_stage_LS_to_wb_bits_pc;	// @[playground/src/SimTop.scala:14:24, :67:27]
      WB_stage_WB_IO_bits_r_inst <= _LS_stage_LS_to_wb_bits_inst;	// @[playground/src/SimTop.scala:14:24, :67:27]
    end
  end // always @(posedge)
  IF_stage IF_stage (	// @[playground/src/SimTop.scala:11:24]
    .clock              (clock),
    .reset              (reset),
    .IF_IO_ready        (_ID_stage_ID_IO_ready),	// @[playground/src/SimTop.scala:12:24]
    .IF_br_bus_taken    (_Br_option_io_out_taken),	// @[playground/src/SimTop.scala:16:23]
    .IF_br_bus_target   (_Br_option_io_out_target),	// @[playground/src/SimTop.scala:16:23]
    .IF_epc_bus_csr_epc (_WB_stage_WB_to_if_csr_epc),	// @[playground/src/SimTop.scala:15:24]
    .IF_epc_bus_epc_wen (_WB_stage_WB_to_if_epc_wen),	// @[playground/src/SimTop.scala:15:24]
    .IF_flush           (_EX_stage_EX_flush_out | _ID_stage_ID_flush_out),	// @[playground/src/SimTop.scala:12:24, :13:24, :26:44]
    .IF_IO_valid        (_IF_stage_IF_IO_valid),
    .IF_IO_bits_nextpc  (_IF_stage_IF_IO_bits_nextpc),
    .IF_IO_bits_pc      (_IF_stage_IF_IO_bits_pc),
    .IF_IO_bits_inst    (_IF_stage_IF_IO_bits_inst)
  );
  ID_stage ID_stage (	// @[playground/src/SimTop.scala:12:24]
    .clock                                 (clock),
    .reset                                 (reset),
    .ID_IO_valid                           (_IF_stage_IF_IO_valid),	// @[playground/src/SimTop.scala:11:24]
    .ID_IO_bits_nextpc                     (ID_stage_ID_IO_bits_r_nextpc),	// @[playground/src/SimTop.scala:67:27]
    .ID_IO_bits_pc                         (ID_stage_ID_IO_bits_r_pc),	// @[playground/src/SimTop.scala:67:27]
    .ID_IO_bits_inst                       (ID_stage_ID_IO_bits_r_inst),	// @[playground/src/SimTop.scala:67:27]
    .ID_to_ex_ready                        (_EX_stage_EX_IO_ready),	// @[playground/src/SimTop.scala:13:24]
    .ID_ex_fw_addr                         (_EX_stage_EX_bypass_id_addr),	// @[playground/src/SimTop.scala:13:24]
    .ID_ex_fw_data                         (_EX_stage_EX_bypass_id_data),	// @[playground/src/SimTop.scala:13:24]
    .ID_ls_fw_addr                         (_LS_stage_LS_bypass_id_addr),	// @[playground/src/SimTop.scala:14:24]
    .ID_ls_fw_data                         (_LS_stage_LS_bypass_id_data),	// @[playground/src/SimTop.scala:14:24]
    .ID_wb_bus_waddr                       (_WB_stage_WB_to_rf_waddr),	// @[playground/src/SimTop.scala:15:24]
    .ID_wb_bus_wdata                       (_WB_stage_WB_to_rf_wdata),	// @[playground/src/SimTop.scala:15:24]
    .ID_wb_bus_wen                         (_WB_stage_WB_to_rf_wen),	// @[playground/src/SimTop.scala:15:24]
    .ID_for_ex_clog                        (_EX_stage_EX_clog_id),	// @[playground/src/SimTop.scala:13:24]
    .ID_IO_ready                           (_ID_stage_ID_IO_ready),
    .ID_to_ex_valid                        (_ID_stage_ID_to_ex_valid),
    .ID_to_ex_bits_dpic_bundle_id_inv_flag
      (_ID_stage_ID_to_ex_bits_dpic_bundle_id_inv_flag),
    .ID_to_ex_bits_pc_sel                  (_ID_stage_ID_to_ex_bits_pc_sel),
    .ID_to_ex_bits_csr_addr                (_ID_stage_ID_to_ex_bits_csr_addr),
    .ID_to_ex_bits_csr_cmd                 (_ID_stage_ID_to_ex_bits_csr_cmd),
    .ID_to_ex_bits_b_taken                 (_ID_stage_ID_to_ex_bits_b_taken),
    .ID_to_ex_bits_st_type                 (_ID_stage_ID_to_ex_bits_st_type),
    .ID_to_ex_bits_ld_type                 (_ID_stage_ID_to_ex_bits_ld_type),
    .ID_to_ex_bits_ebreak_flag             (_ID_stage_ID_to_ex_bits_ebreak_flag),
    .ID_to_ex_bits_wb_sel                  (_ID_stage_ID_to_ex_bits_wb_sel),
    .ID_to_ex_bits_br_type                 (_ID_stage_ID_to_ex_bits_br_type),
    .ID_to_ex_bits_wen                     (_ID_stage_ID_to_ex_bits_wen),
    .ID_to_ex_bits_rd                      (_ID_stage_ID_to_ex_bits_rd),
    .ID_to_ex_bits_alu_op                  (_ID_stage_ID_to_ex_bits_alu_op),
    .ID_to_ex_bits_src1                    (_ID_stage_ID_to_ex_bits_src1),
    .ID_to_ex_bits_src2                    (_ID_stage_ID_to_ex_bits_src2),
    .ID_to_ex_bits_rdata2                  (_ID_stage_ID_to_ex_bits_rdata2),
    .ID_to_ex_bits_nextpc                  (_ID_stage_ID_to_ex_bits_nextpc),
    .ID_to_ex_bits_pc                      (_ID_stage_ID_to_ex_bits_pc),
    .ID_to_ex_bits_inst                    (_ID_stage_ID_to_ex_bits_inst),
    .ID_flush_out                          (_ID_stage_ID_flush_out),
    .ID_j_cond_taken                       (_ID_stage_ID_j_cond_taken),
    .ID_j_cond_target                      (_ID_stage_ID_j_cond_target)
  );
  EX_stage EX_stage (	// @[playground/src/SimTop.scala:13:24]
    .clock                                  (clock),
    .reset                                  (reset),
    .EX_IO_valid                            (_ID_stage_ID_to_ex_valid),	// @[playground/src/SimTop.scala:12:24]
    .EX_IO_bits_dpic_bundle_id_inv_flag
      (EX_stage_EX_IO_bits_r_dpic_bundle_id_inv_flag),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_pc_sel                      (EX_stage_EX_IO_bits_r_pc_sel),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_csr_addr                    (EX_stage_EX_IO_bits_r_csr_addr),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_csr_cmd                     (EX_stage_EX_IO_bits_r_csr_cmd),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_b_taken                     (EX_stage_EX_IO_bits_r_b_taken),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_st_type                     (EX_stage_EX_IO_bits_r_st_type),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_ld_type                     (EX_stage_EX_IO_bits_r_ld_type),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_ebreak_flag                 (EX_stage_EX_IO_bits_r_ebreak_flag),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_wb_sel                      (EX_stage_EX_IO_bits_r_wb_sel),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_br_type                     (EX_stage_EX_IO_bits_r_br_type),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_wen                         (EX_stage_EX_IO_bits_r_wen),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_rd                          (EX_stage_EX_IO_bits_r_rd),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_alu_op                      (EX_stage_EX_IO_bits_r_alu_op),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_src1                        (EX_stage_EX_IO_bits_r_src1),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_src2                        (EX_stage_EX_IO_bits_r_src2),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_rdata2                      (EX_stage_EX_IO_bits_r_rdata2),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_nextpc                      (EX_stage_EX_IO_bits_r_nextpc),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_pc                          (EX_stage_EX_IO_bits_r_pc),	// @[playground/src/SimTop.scala:67:27]
    .EX_IO_bits_inst                        (EX_stage_EX_IO_bits_r_inst),	// @[playground/src/SimTop.scala:67:27]
    .EX_to_ls_ready                         (_LS_stage_LS_IO_ready),	// @[playground/src/SimTop.scala:14:24]
    .EX_IO_ready                            (_EX_stage_EX_IO_ready),
    .EX_to_ls_valid                         (_EX_stage_EX_to_ls_valid),
    .EX_to_ls_bits_dpic_bundle_id_inv_flag
      (_EX_stage_EX_to_ls_bits_dpic_bundle_id_inv_flag),
    .EX_to_ls_bits_dpic_bundle_ex_func_flag
      (_EX_stage_EX_to_ls_bits_dpic_bundle_ex_func_flag),
    .EX_to_ls_bits_dpic_bundle_ex_is_jal
      (_EX_stage_EX_to_ls_bits_dpic_bundle_ex_is_jal),
    .EX_to_ls_bits_dpic_bundle_ex_is_ret
      (_EX_stage_EX_to_ls_bits_dpic_bundle_ex_is_ret),
    .EX_to_ls_bits_dpic_bundle_ex_is_rd0
      (_EX_stage_EX_to_ls_bits_dpic_bundle_ex_is_rd0),
    .EX_to_ls_bits_pc_sel                   (_EX_stage_EX_to_ls_bits_pc_sel),
    .EX_to_ls_bits_csr_addr                 (_EX_stage_EX_to_ls_bits_csr_addr),
    .EX_to_ls_bits_csr_cmd                  (_EX_stage_EX_to_ls_bits_csr_cmd),
    .EX_to_ls_bits_ld_type                  (_EX_stage_EX_to_ls_bits_ld_type),
    .EX_to_ls_bits_ebreak_flag              (_EX_stage_EX_to_ls_bits_ebreak_flag),
    .EX_to_ls_bits_wb_sel                   (_EX_stage_EX_to_ls_bits_wb_sel),
    .EX_to_ls_bits_wen                      (_EX_stage_EX_to_ls_bits_wen),
    .EX_to_ls_bits_rd                       (_EX_stage_EX_to_ls_bits_rd),
    .EX_to_ls_bits_result                   (_EX_stage_EX_to_ls_bits_result),
    .EX_to_ls_bits_nextpc                   (_EX_stage_EX_to_ls_bits_nextpc),
    .EX_to_ls_bits_pc                       (_EX_stage_EX_to_ls_bits_pc),
    .EX_to_ls_bits_inst                     (_EX_stage_EX_to_ls_bits_inst),
    .EX_bypass_id_addr                      (_EX_stage_EX_bypass_id_addr),
    .EX_bypass_id_data                      (_EX_stage_EX_bypass_id_data),
    .EX_clog_id                             (_EX_stage_EX_clog_id),
    .EX_flush_out                           (_EX_stage_EX_flush_out),
    .EX_br_bus_taken                        (_EX_stage_EX_br_bus_taken),
    .EX_br_bus_target                       (_EX_stage_EX_br_bus_target),
    .EX_data_sram_st_wen                    (_EX_stage_EX_data_sram_st_wen),
    .EX_data_sram_ld_wen                    (_EX_stage_EX_data_sram_ld_wen),
    .EX_data_sram_addr                      (_EX_stage_EX_data_sram_addr),
    .EX_data_sram_wmask                     (_EX_stage_EX_data_sram_wmask),
    .EX_data_sram_wdata                     (_EX_stage_EX_data_sram_wdata)
  );
  LS_stage LS_stage (	// @[playground/src/SimTop.scala:14:24]
    .clock                                  (clock),
    .reset                                  (reset),
    .LS_IO_valid                            (_EX_stage_EX_to_ls_valid),	// @[playground/src/SimTop.scala:13:24]
    .LS_IO_bits_dpic_bundle_id_inv_flag
      (LS_stage_LS_IO_bits_r_dpic_bundle_id_inv_flag),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_dpic_bundle_ex_func_flag
      (LS_stage_LS_IO_bits_r_dpic_bundle_ex_func_flag),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_dpic_bundle_ex_is_jal       (LS_stage_LS_IO_bits_r_dpic_bundle_ex_is_jal),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_dpic_bundle_ex_is_ret       (LS_stage_LS_IO_bits_r_dpic_bundle_ex_is_ret),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_dpic_bundle_ex_is_rd0       (LS_stage_LS_IO_bits_r_dpic_bundle_ex_is_rd0),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_pc_sel                      (LS_stage_LS_IO_bits_r_pc_sel),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_csr_addr                    (LS_stage_LS_IO_bits_r_csr_addr),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_csr_cmd                     (LS_stage_LS_IO_bits_r_csr_cmd),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_ld_type                     (LS_stage_LS_IO_bits_r_ld_type),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_ebreak_flag                 (LS_stage_LS_IO_bits_r_ebreak_flag),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_wb_sel                      (LS_stage_LS_IO_bits_r_wb_sel),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_wen                         (LS_stage_LS_IO_bits_r_wen),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_rd                          (LS_stage_LS_IO_bits_r_rd),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_result                      (LS_stage_LS_IO_bits_r_result),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_nextpc                      (LS_stage_LS_IO_bits_r_nextpc),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_pc                          (LS_stage_LS_IO_bits_r_pc),	// @[playground/src/SimTop.scala:67:27]
    .LS_IO_bits_inst                        (LS_stage_LS_IO_bits_r_inst),	// @[playground/src/SimTop.scala:67:27]
    .LS_to_wb_ready                         (_WB_stage_WB_IO_ready),	// @[playground/src/SimTop.scala:15:24]
    .LS_data_sram_rdata                     (_Sram_io_out_rdata),	// @[playground/src/SimTop.scala:17:20]
    .LS_data_sram_rdata_ok                  (_Sram_io_out_rdata_ok),	// @[playground/src/SimTop.scala:17:20]
    .LS_data_sram_wdata_ok                  (_Sram_io_out_wdata_ok),	// @[playground/src/SimTop.scala:17:20]
    .LS_IO_ready                            (_LS_stage_LS_IO_ready),
    .LS_bypass_id_addr                      (_LS_stage_LS_bypass_id_addr),
    .LS_bypass_id_data                      (_LS_stage_LS_bypass_id_data),
    .LS_to_wb_valid                         (_LS_stage_LS_to_wb_valid),
    .LS_to_wb_bits_dpic_bundle_id_inv_flag
      (_LS_stage_LS_to_wb_bits_dpic_bundle_id_inv_flag),
    .LS_to_wb_bits_dpic_bundle_ex_func_flag
      (_LS_stage_LS_to_wb_bits_dpic_bundle_ex_func_flag),
    .LS_to_wb_bits_dpic_bundle_ex_is_jal
      (_LS_stage_LS_to_wb_bits_dpic_bundle_ex_is_jal),
    .LS_to_wb_bits_dpic_bundle_ex_is_ret
      (_LS_stage_LS_to_wb_bits_dpic_bundle_ex_is_ret),
    .LS_to_wb_bits_dpic_bundle_ex_is_rd0
      (_LS_stage_LS_to_wb_bits_dpic_bundle_ex_is_rd0),
    .LS_to_wb_bits_pc_sel                   (_LS_stage_LS_to_wb_bits_pc_sel),
    .LS_to_wb_bits_csr_addr                 (_LS_stage_LS_to_wb_bits_csr_addr),
    .LS_to_wb_bits_csr_cmd                  (_LS_stage_LS_to_wb_bits_csr_cmd),
    .LS_to_wb_bits_ebreak_flag              (_LS_stage_LS_to_wb_bits_ebreak_flag),
    .LS_to_wb_bits_wen                      (_LS_stage_LS_to_wb_bits_wen),
    .LS_to_wb_bits_rd                       (_LS_stage_LS_to_wb_bits_rd),
    .LS_to_wb_bits_result                   (_LS_stage_LS_to_wb_bits_result),
    .LS_to_wb_bits_nextpc                   (_LS_stage_LS_to_wb_bits_nextpc),
    .LS_to_wb_bits_pc                       (_LS_stage_LS_to_wb_bits_pc),
    .LS_to_wb_bits_inst                     (_LS_stage_LS_to_wb_bits_inst)
  );
  WB_stage WB_stage (	// @[playground/src/SimTop.scala:15:24]
    .clock                               (clock),
    .reset                               (reset),
    .WB_IO_valid                         (_LS_stage_LS_to_wb_valid),	// @[playground/src/SimTop.scala:14:24]
    .WB_IO_bits_dpic_bundle_id_inv_flag  (WB_stage_WB_IO_bits_r_dpic_bundle_id_inv_flag),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_dpic_bundle_ex_func_flag (WB_stage_WB_IO_bits_r_dpic_bundle_ex_func_flag),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_dpic_bundle_ex_is_jal    (WB_stage_WB_IO_bits_r_dpic_bundle_ex_is_jal),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_dpic_bundle_ex_is_ret    (WB_stage_WB_IO_bits_r_dpic_bundle_ex_is_ret),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_dpic_bundle_ex_is_rd0    (WB_stage_WB_IO_bits_r_dpic_bundle_ex_is_rd0),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_pc_sel                   (WB_stage_WB_IO_bits_r_pc_sel),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_csr_addr                 (WB_stage_WB_IO_bits_r_csr_addr),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_csr_cmd                  (WB_stage_WB_IO_bits_r_csr_cmd),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_ebreak_flag              (WB_stage_WB_IO_bits_r_ebreak_flag),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_wen                      (WB_stage_WB_IO_bits_r_wen),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_rd                       (WB_stage_WB_IO_bits_r_rd),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_result                   (WB_stage_WB_IO_bits_r_result),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_nextpc                   (WB_stage_WB_IO_bits_r_nextpc),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_pc                       (WB_stage_WB_IO_bits_r_pc),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_bits_inst                     (WB_stage_WB_IO_bits_r_inst),	// @[playground/src/SimTop.scala:67:27]
    .WB_IO_ready                         (_WB_stage_WB_IO_ready),
    .WB_to_rf_waddr                      (_WB_stage_WB_to_rf_waddr),
    .WB_to_rf_wdata                      (_WB_stage_WB_to_rf_wdata),
    .WB_to_rf_wen                        (_WB_stage_WB_to_rf_wen),
    .WB_to_if_csr_epc                    (_WB_stage_WB_to_if_csr_epc),
    .WB_to_if_epc_wen                    (_WB_stage_WB_to_if_epc_wen),
    .WB_debug_waddr                      (io_debug_waddr),
    .WB_debug_wdata                      (io_debug_wdata),
    .WB_debug_wen                        (io_debug_wen)
  );
  Br_option Br_option (	// @[playground/src/SimTop.scala:16:23]
    .io_Jtype_taken  (_ID_stage_ID_j_cond_taken),	// @[playground/src/SimTop.scala:12:24]
    .io_Jtype_target (_ID_stage_ID_j_cond_target),	// @[playground/src/SimTop.scala:12:24]
    .io_Btype_taken  (_EX_stage_EX_br_bus_taken),	// @[playground/src/SimTop.scala:13:24]
    .io_Btype_target (_EX_stage_EX_br_bus_target),	// @[playground/src/SimTop.scala:13:24]
    .io_out_taken    (_Br_option_io_out_taken),
    .io_out_target   (_Br_option_io_out_target)
  );
  Sram Sram (	// @[playground/src/SimTop.scala:17:20]
    .clock           (clock),
    .reset           (reset),
    .io_in_st_wen    (_EX_stage_EX_data_sram_st_wen),	// @[playground/src/SimTop.scala:13:24]
    .io_in_ld_wen    (_EX_stage_EX_data_sram_ld_wen),	// @[playground/src/SimTop.scala:13:24]
    .io_in_addr      (_EX_stage_EX_data_sram_addr),	// @[playground/src/SimTop.scala:13:24]
    .io_in_wmask     (_EX_stage_EX_data_sram_wmask),	// @[playground/src/SimTop.scala:13:24]
    .io_in_wdata     (_EX_stage_EX_data_sram_wdata),	// @[playground/src/SimTop.scala:13:24]
    .io_out_rdata    (_Sram_io_out_rdata),
    .io_out_rdata_ok (_Sram_io_out_rdata_ok),
    .io_out_wdata_ok (_Sram_io_out_wdata_ok)
  );
endmodule

