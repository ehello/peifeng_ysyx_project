// Generated by CIRCT firtool-1.56.0
module SimTop(	// @[<stdin>:140:3]
  input         clock,	// @[<stdin>:141:11]
                reset,	// @[<stdin>:142:11]
  output [31:0] io_result,	// @[playground/src/SimTop.scala:6:14]
  output        io_wen,	// @[playground/src/SimTop.scala:6:14]
  output [31:0] io_imm	// @[playground/src/SimTop.scala:6:14]
);

  wire [31:0] Imm;	// @[playground/src/SimTop.scala:105:39]
  wire [31:0] _alu_io_result;	// @[playground/src/SimTop.scala:163:18]
  wire [31:0] _RegFile_io_rdata1;	// @[playground/src/SimTop.scala:155:21]
  wire [31:0] _RegFile_io_rdata2;	// @[playground/src/SimTop.scala:155:21]
  wire [31:0] _pmem_dpi_inst;	// @[playground/src/SimTop.scala:13:22]
  wire [31:0] dnpc;	// @[playground/src/SimTop.scala:17:26]
  wire [31:0] nextpc = dnpc;	// @[playground/src/SimTop.scala:15:28, :17:26]
  reg  [31:0] io_inst;	// @[playground/src/SimTop.scala:27:28]
  reg  [31:0] REGpc;	// @[playground/src/SimTop.scala:30:20]
  wire [31:0] snpc = REGpc + 32'h4;	// @[playground/src/SimTop.scala:16:26, :30:20, :37:14]
  wire [31:0] jalr_taget;	// @[playground/src/SimTop.scala:14:32]
  wire        IsaI_jalr;	// @[playground/src/SimTop.scala:23:26]
  wire        IsaU_jal;	// @[playground/src/SimTop.scala:26:26]
  assign dnpc = IsaU_jal ? REGpc + Imm : IsaI_jalr ? jalr_taget : snpc;	// @[playground/src/SimTop.scala:14:32, :16:26, :17:26, :23:26, :26:26, :30:20, :38:{12,27}, :39:14, :105:39]
  wire        IsaU_lui = io_inst[6:0] == 7'h37;	// @[playground/src/SimTop.scala:26:26, :27:28, :57:24]
  wire        IsaU_auipc = io_inst[6:0] == 7'h17;	// @[playground/src/SimTop.scala:26:26, :27:28, :57:24, :58:24]
  assign IsaU_jal = io_inst[6:0] == 7'h6F;	// @[playground/src/SimTop.scala:26:26, :27:28, :57:24, :59:24]
  wire [9:0]  _GEN = {io_inst[14:12], io_inst[6:0]};	// @[playground/src/SimTop.scala:27:28, :57:24, :60:24]
  assign IsaI_jalr = _GEN == 10'h67;	// @[playground/src/SimTop.scala:23:26, :60:24]
  wire        IsaB_beq = _GEN == 10'h63;	// @[playground/src/SimTop.scala:25:26, :60:24, :61:24]
  wire        IsaB_bne = _GEN == 10'hE3;	// @[playground/src/SimTop.scala:25:26, :60:24, :62:24]
  wire        IsaB_blt = _GEN == 10'h263;	// @[playground/src/SimTop.scala:25:26, :60:24, :63:24]
  wire        IsaB_bge = _GEN == 10'h2E3;	// @[playground/src/SimTop.scala:25:26, :60:24, :64:24]
  wire        IsaB_bltu = _GEN == 10'h363;	// @[playground/src/SimTop.scala:25:26, :60:24, :65:24]
  wire        IsaB_bgeu = _GEN == 10'h3E3;	// @[playground/src/SimTop.scala:25:26, :60:24, :66:24]
  wire        IsaI_lb = _GEN == 10'h3;	// @[playground/src/SimTop.scala:23:26, :60:24, :67:24]
  wire        IsaI_lh = _GEN == 10'h83;	// @[playground/src/SimTop.scala:23:26, :60:24, :68:24]
  wire        IsaI_lw = _GEN == 10'h103;	// @[playground/src/SimTop.scala:23:26, :60:24, :69:24]
  wire        IsaI_lbu = _GEN == 10'h203;	// @[playground/src/SimTop.scala:23:26, :60:24, :70:24]
  wire        IsaI_lhu = _GEN == 10'h283;	// @[playground/src/SimTop.scala:23:26, :60:24, :71:24]
  wire        IsaS_sb = _GEN == 10'h23;	// @[playground/src/SimTop.scala:24:26, :60:24, :72:24]
  wire        IsaS_sh = _GEN == 10'hA3;	// @[playground/src/SimTop.scala:24:26, :60:24, :73:24]
  wire        IsaS_sw = _GEN == 10'h123;	// @[playground/src/SimTop.scala:24:26, :60:24, :74:24]
  wire        IsaI_addi = _GEN == 10'h13;	// @[playground/src/SimTop.scala:23:26, :60:24, :75:24]
  wire        IsaI_slti = _GEN == 10'h113;	// @[playground/src/SimTop.scala:23:26, :60:24, :76:24]
  wire        IsaI_sltiu = _GEN == 10'h193;	// @[playground/src/SimTop.scala:23:26, :60:24, :77:24]
  wire        IsaI_xori = _GEN == 10'h213;	// @[playground/src/SimTop.scala:23:26, :60:24, :78:24]
  wire        IsaI_ori = _GEN == 10'h313;	// @[playground/src/SimTop.scala:23:26, :60:24, :79:24]
  wire        IsaI_andi = _GEN == 10'h393;	// @[playground/src/SimTop.scala:23:26, :60:24, :80:24]
  wire [16:0] _GEN_0 = {io_inst[31:25], io_inst[14:12], io_inst[6:0]};	// @[playground/src/SimTop.scala:27:28, :57:24, :60:24, :81:24]
  wire        IsaI_slli = _GEN_0 == 17'h93;	// @[playground/src/SimTop.scala:23:26, :81:24]
  wire        IsaI_srli = _GEN_0 == 17'h293;	// @[playground/src/SimTop.scala:23:26, :81:24, :82:24]
  wire        IsaI_srai = _GEN_0 == 17'h8293;	// @[playground/src/SimTop.scala:23:26, :81:24, :83:24]
  wire        IsaR_add = _GEN_0 == 17'h33;	// @[playground/src/SimTop.scala:22:26, :81:24, :84:24]
  wire        IsaR_sub = _GEN_0 == 17'h8033;	// @[playground/src/SimTop.scala:22:26, :81:24, :85:24]
  wire        IsaR_sll = _GEN_0 == 17'hB3;	// @[playground/src/SimTop.scala:22:26, :81:24, :86:24]
  wire        IsaR_slt = _GEN_0 == 17'h133;	// @[playground/src/SimTop.scala:22:26, :81:24, :87:24]
  wire        IsaR_sltu = _GEN_0 == 17'h1B3;	// @[playground/src/SimTop.scala:22:26, :81:24, :88:24]
  wire        IsaR_xor = _GEN_0 == 17'h233;	// @[playground/src/SimTop.scala:22:26, :81:24, :89:24]
  wire        IsaR_srl = _GEN_0 == 17'h2B3;	// @[playground/src/SimTop.scala:22:26, :81:24, :90:24]
  wire        IsaR_sra = _GEN_0 == 17'h82B3;	// @[playground/src/SimTop.scala:22:26, :81:24, :91:24]
  wire        IsaR_or = _GEN_0 == 17'h333;	// @[playground/src/SimTop.scala:22:26, :81:24, :92:24]
  wire        IsaR_and = _GEN_0 == 17'h3B3;	// @[playground/src/SimTop.scala:22:26, :81:24, :93:24]
  wire        IsaI_ebreak;	// @[playground/src/SimTop.scala:23:26]
  assign IsaI_ebreak = io_inst == 32'h100073;	// @[playground/src/SimTop.scala:23:26, :27:28, :96:24]
  wire [4:0]  _Imm_T =
    {|{IsaI_jalr,
       IsaI_lb,
       IsaI_lh,
       IsaI_lw,
       IsaI_lbu,
       IsaI_lhu,
       IsaI_addi,
       IsaI_slti,
       IsaI_sltiu,
       IsaI_xori,
       IsaI_ori,
       IsaI_andi,
       IsaI_slli,
       IsaI_srli,
       IsaI_srai,
       IsaI_ebreak},
     |{IsaS_sb, IsaS_sh, IsaS_sw},
     |{IsaB_beq, IsaB_bne, IsaB_blt, IsaB_bge, IsaB_bltu, IsaB_bgeu},
     |{IsaU_lui, IsaU_auipc, IsaU_jal},
     IsaU_jal};	// @[playground/src/SimTop.scala:23:26, :24:26, :25:26, :26:26, :100:{30,36}, :101:{30,36}, :102:{30,36}, :103:{30,36}, :105:28]
  assign Imm =
    _Imm_T == 5'h3
      ? {{12{io_inst[19]}}, io_inst[19:12], io_inst[20], io_inst[30:21], 1'h0}
      : _Imm_T == 5'h2
          ? {io_inst[31:12], 12'h0}
          : _Imm_T == 5'h4
              ? {{21{io_inst[7]}}, io_inst[30:25], io_inst[11:8], 1'h0}
              : _Imm_T == 5'h8
                  ? {{20{io_inst[31]}}, io_inst[31:25], io_inst[11:7]}
                  : _Imm_T == 5'h10 ? {{20{io_inst[31]}}, io_inst[31:20]} : 32'h0;	// @[playground/src/Bundle.scala:76:{10,15,37}, playground/src/SimTop.scala:27:28, :46:23, :47:{27,42}, :48:{39,50,65}, :49:{19,27}, :50:{39,54,66}, :105:{28,39}]
  wire        _alu_op_0_T = IsaI_addi | IsaR_add;	// @[playground/src/SimTop.scala:22:26, :23:26, :113:22]
  wire        wen =
    _alu_op_0_T | IsaI_andi | IsaR_and | IsaU_lui | IsaR_slt | IsaR_sltu | IsaR_sub
    | IsaI_ori | IsaR_or | IsaI_xori | IsaR_xor | IsaI_jalr | IsaU_jal | IsaU_auipc
    | IsaI_slti | IsaI_sltiu | IsaI_slli | IsaI_srai | IsaI_srli | IsaR_sll | IsaR_sra
    | IsaR_srl;	// @[playground/src/SimTop.scala:22:26, :23:26, :26:26, :113:22, :117:57]
  wire        result_is_snpc = IsaU_jal | IsaI_jalr;	// @[playground/src/SimTop.scala:23:26, :26:26, :120:31]
  wire        alu_op_9 = IsaI_srai | IsaR_sra;	// @[playground/src/SimTop.scala:22:26, :23:26, :121:29]
  wire        is_jump =
    result_is_snpc | IsaB_beq & _alu_io_result[0] | IsaB_bne & ~(_alu_io_result[0])
    | IsaB_blt & _alu_io_result[0] | IsaB_bltu & _alu_io_result[0] | IsaB_bge
    & ~(_alu_io_result[0]) | IsaB_bgeu & ~(_alu_io_result[0]);	// @[playground/src/SimTop.scala:20:29, :25:26, :120:31, :163:18, :176:{24,41}, :177:{24,27}, :178:24, :179:24, :180:{24,27}, :181:{13,24,27}]
  wire [31:0] _io_result_output = IsaU_lui ? Imm : result_is_snpc ? snpc : _alu_io_result;	// @[playground/src/SimTop.scala:16:26, :26:26, :105:39, :120:31, :163:18, :186:17, :187:18]
  wire [31:0] _jalr_tmp_T = _alu_io_result + Imm;	// @[playground/src/SimTop.scala:105:39, :163:18, :188:29]
  assign jalr_taget = {_jalr_tmp_T[31:1], 1'h0};	// @[playground/src/SimTop.scala:14:32, :27:28, :188:29, :189:{18,27}]
  always @(posedge clock) begin	// @[<stdin>:141:11]
    io_inst <= _pmem_dpi_inst;	// @[playground/src/SimTop.scala:13:22, :27:28]
    if (reset)	// @[<stdin>:141:11]
      REGpc <= 32'h7FFFFFFC;	// @[playground/src/SimTop.scala:30:20]
    else if (is_jump)	// @[playground/src/SimTop.scala:20:29]
      REGpc <= dnpc;	// @[playground/src/SimTop.scala:17:26, :30:20]
    else	// @[playground/src/SimTop.scala:20:29]
      REGpc <= snpc;	// @[playground/src/SimTop.scala:16:26, :30:20]
  end // always @(posedge)
  pmem_dpi pmem_dpi (	// @[playground/src/SimTop.scala:13:22]
    .clock  (clock),
    .reset  (reset),
    .pc     (REGpc),	// @[playground/src/SimTop.scala:30:20]
    .nextpc (nextpc),	// @[playground/src/SimTop.scala:15:28]
    .inst   (_pmem_dpi_inst)
  );
  RegFile RegFile (	// @[playground/src/SimTop.scala:155:21]
    .clock     (clock),
    .reset     (reset),
    .io_waddr  (io_inst[11:7]),	// @[playground/src/SimTop.scala:27:28, :47:42]
    .io_wdata  (_io_result_output),	// @[playground/src/SimTop.scala:186:17]
    .io_raddr1 (IsaI_ebreak ? 5'hA : io_inst[19:15]),	// @[playground/src/SimTop.scala:23:26, :27:28, :52:23, :156:25]
    .io_raddr2 (IsaI_ebreak ? 5'h0 : io_inst[24:20]),	// @[playground/src/SimTop.scala:23:26, :27:28, :51:23, :157:25]
    .io_wen    (wen),	// @[playground/src/SimTop.scala:117:57]
    .io_rdata1 (_RegFile_io_rdata1),
    .io_rdata2 (_RegFile_io_rdata2)
  );
  Alu alu (	// @[playground/src/SimTop.scala:163:18]
    .io_op
      ({1'h0,
        IsaI_srli | IsaR_srl,
        alu_op_9,
        IsaI_slli | IsaR_sll,
        IsaB_blt | IsaB_bltu | IsaB_bge | IsaB_bgeu | IsaR_slt | IsaR_sltu | IsaI_slti
          | IsaI_sltiu,
        IsaB_beq | IsaB_bne,
        IsaI_xori | IsaR_xor,
        IsaI_ori | IsaR_or,
        IsaI_andi | IsaR_and,
        1'h0,
        IsaR_sub,
        _alu_op_0_T | IsaI_ebreak | IsaI_jalr | IsaU_auipc}),	// @[playground/src/SimTop.scala:22:26, :23:26, :25:26, :26:26, :27:28, :113:22, :121:29, :130:63, :136:25, :138:25, :140:25, :142:25, :145:25, :147:25, :151:25, :169:23]
    .io_src1   (IsaU_auipc ? REGpc : _RegFile_io_rdata1),	// @[playground/src/SimTop.scala:26:26, :30:20, :155:21, :164:15]
    .io_src2
      (IsaI_addi | IsaI_slti | IsaI_sltiu | IsaI_xori | IsaI_ori | IsaI_andi | IsaI_jalr
       | IsaU_auipc
         ? Imm
         : IsaI_slli | IsaI_srai | IsaI_srli
             ? {26'h0, io_inst[25:20]}
             : IsaR_sll | IsaR_sra | IsaR_srl
                 ? {26'h0, _RegFile_io_rdata2[5:0]}
                 : _RegFile_io_rdata2),	// @[playground/src/SimTop.scala:22:26, :23:26, :26:26, :27:28, :57:24, :105:39, :123:98, :124:47, :125:47, :155:21, :165:15, :166:{16,44}, :167:{18,46}]
    .io_sign   (alu_op_9 | IsaR_slt | IsaB_blt | IsaB_bltu),	// @[playground/src/SimTop.scala:22:26, :25:26, :121:{29,63}]
    .io_result (_alu_io_result)
  );
  singal_dpi singal_dpi (	// @[playground/src/SimTop.scala:192:24]
    .clock       (clock),
    .reset       (reset),
    .pc          (REGpc),	// @[playground/src/SimTop.scala:30:20]
    .nextpc      (nextpc),	// @[playground/src/SimTop.scala:15:28]
    .inst        (io_inst),	// @[playground/src/SimTop.scala:27:28]
    .rd          ({27'h0, io_inst[11:7]}),	// @[playground/src/SimTop.scala:27:28, :47:42, :58:24, :198:19]
    .is_jal      (IsaU_jal),	// @[playground/src/SimTop.scala:26:26]
    .func_flag   (result_is_snpc),	// @[playground/src/SimTop.scala:120:31]
    .ebreak_flag (IsaI_ebreak),	// @[playground/src/SimTop.scala:23:26]
    .inv_flag
      ({IsaB_beq, IsaB_bne, IsaB_blt, IsaB_bge, IsaB_bltu, IsaB_bgeu} == 6'h0
       & {IsaI_jalr,
          IsaI_lb,
          IsaI_lh,
          IsaI_lw,
          IsaI_lbu,
          IsaI_lhu,
          IsaI_addi,
          IsaI_slti,
          IsaI_sltiu,
          IsaI_xori,
          IsaI_ori,
          IsaI_andi,
          IsaI_slli,
          IsaI_srli,
          IsaI_srai,
          IsaI_ebreak} == 16'h0
       & {IsaR_add,
          IsaR_sub,
          IsaR_sll,
          IsaR_slt,
          IsaR_sltu,
          IsaR_xor,
          IsaR_srl,
          IsaR_sra,
          IsaR_or,
          IsaR_and} == 10'h0 & {IsaS_sb, IsaS_sh, IsaS_sw} == 3'h0
       & {IsaU_lui, IsaU_auipc, IsaU_jal} == 3'h0),	// @[playground/src/SimTop.scala:22:26, :23:26, :24:26, :25:26, :26:26, :95:{22,28,42,48,62,68,82,88,95,102,108}]
    .ret_reg     (_alu_io_result)	// @[playground/src/SimTop.scala:163:18]
  );
  assign io_result = _io_result_output;	// @[<stdin>:140:3, playground/src/SimTop.scala:186:17]
  assign io_wen = wen;	// @[<stdin>:140:3, playground/src/SimTop.scala:117:57]
  assign io_imm = Imm;	// @[<stdin>:140:3, playground/src/SimTop.scala:105:39]
endmodule

