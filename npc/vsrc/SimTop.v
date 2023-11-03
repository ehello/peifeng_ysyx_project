// Generated by CIRCT firtool-1.56.0
module SimTop(	// <stdin>:3:3
  input        clock,	// <stdin>:4:11
               reset,	// <stdin>:5:11
  input  [2:0] io_op,	// playground/src/SimTop.scala:5:14
  input  [3:0] io_a,	// playground/src/SimTop.scala:5:14
               io_b,	// playground/src/SimTop.scala:5:14
  output [3:0] io_out,	// playground/src/SimTop.scala:5:14
  output       io_of	// playground/src/SimTop.scala:5:14
);

  wire [2:0]      sum = io_a[2:0] + io_b[2:0];	// playground/src/SimTop.scala:13:18
  wire            _io_of_T_2 = io_op == 3'h1;	// playground/src/SimTop.scala:33:34
  wire [2:0]      _io_out_T_3 = _io_of_T_2 ? io_a[2:0] - io_b[2:0] : sum;	// playground/src/SimTop.scala:13:18, :17:18, :33:34
  wire [3:0]      _GEN = {_io_out_T_3[2], _io_out_T_3};	// playground/src/SimTop.scala:33:34
  wire [7:0][3:0] _GEN_0 =
    {{{3'h0, io_a == io_b}},
     {{3'h0, $signed(io_a) < $signed(io_b)}},
     {io_a ^ io_b},
     {io_a | io_b},
     {io_a & io_b},
     {~io_a},
     {_GEN},
     {_GEN}};	// playground/src/SimTop.scala:21:16, :23:21, :25:20, :27:21, :29:25, :31:24, :33:34, :39:33
  assign io_out = _GEN_0[io_op];	// <stdin>:3:3, playground/src/SimTop.scala:33:34
  assign io_of =
    _io_of_T_2
      ? io_a[3] != io_b[3] & io_a[3] < io_b[3]
      : io_op == 3'h0 & io_a[3] == io_b[3] & sum[2] != io_a[3];	// <stdin>:3:3, playground/src/SimTop.scala:13:18, :14:39, :15:{27,31,39,54,58}, :19:{31,44,56}, :33:34, :39:33
endmodule

