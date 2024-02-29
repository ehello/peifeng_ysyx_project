// Generated by CIRCT firtool-1.56.0
module Csr_alu(	// @[<stdin>:1190:3]
  input  [4:0]  io_csr_cmd,	// @[playground/src/Csr.scala:91:12]
  input  [31:0] io_in_csr,	// @[playground/src/Csr.scala:91:12]
                io_in_rdata1,	// @[playground/src/Csr.scala:91:12]
  output        io_wen,	// @[playground/src/Csr.scala:91:12]
  output [31:0] io_out	// @[playground/src/Csr.scala:91:12]
);

  assign io_wen = io_csr_cmd == 5'h1 | io_csr_cmd == 5'h2;	// @[<stdin>:1190:3, playground/src/Csr.scala:98:23, :99:{10,23}]
  assign io_out =
    io_csr_cmd == 5'h2
      ? io_in_csr | io_in_rdata1
      : io_csr_cmd == 5'h1 ? io_in_rdata1 : 32'h0;	// @[<stdin>:1190:3, playground/src/Csr.scala:98:23, :99:23, :100:36, :102:22]
endmodule

