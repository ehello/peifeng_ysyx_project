// Generated by CIRCT firtool-1.56.0
module Br_option(	// @[<stdin>:1488:3]
  input         io_Jtype_taken,	// @[playground/src/Br_cond.scala:67:12]
  input  [31:0] io_Jtype_target,	// @[playground/src/Br_cond.scala:67:12]
  input         io_Btype_taken,	// @[playground/src/Br_cond.scala:67:12]
  input  [31:0] io_Btype_target,	// @[playground/src/Br_cond.scala:67:12]
  output        io_out_taken,	// @[playground/src/Br_cond.scala:67:12]
  output [31:0] io_out_target	// @[playground/src/Br_cond.scala:67:12]
);

  assign io_out_taken = io_Jtype_taken | io_Btype_taken;	// @[<stdin>:1488:3, playground/src/Br_cond.scala:72:31]
  assign io_out_target = io_Jtype_taken ? io_Jtype_target : io_Btype_target;	// @[<stdin>:1488:3, playground/src/Br_cond.scala:73:21]
endmodule

