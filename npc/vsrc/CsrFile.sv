// Generated by CIRCT firtool-1.56.0
module CsrFile(	// @[<stdin>:826:3]
  input         clock,	// @[<stdin>:827:11]
                reset,	// @[<stdin>:828:11]
  input  [4:0]  io_csr_cmd,	// @[playground/src/Csr.scala:22:12]
  input  [11:0] io_csr_raddr,	// @[playground/src/Csr.scala:22:12]
                io_csr_waddr,	// @[playground/src/Csr.scala:22:12]
  input         io_csr_wen,	// @[playground/src/Csr.scala:22:12]
  input  [31:0] io_csr_wdata,	// @[playground/src/Csr.scala:22:12]
                io_mepc_in,	// @[playground/src/Csr.scala:22:12]
  input         io_ecpt_wen,	// @[playground/src/Csr.scala:22:12]
  output [31:0] io_out,	// @[playground/src/Csr.scala:22:12]
                io_global_mtvec,	// @[playground/src/Csr.scala:22:12]
                io_global_mepc	// @[playground/src/Csr.scala:22:12]
);

  reg  [31:0] mtvec;	// @[playground/src/Csr.scala:37:22]
  reg  [31:0] mstatus;	// @[playground/src/Csr.scala:38:22]
  reg  [31:0] mepc;	// @[playground/src/Csr.scala:39:22]
  reg  [31:0] mcause;	// @[playground/src/Csr.scala:40:22]
  reg  [31:0] mtval;	// @[playground/src/Csr.scala:41:22]
  wire        _GEN = io_csr_waddr == 12'h305;	// @[playground/src/Csr.scala:47:38, :71:22]
  wire        _GEN_0 = io_csr_waddr == 12'h300;	// @[playground/src/Csr.scala:47:38, :73:27]
  wire        _GEN_1 = io_csr_waddr == 12'h341;	// @[playground/src/Csr.scala:47:38, :74:27]
  wire        _GEN_2 = io_csr_waddr == 12'h342;	// @[playground/src/Csr.scala:47:38, :75:27]
  wire        _GEN_3 = io_csr_waddr == 12'h343;	// @[playground/src/Csr.scala:47:38, :76:27]
  wire        _GEN_4 = _GEN | _GEN_0 | _GEN_1 | _GEN_2;	// @[playground/src/Csr.scala:41:22, :71:{22,35}, :73:{27,42}, :74:{27,42}, :75:{27,42}, :76:42]
  always @(posedge clock) begin	// @[<stdin>:827:11]
    if (reset) begin	// @[<stdin>:827:11]
      mtvec <= 32'h0;	// @[playground/src/Csr.scala:37:22]
      mstatus <= 32'h1800;	// @[playground/src/Csr.scala:38:22]
      mepc <= 32'h0;	// @[playground/src/Csr.scala:37:22, :39:22]
      mcause <= 32'h0;	// @[playground/src/Csr.scala:37:22, :40:22]
      mtval <= 32'h0;	// @[playground/src/Csr.scala:37:22, :41:22]
    end
    else begin	// @[<stdin>:827:11]
      if (io_csr_wen & _GEN)	// @[playground/src/Csr.scala:37:22, :70:19, :71:{22,35}, :72:12]
        mtvec <= io_csr_wdata;	// @[playground/src/Csr.scala:37:22]
      if (~io_csr_wen | _GEN | ~_GEN_0) begin	// @[playground/src/Csr.scala:38:22, :70:19, :71:{22,35}, :73:{27,42}]
      end
      else	// @[playground/src/Csr.scala:38:22, :70:19, :71:35]
        mstatus <= io_csr_wdata;	// @[playground/src/Csr.scala:38:22]
      if (~io_csr_wen | _GEN | _GEN_0 | ~_GEN_1) begin	// @[playground/src/Csr.scala:38:22, :61:20, :70:19, :71:{22,35}, :73:{27,42}, :74:{27,42}]
        if (io_ecpt_wen)	// @[playground/src/Csr.scala:22:12]
          mepc <= io_mepc_in;	// @[playground/src/Csr.scala:39:22]
      end
      else	// @[playground/src/Csr.scala:61:20, :70:19, :71:35]
        mepc <= io_csr_wdata;	// @[playground/src/Csr.scala:39:22]
      if (io_csr_wen & ~(_GEN | _GEN_0 | _GEN_1) & _GEN_2 | io_ecpt_wen)	// @[playground/src/Csr.scala:40:22, :61:20, :63:11, :70:19, :71:{22,35}, :73:{27,42}, :74:{27,42}, :75:{27,42,50}]
        mcause <= 32'hB;	// @[playground/src/Csr.scala:22:12, :40:22]
      if (~io_csr_wen | _GEN_4 | ~_GEN_3) begin	// @[playground/src/Csr.scala:38:22, :41:22, :70:19, :71:35, :73:42, :74:42, :75:42, :76:{27,42}]
      end
      else	// @[playground/src/Csr.scala:41:22, :70:19, :71:35]
        mtval <= io_csr_wdata;	// @[playground/src/Csr.scala:41:22]
    end
  end // always @(posedge)
  dpi_csrdebug csr_dpic (	// @[playground/src/Csr.scala:81:22]
    .clock      (clock),
    .reset      (reset),
    .csr_valid  (|io_csr_cmd),	// @[playground/src/Csr.scala:84:36]
    .assert_wen (io_csr_wen & ~_GEN_4 & ~_GEN_3)	// @[playground/src/Csr.scala:41:22, :43:33, :70:19, :71:35, :73:42, :74:42, :75:42, :76:{27,42}, :77:31]
  );
  assign io_out =
    io_csr_raddr == 12'h343
      ? mtval
      : io_csr_raddr == 12'h342
          ? mcause
          : io_csr_raddr == 12'h341
              ? mepc
              : io_csr_raddr == 12'h300
                  ? mstatus
                  : io_csr_raddr == 12'h305 ? mtvec : 32'h0;	// @[<stdin>:826:3, playground/src/Csr.scala:37:22, :38:22, :39:22, :40:22, :41:22, :47:38]
  assign io_global_mtvec = io_csr_cmd == 5'h4 ? mtvec : 32'h0;	// @[<stdin>:826:3, playground/src/Csr.scala:37:22, :44:18, :57:{18,31}, :58:20]
  assign io_global_mepc = io_csr_cmd == 5'h3 ? mepc : 32'h0;	// @[<stdin>:826:3, playground/src/Csr.scala:37:22, :39:22, :45:17, :66:{18,30}, :67:19]
endmodule

