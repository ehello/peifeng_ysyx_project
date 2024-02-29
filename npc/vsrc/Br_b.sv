// Generated by CIRCT firtool-1.56.0
module Br_b(	// @[<stdin>:927:3]
  input  [3:0]  io_br_type,	// @[playground/src/Br_cond.scala:7:12]
  input  [31:0] io_rdata1,	// @[playground/src/Br_cond.scala:7:12]
                io_rdata2,	// @[playground/src/Br_cond.scala:7:12]
  output        io_taken	// @[playground/src/Br_cond.scala:7:12]
);

  wire rs1_eq_rs2 = io_rdata1 == io_rdata2;	// @[playground/src/Br_cond.scala:13:32]
  wire rs1_lt_rs2_s = $signed(io_rdata1) < $signed(io_rdata2);	// @[playground/src/Br_cond.scala:14:39]
  wire rs1_lt_rs2_u = io_rdata1 < io_rdata2;	// @[playground/src/Br_cond.scala:15:33]
  assign io_taken =
    io_br_type == 4'h3 & rs1_eq_rs2 | io_br_type == 4'h6 & ~rs1_eq_rs2
    | io_br_type == 4'h2 & rs1_lt_rs2_s | io_br_type == 4'h1 & rs1_lt_rs2_u
    | io_br_type == 4'h5 & ~rs1_lt_rs2_s | io_br_type == 4'h4 & ~rs1_lt_rs2_u;	// @[<stdin>:927:3, playground/src/Br_cond.scala:13:32, :14:39, :15:33, :17:{27,37}, :18:{27,37,40}, :19:{27,37}, :20:{27,37}, :21:{27,37,40}, :22:{13,27,37,40}]
endmodule

