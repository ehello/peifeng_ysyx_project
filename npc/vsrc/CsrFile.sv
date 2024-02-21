// Generated by CIRCT firtool-1.56.0
module CsrFile(	// @[<stdin>:1248:3]
  input         clock,	// @[<stdin>:1249:11]
                reset,	// @[<stdin>:1250:11]
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
  wire [31:0] csr_data =
    io_csr_addr == 12'h343
      ? mtval
      : io_csr_addr == 12'h342
          ? mcause
          : io_csr_addr == 12'h341
              ? mepc
              : io_csr_addr == 12'h300 ? mstatus : io_csr_addr == 12'h305 ? mtvec : 32'h0;	// @[playground/src/Csr.scala:36:22, :37:22, :38:22, :39:22, :40:22, :42:30, :47:39]
  wire [31:0] wdata =
    io_csr_cmd == 5'h4
      ? io_in
      : io_csr_cmd == 5'h2 ? csr_data | io_in : io_csr_cmd == 5'h1 ? io_in : 32'h0;	// @[playground/src/Csr.scala:34:{26,48}, :36:22, :41:29, :42:30, :55:35, :57:21]
  wire        _io_out_T = io_csr_addr == 12'h342;	// @[playground/src/Csr.scala:47:39, :60:26]
  wire        _GEN = io_csr_cmd == 5'h4;	// @[playground/src/Csr.scala:55:35, :64:20]
  wire        _GEN_0 = io_csr_addr == 12'h305;	// @[playground/src/Csr.scala:47:39, :73:23]
  wire        _GEN_1 = io_csr_addr == 12'h300;	// @[playground/src/Csr.scala:47:39, :75:28]
  wire        _GEN_2 = (|io_csr_cmd) & csr_wen;	// @[playground/src/Csr.scala:35:35, :37:22, :63:{18,27}, :72:18, :73:36]
  wire        _GEN_3 = io_csr_addr == 12'h341;	// @[playground/src/Csr.scala:47:39, :76:28]
  wire        _GEN_4 = io_csr_addr == 12'h343;	// @[playground/src/Csr.scala:47:39, :78:28]
  wire        _GEN_5 = _GEN_0 | _GEN_1 | _GEN_3 | _io_out_T;	// @[playground/src/Csr.scala:40:22, :60:26, :73:{23,36}, :75:{28,43}, :76:{28,43}, :77:43, :78:43]
  always @(posedge clock) begin	// @[<stdin>:1249:11]
    if (reset) begin	// @[<stdin>:1249:11]
      mtvec <= 32'h0;	// @[playground/src/Csr.scala:36:22]
      mstatus <= 32'h1800;	// @[playground/src/Csr.scala:37:22]
      mepc <= 32'h0;	// @[playground/src/Csr.scala:36:22, :38:22]
      mcause <= 32'h0;	// @[playground/src/Csr.scala:36:22, :39:22]
      mtval <= 32'h0;	// @[playground/src/Csr.scala:36:22, :40:22]
    end
    else begin	// @[<stdin>:1249:11]
      if ((|io_csr_cmd) & csr_wen & _GEN_0)	// @[playground/src/Csr.scala:35:35, :36:22, :63:{18,27}, :72:18, :73:{23,36}, :74:14]
        mtvec <= wdata;	// @[playground/src/Csr.scala:36:22, :41:29]
      if (~_GEN_2 | _GEN_0 | ~_GEN_1) begin	// @[playground/src/Csr.scala:37:22, :63:27, :72:18, :73:{23,36}, :75:{28,43}]
      end
      else	// @[playground/src/Csr.scala:37:22, :63:27, :72:18, :73:36]
        mstatus <= wdata;	// @[playground/src/Csr.scala:37:22, :41:29]
      if (|io_csr_cmd) begin	// @[playground/src/Csr.scala:63:18]
        if (~csr_wen | _GEN_0 | _GEN_1 | ~_GEN_3) begin	// @[playground/src/Csr.scala:35:35, :64:33, :72:18, :73:{23,36}, :75:{28,43}, :76:{28,43}]
          if (_GEN)	// @[playground/src/Csr.scala:64:20]
            mepc <= io_pc;	// @[playground/src/Csr.scala:38:22]
        end
        else	// @[playground/src/Csr.scala:64:33, :72:18, :73:36]
          mepc <= wdata;	// @[playground/src/Csr.scala:38:22, :41:29]
        if (~csr_wen | _GEN_0 | _GEN_1 | _GEN_3 | ~_io_out_T) begin	// @[playground/src/Csr.scala:35:35, :60:26, :64:33, :72:18, :73:{23,36}, :75:{28,43}, :76:{28,43}, :77:43]
          if (_GEN)	// @[playground/src/Csr.scala:64:20]
            mcause <= wdata;	// @[playground/src/Csr.scala:39:22, :41:29]
        end
        else	// @[playground/src/Csr.scala:64:33, :72:18, :73:36]
          mcause <= 32'hB;	// @[playground/src/Csr.scala:39:22, :60:14]
      end
      if (~_GEN_2 | _GEN_5 | ~_GEN_4) begin	// @[playground/src/Csr.scala:37:22, :40:22, :63:27, :72:18, :73:36, :75:43, :76:43, :77:43, :78:{28,43}]
      end
      else	// @[playground/src/Csr.scala:40:22, :63:27, :72:18, :73:36]
        mtval <= wdata;	// @[playground/src/Csr.scala:40:22, :41:29]
    end
  end // always @(posedge)
  csr_debug_dpic csr_dpic (	// @[playground/src/Csr.scala:83:22]
    .clock      (clock),
    .reset      (reset),
    .csr_valid  (|io_csr_cmd),	// @[playground/src/Csr.scala:63:18]
    .assert_wen (_GEN_2 & ~_GEN_5 & ~_GEN_4)	// @[playground/src/Csr.scala:37:22, :40:22, :44:33, :63:27, :72:18, :73:36, :75:43, :76:43, :77:43, :78:{28,43}, :79:33]
  );
  assign io_out_wen = _csr_wen_T | _csr_wen_T_1;	// @[<stdin>:1248:3, playground/src/Csr.scala:34:{26,35,48}]
  assign io_out = _io_out_T ? 32'hB : wdata;	// @[<stdin>:1248:3, playground/src/Csr.scala:41:29, :60:{14,26}]
  assign io_epc =
    (|io_csr_cmd) ? (io_csr_cmd == 5'h3 ? mepc : _GEN ? mtvec : 32'h0) : 32'h0;	// @[<stdin>:1248:3, playground/src/Csr.scala:36:22, :38:22, :45:9, :63:{18,27}, :64:{20,33}, :67:13, :69:{20,32}, :70:13]
endmodule

