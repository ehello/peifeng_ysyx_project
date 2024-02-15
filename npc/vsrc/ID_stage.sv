// Generated by CIRCT firtool-1.56.0
module ID_stage(	// @[<stdin>:810:3]
  input         clock,	// @[<stdin>:811:11]
                reset,	// @[<stdin>:812:11]
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
                ID_to_ex_bits_inst	// @[playground/src/ID_stage.scala:7:12]
);

  wire [31:0] _Regfile_io_rdata1;	// @[playground/src/ID_stage.scala:50:21]
  wire [31:0] _Regfile_io_rdata2;	// @[playground/src/ID_stage.scala:50:21]
  wire        _dc_io_A_sel;	// @[playground/src/ID_stage.scala:26:16]
  wire        _dc_io_B_sel;	// @[playground/src/ID_stage.scala:26:16]
  wire [2:0]  _dc_io_imm_sel;	// @[playground/src/ID_stage.scala:26:16]
  wire        _dc_io_wb_en;	// @[playground/src/ID_stage.scala:26:16]
  wire [4:0]  _dc_io_csr_cmd;	// @[playground/src/ID_stage.scala:26:16]
  wire        _dc_io_illegal;	// @[playground/src/ID_stage.scala:26:16]
  wire        id_ready_go = 1'h1;	// @[playground/src/ID_stage.scala:18:33, :19:14]
  reg         id_valid;	// @[playground/src/ID_stage.scala:17:33]
  wire        _ID_IO_ready_output = ~id_valid | id_ready_go & ID_to_ex_ready;	// @[playground/src/ID_stage.scala:17:33, :18:33, :20:{18,28,43}]
  wire [4:0]  rs2 = ID_IO_bits_inst[24:20];	// @[playground/src/ID_stage.scala:30:25, :43:25]
  wire [4:0]  rs1 = ID_IO_bits_inst[19:15];	// @[playground/src/ID_stage.scala:29:25, :44:25]
  wire [2:0]  funct3 = ID_IO_bits_inst[14:12];	// @[playground/src/ID_stage.scala:31:28, :45:28]
  wire [4:0]  rd = ID_IO_bits_inst[11:7];	// @[playground/src/ID_stage.scala:32:24, :46:24]
  wire [6:0]  opcode = ID_IO_bits_inst[6:0];	// @[playground/src/ID_stage.scala:33:28, :47:28]
  wire [11:0] csr_addr = ID_IO_bits_inst[31:20];	// @[playground/src/ID_stage.scala:34:30, :48:30]
  wire [4:0]  _Regfile_io_raddr2_T_3 =
    _dc_io_csr_cmd == 5'h4 ? 5'hF : _dc_io_csr_cmd == 5'h5 ? 5'hA : rs2;	// @[playground/src/ID_stage.scala:26:16, :30:25, :52:50]
  wire        _rdata1_T = rs1 == ID_ex_fw_addr;	// @[playground/src/ID_stage.scala:29:25, :64:67]
  wire        _rdata1_T_1 = rs1 == ID_ls_fw_addr;	// @[playground/src/ID_stage.scala:29:25, :65:37]
  wire        rs1_is_forward =
    (|rs1) & (_rdata1_T | _rdata1_T_1 | ID_wb_bus_wen & rs1 == ID_wb_bus_waddr);	// @[playground/src/ID_stage.scala:29:25, :62:36, :64:{37,45,67}, :65:{37,55}, :66:{34,55}]
  wire        _rdata2_T = _Regfile_io_raddr2_T_3 == ID_ex_fw_addr;	// @[playground/src/ID_stage.scala:52:50, :67:67]
  wire        _rdata2_T_1 = _Regfile_io_raddr2_T_3 == ID_ls_fw_addr;	// @[playground/src/ID_stage.scala:52:50, :68:37]
  wire        rs2_is_forward =
    (|_Regfile_io_raddr2_T_3)
    & (_rdata2_T | _rdata2_T_1 | ID_wb_bus_wen
       & _Regfile_io_raddr2_T_3 == ID_wb_bus_waddr);	// @[playground/src/ID_stage.scala:52:50, :63:36, :67:{37,45,67}, :68:{37,55}, :69:{34,55}]
  wire [31:0] rdata1 =
    rs1_is_forward
      ? (_rdata1_T ? ID_ex_fw_data : _rdata1_T_1 ? ID_ls_fw_data : ID_wb_bus_wdata)
      : _Regfile_io_rdata1;	// @[playground/src/ID_stage.scala:50:21, :60:28, :62:36, :64:67, :65:37, :70:14, :71:16, :72:16]
  wire [31:0] rdata2 =
    rs2_is_forward
      ? (_rdata2_T ? ID_ex_fw_data : _rdata2_T_1 ? ID_ls_fw_data : ID_wb_bus_wdata)
      : _Regfile_io_rdata2;	// @[playground/src/ID_stage.scala:50:21, :61:28, :63:36, :67:67, :68:37, :75:14, :76:16, :77:16]
  wire [31:0] imm;	// @[playground/src/ID_stage.scala:28:25]
  always @(posedge clock) begin	// @[<stdin>:811:11]
    if (reset)	// @[<stdin>:811:11]
      id_valid <= 1'h0;	// @[playground/src/ID_stage.scala:17:33]
    else if (_ID_IO_ready_output)	// @[playground/src/ID_stage.scala:20:28]
      id_valid <= ID_IO_valid;	// @[playground/src/ID_stage.scala:17:33]
  end // always @(posedge)
  Decode dc (	// @[playground/src/ID_stage.scala:26:16]
    .io_inst    (ID_IO_bits_inst),
    .io_pc_sel  (ID_to_ex_bits_pc_sel),
    .io_A_sel   (_dc_io_A_sel),
    .io_B_sel   (_dc_io_B_sel),
    .io_imm_sel (_dc_io_imm_sel),
    .io_alu_op  (ID_to_ex_bits_alu_op),
    .io_br_type (ID_to_ex_bits_br_type),
    .io_st_type (ID_to_ex_bits_st_type),
    .io_ld_type (ID_to_ex_bits_ld_type),
    .io_wb_sel  (ID_to_ex_bits_wb_sel),
    .io_wb_en   (_dc_io_wb_en),
    .io_csr_cmd (_dc_io_csr_cmd),
    .io_illegal (_dc_io_illegal)
  );
  ImmGen ImmGen (	// @[playground/src/ID_stage.scala:27:20]
    .io_inst (ID_IO_bits_inst),
    .io_sel  (_dc_io_imm_sel),	// @[playground/src/ID_stage.scala:26:16]
    .io_out  (imm)
  );
  RegFile Regfile (	// @[playground/src/ID_stage.scala:50:21]
    .clock     (clock),
    .reset     (reset),
    .io_waddr  (ID_wb_bus_waddr),
    .io_wdata  (ID_wb_bus_wdata),
    .io_raddr1 (rs1),	// @[playground/src/ID_stage.scala:29:25]
    .io_raddr2 (_Regfile_io_raddr2_T_3),	// @[playground/src/ID_stage.scala:52:50]
    .io_wen    (ID_wb_bus_wen),
    .io_rdata1 (_Regfile_io_rdata1),
    .io_rdata2 (_Regfile_io_rdata2)
  );
  assign ID_IO_ready = _ID_IO_ready_output;	// @[<stdin>:810:3, playground/src/ID_stage.scala:20:28]
  assign ID_to_ex_valid = ~ID_flush & id_valid & id_ready_go;	// @[<stdin>:810:3, playground/src/ID_stage.scala:17:33, :18:33, :24:22]
  assign ID_to_ex_bits_dpic_bundle_id_inv_flag =
    _dc_io_illegal & ID_IO_bits_nextpc != 32'h80000000;	// @[<stdin>:810:3, playground/src/ID_stage.scala:26:16, :116:{56,75}]
  assign ID_to_ex_bits_csr_addr = csr_addr;	// @[<stdin>:810:3, playground/src/ID_stage.scala:34:30]
  assign ID_to_ex_bits_csr_cmd = _dc_io_csr_cmd;	// @[<stdin>:810:3, playground/src/ID_stage.scala:26:16]
  assign ID_to_ex_bits_ebreak_flag = _dc_io_csr_cmd == 5'h5;	// @[<stdin>:810:3, playground/src/ID_stage.scala:26:16, :52:50, :101:44]
  assign ID_to_ex_bits_wen = _dc_io_wb_en & id_valid;	// @[<stdin>:810:3, playground/src/ID_stage.scala:17:33, :26:16, :104:34]
  assign ID_to_ex_bits_rd = rd;	// @[<stdin>:810:3, playground/src/ID_stage.scala:32:24]
  assign ID_to_ex_bits_src1 = _dc_io_A_sel ? rdata1 : ID_IO_bits_pc;	// @[<stdin>:810:3, playground/src/ID_stage.scala:26:16, :60:28, :82:38]
  assign ID_to_ex_bits_src2 = _dc_io_B_sel ? rdata2 : imm;	// @[<stdin>:810:3, playground/src/ID_stage.scala:26:16, :28:25, :61:28, :86:38]
  assign ID_to_ex_bits_rdata1 = _Regfile_io_rdata1;	// @[<stdin>:810:3, playground/src/ID_stage.scala:50:21]
  assign ID_to_ex_bits_rdata2 = _Regfile_io_rdata2;	// @[<stdin>:810:3, playground/src/ID_stage.scala:50:21]
  assign ID_to_ex_bits_nextpc = ID_IO_bits_nextpc;	// @[<stdin>:810:3]
  assign ID_to_ex_bits_pc = ID_IO_bits_pc;	// @[<stdin>:810:3]
  assign ID_to_ex_bits_inst = ID_IO_bits_inst;	// @[<stdin>:810:3]
endmodule

