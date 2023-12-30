// Generated by CIRCT firtool-1.56.0
module SimTop(	// @[<stdin>:972:3]
  input         clock,	// @[<stdin>:973:11]
                reset,	// @[<stdin>:974:11]
  output [4:0]  io_debug_waddr,	// @[playground/src/SimTop.scala:27:14]
  output [31:0] io_debug_wdata,	// @[playground/src/SimTop.scala:27:14]
  output        io_debug_wen	// @[playground/src/SimTop.scala:27:14]
);

  wire [4:0]  _WB_stage_WB_to_id_waddr;	// @[playground/src/SimTop.scala:36:24]
  wire [31:0] _WB_stage_WB_to_id_wdata;	// @[playground/src/SimTop.scala:36:24]
  wire        _WB_stage_WB_to_id_wen;	// @[playground/src/SimTop.scala:36:24]
  wire        _LS_stage_LS_to_wb_ebreak_flag;	// @[playground/src/SimTop.scala:35:24]
  wire [1:0]  _LS_stage_LS_to_wb_wb_sel;	// @[playground/src/SimTop.scala:35:24]
  wire        _LS_stage_LS_to_wb_wen;	// @[playground/src/SimTop.scala:35:24]
  wire [4:0]  _LS_stage_LS_to_wb_rd;	// @[playground/src/SimTop.scala:35:24]
  wire [31:0] _LS_stage_LS_to_wb_result;	// @[playground/src/SimTop.scala:35:24]
  wire [31:0] _LS_stage_LS_to_wb_pc;	// @[playground/src/SimTop.scala:35:24]
  wire        _EX_stage_EX_to_ls_ebreak_flag;	// @[playground/src/SimTop.scala:34:24]
  wire [1:0]  _EX_stage_EX_to_ls_wb_sel;	// @[playground/src/SimTop.scala:34:24]
  wire        _EX_stage_EX_to_ls_wen;	// @[playground/src/SimTop.scala:34:24]
  wire [4:0]  _EX_stage_EX_to_ls_rd;	// @[playground/src/SimTop.scala:34:24]
  wire [31:0] _EX_stage_EX_to_ls_result;	// @[playground/src/SimTop.scala:34:24]
  wire [31:0] _EX_stage_EX_to_ls_pc;	// @[playground/src/SimTop.scala:34:24]
  wire        _EX_stage_EX_br_bus_is_jump;	// @[playground/src/SimTop.scala:34:24]
  wire [31:0] _EX_stage_EX_br_bus_dnpc;	// @[playground/src/SimTop.scala:34:24]
  wire        _ID_stage_ID_to_ex_ebreak_flag;	// @[playground/src/SimTop.scala:33:24]
  wire [1:0]  _ID_stage_ID_to_ex_wb_sel;	// @[playground/src/SimTop.scala:33:24]
  wire [3:0]  _ID_stage_ID_to_ex_br_type;	// @[playground/src/SimTop.scala:33:24]
  wire        _ID_stage_ID_to_ex_wen;	// @[playground/src/SimTop.scala:33:24]
  wire [4:0]  _ID_stage_ID_to_ex_rd;	// @[playground/src/SimTop.scala:33:24]
  wire [3:0]  _ID_stage_ID_to_ex_alu_op;	// @[playground/src/SimTop.scala:33:24]
  wire [31:0] _ID_stage_ID_to_ex_src1;	// @[playground/src/SimTop.scala:33:24]
  wire [31:0] _ID_stage_ID_to_ex_src2;	// @[playground/src/SimTop.scala:33:24]
  wire [31:0] _ID_stage_ID_to_ex_inst;	// @[playground/src/SimTop.scala:33:24]
  wire [31:0] _ID_stage_ID_to_ex_pc;	// @[playground/src/SimTop.scala:33:24]
  wire [31:0] _IF_stage_IF_IO_pc;	// @[playground/src/SimTop.scala:32:24]
  wire [31:0] _IF_stage_IF_IO_inst;	// @[playground/src/SimTop.scala:32:24]
  IF_stage IF_stage (	// @[playground/src/SimTop.scala:32:24]
    .clock             (clock),
    .reset             (reset),
    .IF_br_bus_is_jump (_EX_stage_EX_br_bus_is_jump),	// @[playground/src/SimTop.scala:34:24]
    .IF_br_bus_dnpc    (_EX_stage_EX_br_bus_dnpc),	// @[playground/src/SimTop.scala:34:24]
    .IF_IO_pc          (_IF_stage_IF_IO_pc),
    .IF_IO_inst        (_IF_stage_IF_IO_inst)
  );
  ID_stage ID_stage (	// @[playground/src/SimTop.scala:33:24]
    .clock                (clock),
    .reset                (reset),
    .ID_IO_pc             (_IF_stage_IF_IO_pc),	// @[playground/src/SimTop.scala:32:24]
    .ID_IO_inst           (_IF_stage_IF_IO_inst),	// @[playground/src/SimTop.scala:32:24]
    .ID_wb_bus_waddr      (_WB_stage_WB_to_id_waddr),	// @[playground/src/SimTop.scala:36:24]
    .ID_wb_bus_wdata      (_WB_stage_WB_to_id_wdata),	// @[playground/src/SimTop.scala:36:24]
    .ID_wb_bus_wen        (_WB_stage_WB_to_id_wen),	// @[playground/src/SimTop.scala:36:24]
    .ID_to_ex_ebreak_flag (_ID_stage_ID_to_ex_ebreak_flag),
    .ID_to_ex_wb_sel      (_ID_stage_ID_to_ex_wb_sel),
    .ID_to_ex_br_type     (_ID_stage_ID_to_ex_br_type),
    .ID_to_ex_wen         (_ID_stage_ID_to_ex_wen),
    .ID_to_ex_rd          (_ID_stage_ID_to_ex_rd),
    .ID_to_ex_alu_op      (_ID_stage_ID_to_ex_alu_op),
    .ID_to_ex_src1        (_ID_stage_ID_to_ex_src1),
    .ID_to_ex_src2        (_ID_stage_ID_to_ex_src2),
    .ID_to_ex_inst        (_ID_stage_ID_to_ex_inst),
    .ID_to_ex_pc          (_ID_stage_ID_to_ex_pc)
  );
  EX_stage EX_stage (	// @[playground/src/SimTop.scala:34:24]
    .clock                (clock),
    .reset                (reset),
    .EX_IO_ebreak_flag    (_ID_stage_ID_to_ex_ebreak_flag),	// @[playground/src/SimTop.scala:33:24]
    .EX_IO_wb_sel         (_ID_stage_ID_to_ex_wb_sel),	// @[playground/src/SimTop.scala:33:24]
    .EX_IO_br_type        (_ID_stage_ID_to_ex_br_type),	// @[playground/src/SimTop.scala:33:24]
    .EX_IO_wen            (_ID_stage_ID_to_ex_wen),	// @[playground/src/SimTop.scala:33:24]
    .EX_IO_rd             (_ID_stage_ID_to_ex_rd),	// @[playground/src/SimTop.scala:33:24]
    .EX_IO_alu_op         (_ID_stage_ID_to_ex_alu_op),	// @[playground/src/SimTop.scala:33:24]
    .EX_IO_src1           (_ID_stage_ID_to_ex_src1),	// @[playground/src/SimTop.scala:33:24]
    .EX_IO_src2           (_ID_stage_ID_to_ex_src2),	// @[playground/src/SimTop.scala:33:24]
    .EX_IO_inst           (_ID_stage_ID_to_ex_inst),	// @[playground/src/SimTop.scala:33:24]
    .EX_IO_pc             (_ID_stage_ID_to_ex_pc),	// @[playground/src/SimTop.scala:33:24]
    .EX_to_ls_ebreak_flag (_EX_stage_EX_to_ls_ebreak_flag),
    .EX_to_ls_wb_sel      (_EX_stage_EX_to_ls_wb_sel),
    .EX_to_ls_wen         (_EX_stage_EX_to_ls_wen),
    .EX_to_ls_rd          (_EX_stage_EX_to_ls_rd),
    .EX_to_ls_result      (_EX_stage_EX_to_ls_result),
    .EX_to_ls_pc          (_EX_stage_EX_to_ls_pc),
    .EX_br_bus_is_jump    (_EX_stage_EX_br_bus_is_jump),
    .EX_br_bus_dnpc       (_EX_stage_EX_br_bus_dnpc)
  );
  LS_stage LS_stage (	// @[playground/src/SimTop.scala:35:24]
    .LS_IO_ebreak_flag    (_EX_stage_EX_to_ls_ebreak_flag),	// @[playground/src/SimTop.scala:34:24]
    .LS_IO_wb_sel         (_EX_stage_EX_to_ls_wb_sel),	// @[playground/src/SimTop.scala:34:24]
    .LS_IO_wen            (_EX_stage_EX_to_ls_wen),	// @[playground/src/SimTop.scala:34:24]
    .LS_IO_rd             (_EX_stage_EX_to_ls_rd),	// @[playground/src/SimTop.scala:34:24]
    .LS_IO_result         (_EX_stage_EX_to_ls_result),	// @[playground/src/SimTop.scala:34:24]
    .LS_IO_pc             (_EX_stage_EX_to_ls_pc),	// @[playground/src/SimTop.scala:34:24]
    .LS_to_wb_ebreak_flag (_LS_stage_LS_to_wb_ebreak_flag),
    .LS_to_wb_wb_sel      (_LS_stage_LS_to_wb_wb_sel),
    .LS_to_wb_wen         (_LS_stage_LS_to_wb_wen),
    .LS_to_wb_rd          (_LS_stage_LS_to_wb_rd),
    .LS_to_wb_result      (_LS_stage_LS_to_wb_result),
    .LS_to_wb_pc          (_LS_stage_LS_to_wb_pc)
  );
  WB_stage WB_stage (	// @[playground/src/SimTop.scala:36:24]
    .clock             (clock),
    .reset             (reset),
    .WB_IO_ebreak_flag (_LS_stage_LS_to_wb_ebreak_flag),	// @[playground/src/SimTop.scala:35:24]
    .WB_IO_wb_sel      (_LS_stage_LS_to_wb_wb_sel),	// @[playground/src/SimTop.scala:35:24]
    .WB_IO_wen         (_LS_stage_LS_to_wb_wen),	// @[playground/src/SimTop.scala:35:24]
    .WB_IO_rd          (_LS_stage_LS_to_wb_rd),	// @[playground/src/SimTop.scala:35:24]
    .WB_IO_result      (_LS_stage_LS_to_wb_result),	// @[playground/src/SimTop.scala:35:24]
    .WB_IO_pc          (_LS_stage_LS_to_wb_pc),	// @[playground/src/SimTop.scala:35:24]
    .WB_to_id_waddr    (_WB_stage_WB_to_id_waddr),
    .WB_to_id_wdata    (_WB_stage_WB_to_id_wdata),
    .WB_to_id_wen      (_WB_stage_WB_to_id_wen),
    .WB_debug_waddr    (io_debug_waddr),
    .WB_debug_wdata    (io_debug_wdata),
    .WB_debug_wen      (io_debug_wen)
  );
endmodule

