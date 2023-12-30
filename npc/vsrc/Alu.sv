// Generated by CIRCT firtool-1.56.0
module Alu(	// @[<stdin>:791:3]
  input  [3:0]  io_op,	// @[playground/src/Alu.scala:5:14]
  input  [31:0] io_src1,	// @[playground/src/Alu.scala:5:14]
                io_src2,	// @[playground/src/Alu.scala:5:14]
  output [31:0] io_result	// @[playground/src/Alu.scala:5:14]
);

  assign io_result =
    io_op == 4'h4
      ? io_src1 ^ io_src2
      : io_op == 4'h3
          ? io_src1 | io_src2
          : io_op == 4'h2
              ? io_src1 & io_src2
              : io_op == 4'h1
                  ? io_src1 - io_src2
                  : io_op == 4'h0 ? io_src1 + io_src2 : 32'h0;	// @[<stdin>:791:3, playground/src/Alu.scala:16:24, :18:24, :22:25, :24:25, :26:25, :34:37]
endmodule

