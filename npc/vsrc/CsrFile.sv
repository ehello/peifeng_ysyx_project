// Generated by CIRCT firtool-1.56.0
module CsrFile(	// @[<stdin>:1128:3]
  input         clock,	// @[<stdin>:1129:11]
                reset,	// @[<stdin>:1130:11]
  input  [4:0]  io_csr_cmd,	// @[playground/src/Csr.scala:22:12]
  input  [31:0] io_pc,	// @[playground/src/Csr.scala:22:12]
  input  [11:0] io_csr_addr,	// @[playground/src/Csr.scala:22:12]
  input  [31:0] io_in,	// @[playground/src/Csr.scala:22:12]
  output        io_out_wen,	// @[playground/src/Csr.scala:22:12]
  output [31:0] io_out,	// @[playground/src/Csr.scala:22:12]
                io_epc	// @[playground/src/Csr.scala:22:12]
);

  wire        _csr_wen_T = io_csr_cmd == 5'h1;	// @[playground/src/Csr.scala:34:26]
  wire        _csr_wen_T_1 = io_csr_cmd == 5'h2;	// @[playground/src/Csr.scala:34:48]
  wire        csr_wen = _csr_wen_T | _csr_wen_T_1;	// @[playground/src/Csr.scala:34:{26,48}, :35:35]
  reg  [31:0] mtvec;	// @[playground/src/Csr.scala:36:22]
  reg  [31:0] mstatus;	// @[playground/src/Csr.scala:37:22]
  reg  [31:0] mepc;	// @[playground/src/Csr.scala:38:22]
  reg  [31:0] mcause;	// @[playground/src/Csr.scala:39:22]
  reg  [31:0] mtval;	// @[playground/src/Csr.scala:40:22]
  wire [31:0] _io_out_output =
    io_csr_addr == 12'h343
      ? mtval
      : io_csr_addr == 12'h342
          ? mcause
          : io_csr_addr == 12'h341
              ? mepc
              : io_csr_addr == 12'h300 ? mstatus : io_csr_addr == 12'h305 ? mtvec : 32'h0;	// @[playground/src/Csr.scala:36:22, :37:22, :38:22, :39:22, :40:22, :46:37]
  wire [31:0] wdata =
    io_csr_cmd == 5'h2 ? _io_out_output | io_in : io_csr_cmd == 5'h1 ? io_in : 32'h0;	// @[playground/src/Csr.scala:34:{26,48}, :36:22, :41:29, :46:37, :54:35, :56:19]
  wire        _GEN = io_csr_cmd == 5'h4;	// @[playground/src/Csr.scala:61:20]
  wire        _GEN_0 = io_csr_addr == 12'h305;	// @[playground/src/Csr.scala:46:37, :70:23]
  wire        _GEN_1 = io_csr_addr == 12'h300;	// @[playground/src/Csr.scala:46:37, :71:27]
  wire        _GEN_2 = (|io_csr_cmd) & csr_wen;	// @[playground/src/Csr.scala:35:35, :37:22, :60:{18,27}, :69:18, :70:36]
  wire        _GEN_3 = io_csr_addr == 12'h341;	// @[playground/src/Csr.scala:46:37, :72:27]
  wire        _GEN_4 = io_csr_addr == 12'h342;	// @[playground/src/Csr.scala:46:37, :73:27]
  wire        _GEN_5 = io_csr_addr == 12'h343;	// @[playground/src/Csr.scala:46:37, :74:27]
  wire        _GEN_6 = _GEN_0 | _GEN_1 | _GEN_3 | _GEN_4;	// @[playground/src/Csr.scala:40:22, :70:{23,36}, :71:{27,42}, :72:{27,42}, :73:{27,42}, :74:42]
  always @(posedge clock) begin	// @[<stdin>:1129:11]
    if (reset) begin	// @[<stdin>:1129:11]
      mtvec <= 32'h0;	// @[playground/src/Csr.scala:36:22]
      mstatus <= 32'h1800;	// @[playground/src/Csr.scala:37:22]
      mepc <= 32'h0;	// @[playground/src/Csr.scala:36:22, :38:22]
      mcause <= 32'h0;	// @[playground/src/Csr.scala:36:22, :39:22]
      mtval <= 32'h0;	// @[playground/src/Csr.scala:36:22, :40:22]
    end
    else begin	// @[<stdin>:1129:11]
      if ((|io_csr_cmd) & csr_wen & _GEN_0)	// @[playground/src/Csr.scala:35:35, :36:22, :60:{18,27}, :69:18, :70:{23,36,43}]
        mtvec <= wdata;	// @[playground/src/Csr.scala:36:22, :41:29]
      if (~_GEN_2 | _GEN_0 | ~_GEN_1) begin	// @[playground/src/Csr.scala:37:22, :60:27, :69:18, :70:{23,36}, :71:{27,42}]
      end
      else	// @[playground/src/Csr.scala:37:22, :60:27, :69:18, :70:36]
        mstatus <= wdata;	// @[playground/src/Csr.scala:37:22, :41:29]
      if (|io_csr_cmd) begin	// @[playground/src/Csr.scala:60:18]
        if (~csr_wen | _GEN_0 | _GEN_1 | ~_GEN_3) begin	// @[playground/src/Csr.scala:35:35, :61:33, :69:18, :70:{23,36}, :71:{27,42}, :72:{27,42}]
          if (_GEN)	// @[playground/src/Csr.scala:61:20]
            mepc <= io_pc;	// @[playground/src/Csr.scala:38:22]
        end
        else	// @[playground/src/Csr.scala:61:33, :69:18, :70:36]
          mepc <= wdata;	// @[playground/src/Csr.scala:38:22, :41:29]
        if (~csr_wen | _GEN_0 | _GEN_1 | _GEN_3 | ~_GEN_4) begin	// @[playground/src/Csr.scala:35:35, :61:33, :69:18, :70:{23,36}, :71:{27,42}, :72:{27,42}, :73:{27,42}]
          if (_GEN)	// @[playground/src/Csr.scala:61:20]
            mcause <= 32'hB;	// @[playground/src/Csr.scala:39:22, :63:13]
        end
        else	// @[playground/src/Csr.scala:61:33, :69:18, :70:36]
          mcause <= wdata;	// @[playground/src/Csr.scala:39:22, :41:29]
      end
      if (~_GEN_2 | _GEN_6 | ~_GEN_5) begin	// @[playground/src/Csr.scala:37:22, :40:22, :60:27, :69:18, :70:36, :71:42, :72:42, :73:42, :74:{27,42}]
      end
      else	// @[playground/src/Csr.scala:40:22, :60:27, :69:18, :70:36]
        mtval <= wdata;	// @[playground/src/Csr.scala:40:22, :41:29]
    end
  end // always @(posedge)
  csr_debug_dpic csr_dpic (	// @[playground/src/Csr.scala:79:22]
    .clock      (clock),
    .reset      (reset),
    .csr_valid  (|io_csr_cmd),	// @[playground/src/Csr.scala:60:18]
    .assert_wen (_GEN_2 & ~_GEN_6 & ~_GEN_5)	// @[playground/src/Csr.scala:37:22, :40:22, :43:33, :60:27, :69:18, :70:36, :71:42, :72:42, :73:42, :74:{27,42}, :75:32]
  );
  assign io_out_wen = _csr_wen_T | _csr_wen_T_1;	// @[<stdin>:1128:3, playground/src/Csr.scala:34:{26,35,48}]
  assign io_out = _io_out_output;	// @[<stdin>:1128:3, playground/src/Csr.scala:46:37]
  assign io_epc =
    (|io_csr_cmd) ? (io_csr_cmd == 5'h3 ? mepc : _GEN ? mtvec : 32'h0) : 32'h0;	// @[<stdin>:1128:3, playground/src/Csr.scala:36:22, :38:22, :44:9, :60:{18,27}, :61:{20,33}, :64:13, :66:{20,32}, :67:13]
endmodule

