// Generated by CIRCT firtool-1.56.0
module ID_stage(	// @[<stdin>:830:3]
  input         clock,	// @[<stdin>:831:11]
                reset,	// @[<stdin>:832:11]
                ID_IO_valid,	// @[playground/src/ID_stage.scala:7:12]
  input  [31:0] ID_IO_bits_nextpc,	// @[playground/src/ID_stage.scala:7:12]
                ID_IO_bits_pc,	// @[playground/src/ID_stage.scala:7:12]
                ID_IO_bits_inst,	// @[playground/src/ID_stage.scala:7:12]
  input         ID_to_ex_ready,	// @[playground/src/ID_stage.scala:7:12]
  input  [4:0]  ID_ex_fw_addr,	// @[playground/src/ID_stage.scala:7:12]
  input  [31:0] ID_ex_fw_data,	// @[playground/src/ID_stage.scala:7:12]
  input  [4:0]  ID_ls_fw_addr,	// @[playground/src/ID_stage.scala:7:12]
  input  [31:0] ID_ls_fw_data,	// @[playground/src/ID_stage.scala:7:12]
  input  [4:0]  ID_wb_bus_waddr,	// @[playground/src/ID_stage.scala:7:12]
  input  [31:0] ID_wb_bus_wdata,	// @[playground/src/ID_stage.scala:7:12]
  input         ID_wb_bus_wen,	// @[playground/src/ID_stage.scala:7:12]
                ID_flush,	// @[playground/src/ID_stage.scala:7:12]
                ID_for_ex_clog,	// @[playground/src/ID_stage.scala:7:12]
                ID_for_ls_clog,	// @[playground/src/ID_stage.scala:7:12]
  output        ID_IO_ready,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_valid,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_bits_dpic_bundle_id_inv_flag,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_bits_pc_sel,	// @[playground/src/ID_stage.scala:7:12]
  output [11:0] ID_to_ex_bits_csr_addr,	// @[playground/src/ID_stage.scala:7:12]
  output [4:0]  ID_to_ex_bits_csr_cmd,	// @[playground/src/ID_stage.scala:7:12]
  output [7:0]  ID_to_ex_bits_st_type,	// @[playground/src/ID_stage.scala:7:12]
  output [2:0]  ID_to_ex_bits_ld_type,	// @[playground/src/ID_stage.scala:7:12]
  output        ID_to_ex_bits_ebreak_flag,	// @[playground/src/ID_stage.scala:7:12]
  output [1:0]  ID_to_ex_bits_wb_sel,	// @[playground/src/ID_stage.scala:7:12]
  output [3:0]  ID_to_ex_bits_br_type,	// @[playground/src/ID_stage.scala:7:12]
  output        ID_to_ex_bits_wen,	// @[playground/src/ID_stage.scala:7:12]
  output [4:0]  ID_to_ex_bits_rd,	// @[playground/src/ID_stage.scala:7:12]
  output [3:0]  ID_to_ex_bits_alu_op,	// @[playground/src/ID_stage.scala:7:12]
  output [31:0] ID_to_ex_bits_src1,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_bits_src2,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_bits_rdata1,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_bits_rdata2,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_bits_nextpc,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_bits_pc,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_bits_inst,	// @[playground/src/ID_stage.scala:7:12]
  output        ID_flush_out,	// @[playground/src/ID_stage.scala:7:12]
                ID_j_cond_taken,	// @[playground/src/ID_stage.scala:7:12]
  output [31:0] ID_j_cond_target	// @[playground/src/ID_stage.scala:7:12]
);

  wire        _J_cond_io_taken;	// @[playground/src/ID_stage.scala:105:20]
  wire [31:0] _Regfile_io_rdata1;	// @[playground/src/ID_stage.scala:56:21]
  wire [31:0] _Regfile_io_rdata2;	// @[playground/src/ID_stage.scala:56:21]
  wire        _dc_io_A_sel;	// @[playground/src/ID_stage.scala:32:16]
  wire        _dc_io_B_sel;	// @[playground/src/ID_stage.scala:32:16]
  wire [2:0]  _dc_io_imm_sel;	// @[playground/src/ID_stage.scala:32:16]
  wire [3:0]  _dc_io_br_type;	// @[playground/src/ID_stage.scala:32:16]
  wire        _dc_io_wb_en;	// @[playground/src/ID_stage.scala:32:16]
  wire [4:0]  _dc_io_csr_cmd;	// @[playground/src/ID_stage.scala:32:16]
  wire        _dc_io_illegal;	// @[playground/src/ID_stage.scala:32:16]
  wire        id_clog = ID_for_ex_clog | ID_for_ls_clog;	// @[playground/src/ID_stage.scala:20:29, :21:27]
  reg         id_valid;	// @[playground/src/ID_stage.scala:23:33]
  wire        id_ready_go = ~id_clog;	// @[playground/src/ID_stage.scala:20:29, :23:33, :24:33, :25:19]
  wire        _ID_IO_ready_output = ~id_valid | id_ready_go & ID_to_ex_ready;	// @[playground/src/ID_stage.scala:23:33, :24:33, :26:{18,28,43}]
  wire [4:0]  rs2 = ID_IO_bits_inst[24:20];	// @[playground/src/ID_stage.scala:36:25, :49:25]
  wire [4:0]  rs1 = ID_IO_bits_inst[19:15];	// @[playground/src/ID_stage.scala:35:25, :50:25]
  wire [2:0]  funct3 = ID_IO_bits_inst[14:12];	// @[playground/src/ID_stage.scala:37:28, :51:28]
  wire [4:0]  rd = ID_IO_bits_inst[11:7];	// @[playground/src/ID_stage.scala:38:24, :52:24]
  wire [6:0]  opcode = ID_IO_bits_inst[6:0];	// @[playground/src/ID_stage.scala:39:28, :53:28]
  wire [11:0] csr_addr = ID_IO_bits_inst[31:20];	// @[playground/src/ID_stage.scala:40:30, :54:30]
  wire [4:0]  _Regfile_io_raddr2_T_3 =
    _dc_io_csr_cmd == 5'h4 ? 5'hF : _dc_io_csr_cmd == 5'h5 ? 5'hA : rs2;	// @[playground/src/ID_stage.scala:32:16, :36:25, :58:50]
  wire        _rdata1_T = rs1 == ID_ex_fw_addr;	// @[playground/src/ID_stage.scala:35:25, :72:38]
  wire        _rdata1_T_1 = rs1 == ID_ls_fw_addr;	// @[playground/src/ID_stage.scala:35:25, :73:37]
  wire        rs1_is_forward =
    (|rs1) & ~id_clog
    & (_rdata1_T | _rdata1_T_1 | ID_wb_bus_wen & rs1 == ID_wb_bus_waddr);	// @[playground/src/ID_stage.scala:20:29, :35:25, :68:36, :70:38, :71:{27,39}, :72:38, :73:{37,55}, :74:{34,55}]
  wire        _rdata2_T = _Regfile_io_raddr2_T_3 == ID_ex_fw_addr;	// @[playground/src/ID_stage.scala:58:50, :77:38]
  wire        _rdata2_T_1 = _Regfile_io_raddr2_T_3 == ID_ls_fw_addr;	// @[playground/src/ID_stage.scala:58:50, :78:37]
  wire        rs2_is_forward =
    (|_Regfile_io_raddr2_T_3) & ~id_clog
    & (_rdata2_T | _rdata2_T_1 | ID_wb_bus_wen
       & _Regfile_io_raddr2_T_3 == ID_wb_bus_waddr);	// @[playground/src/ID_stage.scala:20:29, :58:50, :69:36, :71:27, :75:38, :76:39, :77:38, :78:{37,55}, :79:{34,55}]
  wire [31:0] rdata1 =
    rs1_is_forward
      ? (_rdata1_T ? ID_ex_fw_data : _rdata1_T_1 ? ID_ls_fw_data : ID_wb_bus_wdata)
      : _Regfile_io_rdata1;	// @[playground/src/ID_stage.scala:56:21, :66:28, :68:36, :72:38, :73:37, :80:14, :81:16, :82:16]
  wire [31:0] rdata2 =
    rs2_is_forward
      ? (_rdata2_T ? ID_ex_fw_data : _rdata2_T_1 ? ID_ls_fw_data : ID_wb_bus_wdata)
      : _Regfile_io_rdata2;	// @[playground/src/ID_stage.scala:56:21, :67:28, :69:36, :77:38, :78:37, :85:14, :86:16, :87:16]
  wire [31:0] src1 = _dc_io_A_sel ? rdata1 : ID_IO_bits_pc;	// @[playground/src/ID_stage.scala:32:16, :66:28, :92:38]
  wire [31:0] imm;	// @[playground/src/ID_stage.scala:34:25]
  wire [31:0] src2 = _dc_io_B_sel ? rdata2 : imm;	// @[playground/src/ID_stage.scala:32:16, :34:25, :67:28, :96:38]
  wire        _ID_flush_out_T = _J_cond_io_taken & id_valid;	// @[playground/src/ID_stage.scala:23:33, :105:20, :109:35]
  always @(posedge clock) begin	// @[<stdin>:831:11]
    if (reset)	// @[<stdin>:831:11]
      id_valid <= 1'h0;	// @[playground/src/ID_stage.scala:23:33]
    else if (_ID_IO_ready_output)	// @[playground/src/ID_stage.scala:26:28]
      id_valid <= ID_IO_valid;	// @[playground/src/ID_stage.scala:23:33]
  end // always @(posedge)
  Decode dc (	// @[playground/src/ID_stage.scala:32:16]
    .io_inst    (ID_IO_bits_inst),
    .io_pc_sel  (ID_to_ex_bits_pc_sel),
    .io_A_sel   (_dc_io_A_sel),
    .io_B_sel   (_dc_io_B_sel),
    .io_imm_sel (_dc_io_imm_sel),
    .io_alu_op  (ID_to_ex_bits_alu_op),
    .io_br_type (_dc_io_br_type),
    .io_st_type (ID_to_ex_bits_st_type),
    .io_ld_type (ID_to_ex_bits_ld_type),
    .io_wb_sel  (ID_to_ex_bits_wb_sel),
    .io_wb_en   (_dc_io_wb_en),
    .io_csr_cmd (_dc_io_csr_cmd),
    .io_illegal (_dc_io_illegal)
  );
  ImmGen ImmGen (	// @[playground/src/ID_stage.scala:33:20]
    .io_inst (ID_IO_bits_inst),
    .io_sel  (_dc_io_imm_sel),	// @[playground/src/ID_stage.scala:32:16]
    .io_out  (imm)
  );
  RegFile Regfile (	// @[playground/src/ID_stage.scala:56:21]
    .clock     (clock),
    .reset     (reset),
    .io_waddr  (ID_wb_bus_waddr),
    .io_wdata  (ID_wb_bus_wdata),
    .io_raddr1 (rs1),	// @[playground/src/ID_stage.scala:35:25]
    .io_raddr2 (_Regfile_io_raddr2_T_3),	// @[playground/src/ID_stage.scala:58:50]
    .io_wen    (ID_wb_bus_wen),
    .io_rdata1 (_Regfile_io_rdata1),
    .io_rdata2 (_Regfile_io_rdata2)
  );
  Br_j J_cond (	// @[playground/src/ID_stage.scala:105:20]
    .io_br_type (_dc_io_br_type),	// @[playground/src/ID_stage.scala:32:16]
    .io_rdata1  (src1),	// @[playground/src/ID_stage.scala:92:38]
    .io_rdata2  (src2),	// @[playground/src/ID_stage.scala:96:38]
    .io_taken   (_J_cond_io_taken),
    .io_target  (ID_j_cond_target)
  );
  assign ID_IO_ready = _ID_IO_ready_output;	// @[<stdin>:830:3, playground/src/ID_stage.scala:26:28]
  assign ID_to_ex_valid = ~ID_flush & id_valid & id_ready_go;	// @[<stdin>:830:3, playground/src/ID_stage.scala:23:33, :24:33, :30:22]
  assign ID_to_ex_bits_dpic_bundle_id_inv_flag =
    _dc_io_illegal & ID_IO_bits_nextpc != 32'h80000000;	// @[<stdin>:830:3, playground/src/ID_stage.scala:32:16, :138:{56,75}]
  assign ID_to_ex_bits_csr_addr = csr_addr;	// @[<stdin>:830:3, playground/src/ID_stage.scala:40:30]
  assign ID_to_ex_bits_csr_cmd = _dc_io_csr_cmd;	// @[<stdin>:830:3, playground/src/ID_stage.scala:32:16]
  assign ID_to_ex_bits_ebreak_flag = _dc_io_csr_cmd == 5'h5;	// @[<stdin>:830:3, playground/src/ID_stage.scala:32:16, :58:50, :123:44]
  assign ID_to_ex_bits_br_type = _dc_io_br_type;	// @[<stdin>:830:3, playground/src/ID_stage.scala:32:16]
  assign ID_to_ex_bits_wen = _dc_io_wb_en & id_valid;	// @[<stdin>:830:3, playground/src/ID_stage.scala:23:33, :32:16, :126:34]
  assign ID_to_ex_bits_rd = rd;	// @[<stdin>:830:3, playground/src/ID_stage.scala:38:24]
  assign ID_to_ex_bits_src1 = src1;	// @[<stdin>:830:3, playground/src/ID_stage.scala:92:38]
  assign ID_to_ex_bits_src2 = src2;	// @[<stdin>:830:3, playground/src/ID_stage.scala:96:38]
  assign ID_to_ex_bits_rdata1 = _Regfile_io_rdata1;	// @[<stdin>:830:3, playground/src/ID_stage.scala:56:21]
  assign ID_to_ex_bits_rdata2 = _Regfile_io_rdata2;	// @[<stdin>:830:3, playground/src/ID_stage.scala:56:21]
  assign ID_to_ex_bits_nextpc = ID_IO_bits_nextpc;	// @[<stdin>:830:3]
  assign ID_to_ex_bits_pc = ID_IO_bits_pc;	// @[<stdin>:830:3]
  assign ID_to_ex_bits_inst = ID_IO_bits_inst;	// @[<stdin>:830:3]
  assign ID_flush_out = _ID_flush_out_T;	// @[<stdin>:830:3, playground/src/ID_stage.scala:109:35]
  assign ID_j_cond_taken = _ID_flush_out_T;	// @[<stdin>:830:3, playground/src/ID_stage.scala:109:35]
endmodule

