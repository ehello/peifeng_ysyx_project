// Generated by CIRCT firtool-1.56.0
module ID_stage(	// @[<stdin>:817:3]
  input         clock,	// @[<stdin>:818:11]
                reset,	// @[<stdin>:819:11]
                ID_IO_valid,	// @[playground/src/ID_stage.scala:7:12]
  input  [31:0] ID_IO_bits_nextpc,	// @[playground/src/ID_stage.scala:7:12]
                ID_IO_bits_pc,	// @[playground/src/ID_stage.scala:7:12]
                ID_IO_bits_inst,	// @[playground/src/ID_stage.scala:7:12]
  input         ID_to_ex_ready,	// @[playground/src/ID_stage.scala:7:12]
  input  [4:0]  ID_wb_bus_waddr,	// @[playground/src/ID_stage.scala:7:12]
  input  [31:0] ID_wb_bus_wdata,	// @[playground/src/ID_stage.scala:7:12]
  input         ID_wb_bus_wen,	// @[playground/src/ID_stage.scala:7:12]
  output        ID_IO_ready,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_valid,	// @[playground/src/ID_stage.scala:7:12]
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

  wire [31:0] _Regfile_io_rdata1;	// @[playground/src/ID_stage.scala:47:21]
  wire [31:0] _Regfile_io_rdata2;	// @[playground/src/ID_stage.scala:47:21]
  wire        _dc_io_A_sel;	// @[playground/src/ID_stage.scala:23:16]
  wire        _dc_io_B_sel;	// @[playground/src/ID_stage.scala:23:16]
  wire [2:0]  _dc_io_imm_sel;	// @[playground/src/ID_stage.scala:23:16]
  wire [4:0]  _dc_io_csr_cmd;	// @[playground/src/ID_stage.scala:23:16]
  wire        _dc_io_illegal;	// @[playground/src/ID_stage.scala:23:16]
  wire        id_ready_go = 1'h1;	// @[playground/src/ID_stage.scala:15:33, :16:14]
  reg         id_valid;	// @[playground/src/ID_stage.scala:14:33]
  wire        _ID_IO_ready_output = ~id_valid | id_ready_go & ID_to_ex_ready;	// @[playground/src/ID_stage.scala:14:33, :15:33, :17:{18,28,43}]
  wire [4:0]  rs2 = ID_IO_bits_inst[24:20];	// @[playground/src/ID_stage.scala:27:25, :40:25]
  wire [4:0]  rs1 = ID_IO_bits_inst[19:15];	// @[playground/src/ID_stage.scala:26:25, :41:25]
  wire [2:0]  funct3 = ID_IO_bits_inst[14:12];	// @[playground/src/ID_stage.scala:28:28, :42:28]
  wire [4:0]  rd = ID_IO_bits_inst[11:7];	// @[playground/src/ID_stage.scala:29:24, :43:24]
  wire [6:0]  opcode = ID_IO_bits_inst[6:0];	// @[playground/src/ID_stage.scala:30:28, :44:28]
  wire [11:0] csr_addr = ID_IO_bits_inst[31:20];	// @[playground/src/ID_stage.scala:31:30, :45:30]
  wire [31:0] imm;	// @[playground/src/ID_stage.scala:25:25]
  reg         inv_flag;	// @[playground/src/ID_stage.scala:92:19]
  always @(posedge clock) begin	// @[<stdin>:818:11]
    if (reset)	// @[<stdin>:818:11]
      id_valid <= 1'h0;	// @[playground/src/ID_stage.scala:14:33]
    else if (_ID_IO_ready_output)	// @[playground/src/ID_stage.scala:17:28]
      id_valid <= ID_IO_valid;	// @[playground/src/ID_stage.scala:14:33]
    inv_flag <= _dc_io_illegal & ID_IO_bits_nextpc != 32'h80000000;	// @[playground/src/ID_stage.scala:23:16, :92:19, :93:{27,46}]
  end // always @(posedge)
  Decode dc (	// @[playground/src/ID_stage.scala:23:16]
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
    .io_wb_en   (ID_to_ex_bits_wen),
    .io_csr_cmd (_dc_io_csr_cmd),
    .io_illegal (_dc_io_illegal)
  );
  ImmGen ImmGen (	// @[playground/src/ID_stage.scala:24:20]
    .io_inst (ID_IO_bits_inst),
    .io_sel  (_dc_io_imm_sel),	// @[playground/src/ID_stage.scala:23:16]
    .io_out  (imm)
  );
  RegFile Regfile (	// @[playground/src/ID_stage.scala:47:21]
    .clock     (clock),
    .reset     (reset),
    .io_waddr  (ID_wb_bus_waddr),
    .io_wdata  (ID_wb_bus_wdata),
    .io_raddr1 (rs1),	// @[playground/src/ID_stage.scala:26:25]
    .io_raddr2 (_dc_io_csr_cmd == 5'h4 ? 5'hF : _dc_io_csr_cmd == 5'h5 ? 5'hA : rs2),	// @[playground/src/ID_stage.scala:23:16, :27:25, :49:50]
    .io_wen    (ID_wb_bus_wen),
    .io_rdata1 (_Regfile_io_rdata1),
    .io_rdata2 (_Regfile_io_rdata2)
  );
  inv_break inv_break (	// @[playground/src/ID_stage.scala:91:23]
    .clock    (clock),
    .reset    (reset),
    .inv_flag (inv_flag),	// @[playground/src/ID_stage.scala:92:19]
    .pc       (ID_IO_bits_nextpc)
  );
  assign ID_IO_ready = _ID_IO_ready_output;	// @[<stdin>:817:3, playground/src/ID_stage.scala:17:28]
  assign ID_to_ex_valid = id_valid & id_ready_go;	// @[<stdin>:817:3, playground/src/ID_stage.scala:14:33, :15:33, :21:28]
  assign ID_to_ex_bits_csr_addr = csr_addr;	// @[<stdin>:817:3, playground/src/ID_stage.scala:31:30]
  assign ID_to_ex_bits_csr_cmd = _dc_io_csr_cmd;	// @[<stdin>:817:3, playground/src/ID_stage.scala:23:16]
  assign ID_to_ex_bits_ebreak_flag = _dc_io_csr_cmd == 5'h5;	// @[<stdin>:817:3, playground/src/ID_stage.scala:23:16, :49:50, :75:44]
  assign ID_to_ex_bits_rd = rd;	// @[<stdin>:817:3, playground/src/ID_stage.scala:29:24]
  assign ID_to_ex_bits_src1 = _dc_io_A_sel ? _Regfile_io_rdata1 : ID_IO_bits_pc;	// @[<stdin>:817:3, playground/src/ID_stage.scala:23:16, :47:21, :56:38]
  assign ID_to_ex_bits_src2 = _dc_io_B_sel ? _Regfile_io_rdata2 : imm;	// @[<stdin>:817:3, playground/src/ID_stage.scala:23:16, :25:25, :47:21, :60:38]
  assign ID_to_ex_bits_rdata1 = _Regfile_io_rdata1;	// @[<stdin>:817:3, playground/src/ID_stage.scala:47:21]
  assign ID_to_ex_bits_rdata2 = _Regfile_io_rdata2;	// @[<stdin>:817:3, playground/src/ID_stage.scala:47:21]
  assign ID_to_ex_bits_nextpc = ID_IO_bits_nextpc;	// @[<stdin>:817:3]
  assign ID_to_ex_bits_pc = ID_IO_bits_pc;	// @[<stdin>:817:3]
  assign ID_to_ex_bits_inst = ID_IO_bits_inst;	// @[<stdin>:817:3]
endmodule

