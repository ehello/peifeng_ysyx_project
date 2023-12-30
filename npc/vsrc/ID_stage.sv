// Generated by CIRCT firtool-1.56.0
module ID_stage(	// @[<stdin>:734:3]
  input         clock,	// @[<stdin>:735:11]
                reset,	// @[<stdin>:736:11]
  input  [31:0] ID_IO_nextpc,	// @[playground/src/ID_stage.scala:7:12]
                ID_IO_pc,	// @[playground/src/ID_stage.scala:7:12]
                ID_IO_inst,	// @[playground/src/ID_stage.scala:7:12]
  input  [4:0]  ID_wb_bus_waddr,	// @[playground/src/ID_stage.scala:7:12]
  input  [31:0] ID_wb_bus_wdata,	// @[playground/src/ID_stage.scala:7:12]
  input         ID_wb_bus_wen,	// @[playground/src/ID_stage.scala:7:12]
  output        ID_to_ex_ebreak_flag,	// @[playground/src/ID_stage.scala:7:12]
  output [1:0]  ID_to_ex_wb_sel,	// @[playground/src/ID_stage.scala:7:12]
  output [3:0]  ID_to_ex_br_type,	// @[playground/src/ID_stage.scala:7:12]
  output        ID_to_ex_wen,	// @[playground/src/ID_stage.scala:7:12]
  output [4:0]  ID_to_ex_rd,	// @[playground/src/ID_stage.scala:7:12]
  output [3:0]  ID_to_ex_alu_op,	// @[playground/src/ID_stage.scala:7:12]
  output [31:0] ID_to_ex_src1,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_src2,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_nextpc,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_pc,	// @[playground/src/ID_stage.scala:7:12]
                ID_to_ex_inst	// @[playground/src/ID_stage.scala:7:12]
);

  wire [31:0] _Regfile_io_rdata1;	// @[playground/src/ID_stage.scala:27:21]
  wire [31:0] _Regfile_io_rdata2;	// @[playground/src/ID_stage.scala:27:21]
  wire [31:0] _ImmGen_io_out;	// @[playground/src/ID_stage.scala:13:20]
  wire        _dc_io_A_sel;	// @[playground/src/ID_stage.scala:12:16]
  wire        _dc_io_B_sel;	// @[playground/src/ID_stage.scala:12:16]
  wire [2:0]  _dc_io_imm_sel;	// @[playground/src/ID_stage.scala:12:16]
  wire [2:0]  _dc_io_br_type;	// @[playground/src/ID_stage.scala:12:16]
  wire [2:0]  _dc_io_csr_cmd;	// @[playground/src/ID_stage.scala:12:16]
  wire        _ID_to_ex_ebreak_flag_T = _dc_io_csr_cmd == 3'h5;	// @[playground/src/ID_stage.scala:12:16, :29:39]
  Decode dc (	// @[playground/src/ID_stage.scala:12:16]
    .io_inst    (ID_IO_inst),
    .io_A_sel   (_dc_io_A_sel),
    .io_B_sel   (_dc_io_B_sel),
    .io_imm_sel (_dc_io_imm_sel),
    .io_alu_op  (ID_to_ex_alu_op),
    .io_br_type (_dc_io_br_type),
    .io_wb_sel  (ID_to_ex_wb_sel),
    .io_wb_en   (ID_to_ex_wen),
    .io_csr_cmd (_dc_io_csr_cmd)
  );
  ImmGen ImmGen (	// @[playground/src/ID_stage.scala:13:20]
    .io_inst (ID_IO_inst),
    .io_sel  (_dc_io_imm_sel),	// @[playground/src/ID_stage.scala:12:16]
    .io_out  (_ImmGen_io_out)
  );
  RegFile Regfile (	// @[playground/src/ID_stage.scala:27:21]
    .clock     (clock),
    .reset     (reset),
    .io_waddr  (ID_wb_bus_waddr),
    .io_wdata  (ID_wb_bus_wdata),
    .io_raddr1 (ID_IO_inst[19:15]),	// @[playground/src/ID_stage.scala:22:26]
    .io_raddr2 (_ID_to_ex_ebreak_flag_T ? 5'hA : ID_IO_inst[24:20]),	// @[playground/src/ID_stage.scala:21:26, :29:{25,39}]
    .io_wen    (ID_wb_bus_wen),
    .io_rdata1 (_Regfile_io_rdata1),
    .io_rdata2 (_Regfile_io_rdata2)
  );
  assign ID_to_ex_ebreak_flag = _ID_to_ex_ebreak_flag_T;	// @[<stdin>:734:3, playground/src/ID_stage.scala:29:39]
  assign ID_to_ex_br_type = {1'h0, _dc_io_br_type};	// @[<stdin>:734:3, playground/src/ID_stage.scala:12:16, :46:19]
  assign ID_to_ex_rd = ID_IO_inst[11:7];	// @[<stdin>:734:3, playground/src/ID_stage.scala:24:26]
  assign ID_to_ex_src1 = _dc_io_A_sel ? _Regfile_io_rdata1 : ID_IO_pc;	// @[<stdin>:734:3, playground/src/ID_stage.scala:12:16, :27:21, :32:38]
  assign ID_to_ex_src2 = _dc_io_B_sel ? _Regfile_io_rdata2 : _ImmGen_io_out;	// @[<stdin>:734:3, playground/src/ID_stage.scala:12:16, :13:20, :27:21, :36:38]
  assign ID_to_ex_nextpc = ID_IO_nextpc;	// @[<stdin>:734:3]
  assign ID_to_ex_pc = ID_IO_pc;	// @[<stdin>:734:3]
  assign ID_to_ex_inst = ID_IO_inst;	// @[<stdin>:734:3]
endmodule

