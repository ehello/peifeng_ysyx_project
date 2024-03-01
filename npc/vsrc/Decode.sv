// Generated by CIRCT firtool-1.56.0
module Decode(	// @[<stdin>:80:3]
  input  [31:0] io_inst,	// @[playground/src/Decode.scala:210:23]
  output        io_pc_sel,	// @[playground/src/Decode.scala:210:23]
                io_A_sel,	// @[playground/src/Decode.scala:210:23]
  output [1:0]  io_B_sel,	// @[playground/src/Decode.scala:210:23]
  output [2:0]  io_imm_sel,	// @[playground/src/Decode.scala:210:23]
  output [3:0]  io_alu_op,	// @[playground/src/Decode.scala:210:23]
                io_br_type,	// @[playground/src/Decode.scala:210:23]
                io_st_type,	// @[playground/src/Decode.scala:210:23]
  output [2:0]  io_ld_type,	// @[playground/src/Decode.scala:210:23]
  output [1:0]  io_wb_sel,	// @[playground/src/Decode.scala:210:23]
  output        io_wb_en,	// @[playground/src/Decode.scala:210:23]
  output [4:0]  io_csr_cmd,	// @[playground/src/Decode.scala:210:23]
  output        io_illegal	// @[playground/src/Decode.scala:210:23]
);

  wire        _ctrlSignals_T_1 = io_inst[6:0] == 7'h37;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_3 = io_inst[6:0] == 7'h17;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_5 = io_inst[6:0] == 7'h6F;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire [9:0]  _GEN = {io_inst[14:12], io_inst[6:0]};	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_7 = _GEN == 10'h67;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_9 = _GEN == 10'h63;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_11 = _GEN == 10'hE3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_13 = _GEN == 10'h263;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_15 = _GEN == 10'h2E3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_17 = _GEN == 10'h363;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_19 = _GEN == 10'h3E3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_21 = _GEN == 10'h3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_23 = _GEN == 10'h83;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_25 = _GEN == 10'h103;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_27 = _GEN == 10'h203;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_29 = _GEN == 10'h283;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_31 = _GEN == 10'h23;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_33 = _GEN == 10'hA3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_35 = _GEN == 10'h123;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_37 = _GEN == 10'h13;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_39 = _GEN == 10'h113;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_41 = _GEN == 10'h193;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_43 = _GEN == 10'h213;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_45 = _GEN == 10'h313;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_47 = _GEN == 10'h393;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire [16:0] _GEN_0 = {io_inst[31:25], io_inst[14:12], io_inst[6:0]};	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_49 = _GEN_0 == 17'h93;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_51 = _GEN_0 == 17'h293;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_53 = _GEN_0 == 17'h8293;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_55 = _GEN_0 == 17'h33;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_57 = _GEN_0 == 17'h8033;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_59 = _GEN_0 == 17'hB3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_61 = _GEN_0 == 17'h133;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_63 = _GEN_0 == 17'h1B3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_65 = _GEN_0 == 17'h233;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_67 = _GEN_0 == 17'h2B3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_69 = _GEN_0 == 17'h82B3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_71 = _GEN_0 == 17'h333;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_73 = _GEN_0 == 17'h3B3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_75 = _GEN == 10'hF3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_497 = _GEN == 10'h173;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_332 = io_inst == 32'h30200073;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_85 = io_inst == 32'h73;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _ctrlSignals_T_125 = io_inst == 32'h100073;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38]
  wire        _GEN_1 = _ctrlSignals_T_75 | _ctrlSignals_T_497;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  wire        _GEN_2 =
    _ctrlSignals_T_55 | _ctrlSignals_T_57 | _ctrlSignals_T_59 | _ctrlSignals_T_61
    | _ctrlSignals_T_63 | _ctrlSignals_T_65 | _ctrlSignals_T_67 | _ctrlSignals_T_69
    | _ctrlSignals_T_71 | _ctrlSignals_T_73;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  wire        _GEN_3 =
    _ctrlSignals_T_31 | _ctrlSignals_T_33 | _ctrlSignals_T_35 | _ctrlSignals_T_37
    | _ctrlSignals_T_39 | _ctrlSignals_T_41 | _ctrlSignals_T_43 | _ctrlSignals_T_45
    | _ctrlSignals_T_47 | _ctrlSignals_T_49 | _ctrlSignals_T_51 | _ctrlSignals_T_53
    | _GEN_2;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  wire        _GEN_4 =
    _ctrlSignals_T_21 | _ctrlSignals_T_23 | _ctrlSignals_T_25 | _ctrlSignals_T_27
    | _ctrlSignals_T_29 | _GEN_3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  wire        _GEN_5 =
    _ctrlSignals_T_9 | _ctrlSignals_T_11 | _ctrlSignals_T_13 | _ctrlSignals_T_15
    | _ctrlSignals_T_17 | _ctrlSignals_T_19;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  wire        _GEN_6 = _ctrlSignals_T_85 | _ctrlSignals_T_125;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  wire        _GEN_7 =
    _ctrlSignals_T_37 | _ctrlSignals_T_39 | _ctrlSignals_T_41 | _ctrlSignals_T_43
    | _ctrlSignals_T_45 | _ctrlSignals_T_47 | _ctrlSignals_T_49 | _ctrlSignals_T_51
    | _ctrlSignals_T_53;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  wire        _GEN_8 = _ctrlSignals_T_31 | _ctrlSignals_T_33 | _ctrlSignals_T_35;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  wire        _GEN_9 =
    _ctrlSignals_T_21 | _ctrlSignals_T_23 | _ctrlSignals_T_25 | _ctrlSignals_T_27
    | _ctrlSignals_T_29;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  wire        _GEN_10 = _ctrlSignals_T_1 | _ctrlSignals_T_3;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  wire        _GEN_11 = _ctrlSignals_T_5 | _ctrlSignals_T_7;	// @[src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_pc_sel =
    ~(_ctrlSignals_T_1 | _ctrlSignals_T_3 | _ctrlSignals_T_5 | _ctrlSignals_T_7
      | _ctrlSignals_T_9 | _ctrlSignals_T_11 | _ctrlSignals_T_13 | _ctrlSignals_T_15
      | _ctrlSignals_T_17 | _ctrlSignals_T_19 | _ctrlSignals_T_21 | _ctrlSignals_T_23
      | _ctrlSignals_T_25 | _ctrlSignals_T_27 | _ctrlSignals_T_29 | _ctrlSignals_T_31
      | _ctrlSignals_T_33 | _ctrlSignals_T_35 | _ctrlSignals_T_37 | _ctrlSignals_T_39
      | _ctrlSignals_T_41 | _ctrlSignals_T_43 | _ctrlSignals_T_45 | _ctrlSignals_T_47
      | _ctrlSignals_T_49 | _ctrlSignals_T_51 | _ctrlSignals_T_53 | _ctrlSignals_T_55
      | _ctrlSignals_T_57 | _ctrlSignals_T_59 | _ctrlSignals_T_61 | _ctrlSignals_T_63
      | _ctrlSignals_T_65 | _ctrlSignals_T_67 | _ctrlSignals_T_69 | _ctrlSignals_T_71
      | _ctrlSignals_T_73 | _GEN_1) & (_ctrlSignals_T_332 | _ctrlSignals_T_85);	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_A_sel =
    ~(_ctrlSignals_T_1 | _ctrlSignals_T_3 | _ctrlSignals_T_5)
    & (_ctrlSignals_T_7 | ~_GEN_5
       & (_GEN_4 | ~(_ctrlSignals_T_75 | _ctrlSignals_T_497 | _ctrlSignals_T_332)
          & (_ctrlSignals_T_85 | _ctrlSignals_T_125)));	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_B_sel =
    _ctrlSignals_T_1 | _ctrlSignals_T_3 | _ctrlSignals_T_5 | _ctrlSignals_T_7
    | _ctrlSignals_T_9 | _ctrlSignals_T_11 | _ctrlSignals_T_13 | _ctrlSignals_T_15
    | _ctrlSignals_T_17 | _ctrlSignals_T_19 | _ctrlSignals_T_21 | _ctrlSignals_T_23
    | _ctrlSignals_T_25 | _ctrlSignals_T_27 | _ctrlSignals_T_29 | _ctrlSignals_T_31
    | _ctrlSignals_T_33 | _ctrlSignals_T_35 | _GEN_7
      ? 2'h0
      : _GEN_2 ? 2'h1 : _GEN_1 ? 2'h2 : _ctrlSignals_T_332 ? 2'h0 : {1'h0, _GEN_6};	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_imm_sel =
    _GEN_10
      ? 3'h3
      : _ctrlSignals_T_5
          ? 3'h4
          : _ctrlSignals_T_7
              ? 3'h1
              : _GEN_5 ? 3'h5 : _GEN_9 ? 3'h1 : _GEN_8 ? 3'h2 : {2'h0, _GEN_7};	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_alu_op =
    _ctrlSignals_T_1
      ? 4'hB
      : _ctrlSignals_T_3
          ? 4'h0
          : _GEN_11
              ? 4'hC
              : _ctrlSignals_T_9 | _ctrlSignals_T_11 | _ctrlSignals_T_13
                | _ctrlSignals_T_15 | _ctrlSignals_T_17 | _ctrlSignals_T_19
                | _ctrlSignals_T_21 | _ctrlSignals_T_23 | _ctrlSignals_T_25
                | _ctrlSignals_T_27 | _ctrlSignals_T_29 | _ctrlSignals_T_31
                | _ctrlSignals_T_33 | _ctrlSignals_T_35 | _ctrlSignals_T_37
                  ? 4'h0
                  : _ctrlSignals_T_39
                      ? 4'h5
                      : _ctrlSignals_T_41
                          ? 4'h7
                          : _ctrlSignals_T_43
                              ? 4'h4
                              : _ctrlSignals_T_45
                                  ? 4'h3
                                  : _ctrlSignals_T_47
                                      ? 4'h2
                                      : _ctrlSignals_T_49
                                          ? 4'h6
                                          : _ctrlSignals_T_51
                                              ? 4'h8
                                              : _ctrlSignals_T_53
                                                  ? 4'h9
                                                  : _ctrlSignals_T_55
                                                      ? 4'h0
                                                      : _ctrlSignals_T_57
                                                          ? 4'h1
                                                          : _ctrlSignals_T_59
                                                              ? 4'h6
                                                              : _ctrlSignals_T_61
                                                                  ? 4'h5
                                                                  : _ctrlSignals_T_63
                                                                      ? 4'h7
                                                                      : _ctrlSignals_T_65
                                                                          ? 4'h4
                                                                          : _ctrlSignals_T_67
                                                                              ? 4'h8
                                                                              : _ctrlSignals_T_69
                                                                                  ? 4'h9
                                                                                  : _ctrlSignals_T_71
                                                                                      ? 4'h3
                                                                                      : _ctrlSignals_T_73
                                                                                          ? 4'h2
                                                                                          : _GEN_1
                                                                                              ? 4'hA
                                                                                              : _ctrlSignals_T_332
                                                                                                | ~_GEN_6
                                                                                                  ? 4'hC
                                                                                                  : 4'h0;	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_br_type =
    _GEN_10
      ? 4'h0
      : _ctrlSignals_T_5
          ? 4'h7
          : _ctrlSignals_T_7
              ? 4'h8
              : _ctrlSignals_T_9
                  ? 4'h3
                  : _ctrlSignals_T_11
                      ? 4'h6
                      : _ctrlSignals_T_13
                          ? 4'h2
                          : _ctrlSignals_T_15
                              ? 4'h5
                              : _ctrlSignals_T_17
                                  ? 4'h1
                                  : {1'h0, _ctrlSignals_T_19, 2'h0};	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_st_type =
    _ctrlSignals_T_1 | _ctrlSignals_T_3 | _ctrlSignals_T_5 | _ctrlSignals_T_7
    | _ctrlSignals_T_9 | _ctrlSignals_T_11 | _ctrlSignals_T_13 | _ctrlSignals_T_15
    | _ctrlSignals_T_17 | _ctrlSignals_T_19 | _GEN_9
      ? 4'h0
      : _ctrlSignals_T_31 ? 4'h1 : _ctrlSignals_T_33 ? 4'h3 : {4{_ctrlSignals_T_35}};	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_ld_type =
    _ctrlSignals_T_1 | _ctrlSignals_T_3 | _ctrlSignals_T_5 | _ctrlSignals_T_7 | _GEN_5
      ? 3'h0
      : _ctrlSignals_T_21
          ? 3'h3
          : _ctrlSignals_T_23
              ? 3'h2
              : _ctrlSignals_T_25
                  ? 3'h1
                  : _ctrlSignals_T_27 ? 3'h5 : {_ctrlSignals_T_29, 2'h0};	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_wb_sel =
    _GEN_10
      ? 2'h0
      : _GEN_11
          ? 2'h2
          : _GEN_5
              ? 2'h0
              : _GEN_9
                  ? 2'h1
                  : _GEN_3
                      ? 2'h0
                      : {2{_ctrlSignals_T_75 | _ctrlSignals_T_497 | _ctrlSignals_T_332
                             | _GEN_6}};	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_wb_en =
    _ctrlSignals_T_1 | _ctrlSignals_T_3 | _GEN_11 | ~_GEN_5
    & (_GEN_9 | ~_GEN_8
       & (_ctrlSignals_T_37 | _ctrlSignals_T_39 | _ctrlSignals_T_41 | _ctrlSignals_T_43
          | _ctrlSignals_T_45 | _ctrlSignals_T_47 | _ctrlSignals_T_49 | _ctrlSignals_T_51
          | _ctrlSignals_T_53 | _ctrlSignals_T_55 | _ctrlSignals_T_57 | _ctrlSignals_T_59
          | _ctrlSignals_T_61 | _ctrlSignals_T_63 | _ctrlSignals_T_65 | _ctrlSignals_T_67
          | _ctrlSignals_T_69 | _ctrlSignals_T_71 | _ctrlSignals_T_73 | _ctrlSignals_T_75
          | _ctrlSignals_T_497));	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_csr_cmd =
    _ctrlSignals_T_1 | _ctrlSignals_T_3 | _ctrlSignals_T_5 | _ctrlSignals_T_7
    | _ctrlSignals_T_9 | _ctrlSignals_T_11 | _ctrlSignals_T_13 | _ctrlSignals_T_15
    | _ctrlSignals_T_17 | _ctrlSignals_T_19 | _GEN_4
      ? 5'h0
      : _ctrlSignals_T_75
          ? 5'h1
          : _ctrlSignals_T_497
              ? 5'h2
              : _ctrlSignals_T_332
                  ? 5'h3
                  : _ctrlSignals_T_85 ? 5'h4 : _ctrlSignals_T_125 ? 5'h5 : 5'h0;	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
  assign io_illegal =
    ~(_ctrlSignals_T_1 | _ctrlSignals_T_3 | _ctrlSignals_T_5 | _ctrlSignals_T_7
      | _ctrlSignals_T_9 | _ctrlSignals_T_11 | _ctrlSignals_T_13 | _ctrlSignals_T_15
      | _ctrlSignals_T_17 | _ctrlSignals_T_19 | _ctrlSignals_T_21 | _ctrlSignals_T_23
      | _ctrlSignals_T_25 | _ctrlSignals_T_27 | _ctrlSignals_T_29 | _ctrlSignals_T_31
      | _ctrlSignals_T_33 | _ctrlSignals_T_35 | _ctrlSignals_T_37 | _ctrlSignals_T_39
      | _ctrlSignals_T_41 | _ctrlSignals_T_43 | _ctrlSignals_T_45 | _ctrlSignals_T_47
      | _ctrlSignals_T_49 | _ctrlSignals_T_51 | _ctrlSignals_T_53 | _ctrlSignals_T_55
      | _ctrlSignals_T_57 | _ctrlSignals_T_59 | _ctrlSignals_T_61 | _ctrlSignals_T_63
      | _ctrlSignals_T_65 | _ctrlSignals_T_67 | _ctrlSignals_T_69 | _ctrlSignals_T_71
      | _ctrlSignals_T_73 | _ctrlSignals_T_75 | _ctrlSignals_T_497 | _ctrlSignals_T_332
      | _ctrlSignals_T_85) & ~_ctrlSignals_T_125;	// @[<stdin>:80:3, src/main/scala/chisel3/util/Lookup.scala:31:38, :34:39]
endmodule

