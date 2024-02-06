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
  reg  [31:0] mtvec;	// @[playground/src/Csr.scala:36:18]
  reg  [31:0] mstatus;	// @[playground/src/Csr.scala:37:18]
  reg  [31:0] mepc;	// @[playground/src/Csr.scala:38:18]
  reg  [31:0] mcause;	// @[playground/src/Csr.scala:39:18]
  reg  [31:0] mtval;	// @[playground/src/Csr.scala:40:18]
  wire [31:0] _io_out_output =
    io_csr_addr == 12'h343
      ? mtval
      : io_csr_addr == 12'h342
          ? mcause
          : io_csr_addr == 12'h341
              ? mepc
              : io_csr_addr == 12'h300 ? mstatus : io_csr_addr == 12'h305 ? mtvec : 32'h0;	// @[playground/src/Csr.scala:36:18, :37:18, :38:18, :39:18, :40:18, :43:22, :45:37]
  wire        _GEN = io_csr_cmd == 5'h4;	// @[playground/src/Csr.scala:60:20]
  wire        _GEN_0 = io_csr_addr == 12'h305;	// @[playground/src/Csr.scala:45:37, :69:23]
  wire        _GEN_1 = io_csr_addr == 12'h300;	// @[playground/src/Csr.scala:45:37, :70:27]
  wire        _GEN_2 = (|io_csr_cmd) & csr_wen;	// @[playground/src/Csr.scala:35:35, :37:18, :59:{18,27}, :68:18, :69:36]
  wire        _GEN_3 = io_csr_addr == 12'h341;	// @[playground/src/Csr.scala:45:37, :71:27]
  wire        _GEN_4 = io_csr_addr == 12'h342;	// @[playground/src/Csr.scala:45:37, :72:27]
  wire        _GEN_5 = io_csr_addr == 12'h343;	// @[playground/src/Csr.scala:45:37, :73:27]
  wire        _GEN_6 = _GEN_0 | _GEN_1 | _GEN_3 | _GEN_4;	// @[playground/src/Csr.scala:40:18, :69:{23,36}, :70:{27,42}, :71:{27,42}, :72:{27,42}, :73:42]
  wire [31:0] _wdata_T = _io_out_output | io_in;	// @[playground/src/Csr.scala:45:37, :55:19]
  wire        _wdata_T_1 = io_csr_cmd == 5'h1;	// @[playground/src/Csr.scala:34:26, :53:38]
  wire        _wdata_T_3 = io_csr_cmd == 5'h2;	// @[playground/src/Csr.scala:34:48, :53:38]
  always @(posedge clock) begin	// @[<stdin>:1129:11]
    if ((|io_csr_cmd) & csr_wen & _GEN_0) begin	// @[playground/src/Csr.scala:35:35, :36:18, :59:{18,27}, :68:18, :69:{23,36,43}]
      if (_wdata_T_3)	// @[playground/src/Csr.scala:53:38]
        mtvec <= _wdata_T;	// @[playground/src/Csr.scala:36:18, :55:19]
      else if (_wdata_T_1)	// @[playground/src/Csr.scala:53:38]
        mtvec <= io_in;	// @[playground/src/Csr.scala:36:18]
      else	// @[playground/src/Csr.scala:53:38]
        mtvec <= 32'h0;	// @[playground/src/Csr.scala:36:18, :43:22]
    end
    if (~_GEN_2 | _GEN_0 | ~_GEN_1) begin	// @[playground/src/Csr.scala:37:18, :59:27, :68:18, :69:{23,36}, :70:{27,42}]
    end
    else if (_wdata_T_3)	// @[playground/src/Csr.scala:53:38]
      mstatus <= _wdata_T;	// @[playground/src/Csr.scala:37:18, :55:19]
    else if (_wdata_T_1)	// @[playground/src/Csr.scala:53:38]
      mstatus <= io_in;	// @[playground/src/Csr.scala:37:18]
    else	// @[playground/src/Csr.scala:53:38]
      mstatus <= 32'h0;	// @[playground/src/Csr.scala:37:18, :43:22]
    if (|io_csr_cmd) begin	// @[playground/src/Csr.scala:59:18]
      if (~csr_wen | _GEN_0 | _GEN_1 | ~_GEN_3) begin	// @[playground/src/Csr.scala:35:35, :60:33, :68:18, :69:{23,36}, :70:{27,42}, :71:{27,42}]
        if (_GEN)	// @[playground/src/Csr.scala:60:20]
          mepc <= io_pc;	// @[playground/src/Csr.scala:38:18]
      end
      else if (_wdata_T_3)	// @[playground/src/Csr.scala:53:38]
        mepc <= _wdata_T;	// @[playground/src/Csr.scala:38:18, :55:19]
      else if (_wdata_T_1)	// @[playground/src/Csr.scala:53:38]
        mepc <= io_in;	// @[playground/src/Csr.scala:38:18]
      else	// @[playground/src/Csr.scala:53:38]
        mepc <= 32'h0;	// @[playground/src/Csr.scala:38:18, :43:22]
      if (~csr_wen | _GEN_0 | _GEN_1 | _GEN_3 | ~_GEN_4) begin	// @[playground/src/Csr.scala:35:35, :60:33, :68:18, :69:{23,36}, :70:{27,42}, :71:{27,42}, :72:{27,42}]
        if (_GEN)	// @[playground/src/Csr.scala:60:20]
          mcause <= 32'hB;	// @[playground/src/Csr.scala:39:18, :62:13]
      end
      else if (_wdata_T_3)	// @[playground/src/Csr.scala:53:38]
        mcause <= _wdata_T;	// @[playground/src/Csr.scala:39:18, :55:19]
      else if (_wdata_T_1)	// @[playground/src/Csr.scala:53:38]
        mcause <= io_in;	// @[playground/src/Csr.scala:39:18]
      else	// @[playground/src/Csr.scala:53:38]
        mcause <= 32'h0;	// @[playground/src/Csr.scala:39:18, :43:22]
    end
    if (~_GEN_2 | _GEN_6 | ~_GEN_5) begin	// @[playground/src/Csr.scala:37:18, :40:18, :59:27, :68:18, :69:36, :70:42, :71:42, :72:42, :73:{27,42}]
    end
    else if (_wdata_T_3)	// @[playground/src/Csr.scala:53:38]
      mtval <= _wdata_T;	// @[playground/src/Csr.scala:40:18, :55:19]
    else if (_wdata_T_1)	// @[playground/src/Csr.scala:53:38]
      mtval <= io_in;	// @[playground/src/Csr.scala:40:18]
    else	// @[playground/src/Csr.scala:53:38]
      mtval <= 32'h0;	// @[playground/src/Csr.scala:40:18, :43:22]
  end // always @(posedge)
  csr_debug_dpic csr_dpic (	// @[playground/src/Csr.scala:78:22]
    .clock      (clock),
    .reset      (reset),
    .csr_valid  (|io_csr_cmd),	// @[playground/src/Csr.scala:59:18]
    .assert_wen (_GEN_2 & ~_GEN_6 & ~_GEN_5)	// @[playground/src/Csr.scala:36:18, :37:18, :40:18, :42:33, :59:27, :68:18, :69:36, :70:42, :71:42, :72:42, :73:{27,42}, :74:32]
  );
  assign io_out_wen = _csr_wen_T | _csr_wen_T_1;	// @[<stdin>:1128:3, playground/src/Csr.scala:34:{26,35,48}]
  assign io_out = _io_out_output;	// @[<stdin>:1128:3, playground/src/Csr.scala:45:37]
  assign io_epc =
    (|io_csr_cmd) ? (io_csr_cmd == 5'h3 ? mepc : _GEN ? mtvec : 32'h0) : 32'h0;	// @[<stdin>:1128:3, playground/src/Csr.scala:36:18, :38:18, :43:{9,22}, :59:{18,27}, :60:{20,33}, :63:13, :65:{20,32}, :66:13]
endmodule

