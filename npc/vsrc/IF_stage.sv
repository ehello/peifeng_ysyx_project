// Generated by CIRCT firtool-1.56.0
module IF_stage(	// @[<stdin>:3:3]
  input         clock,	// @[<stdin>:4:11]
                reset,	// @[<stdin>:5:11]
  input  [31:0] io_jalr_taget,	// @[playground/src/IF_stage.scala:6:14]
  input         io_is_not_jalr,	// @[playground/src/IF_stage.scala:6:14]
                io_is_jump,	// @[playground/src/IF_stage.scala:6:14]
  input  [31:0] io_Imm,	// @[playground/src/IF_stage.scala:6:14]
  output [31:0] io_pc,	// @[playground/src/IF_stage.scala:6:14]
                io_nextpc,	// @[playground/src/IF_stage.scala:6:14]
                io_f_dbus_snpc	// @[playground/src/IF_stage.scala:6:14]
);

  reg  [31:0] REGpc;	// @[playground/src/IF_stage.scala:15:27]
  wire [31:0] snpc = REGpc + 32'h4;	// @[playground/src/IF_stage.scala:15:27, :16:34, :19:18]
  wire [31:0] dnpc = io_is_not_jalr ? REGpc + io_Imm : io_jalr_taget;	// @[playground/src/IF_stage.scala:15:27, :17:34, :20:{15,38}]
  always @(posedge clock) begin	// @[<stdin>:4:11]
    if (reset)	// @[<stdin>:4:11]
      REGpc <= 32'h7FFFFFFC;	// @[playground/src/IF_stage.scala:15:27]
    else if (io_is_jump)	// @[playground/src/IF_stage.scala:6:14]
      REGpc <= dnpc;	// @[playground/src/IF_stage.scala:15:27, :17:34]
    else	// @[playground/src/IF_stage.scala:6:14]
      REGpc <= snpc;	// @[playground/src/IF_stage.scala:15:27, :16:34]
  end // always @(posedge)
  assign io_pc = REGpc;	// @[<stdin>:3:3, playground/src/IF_stage.scala:15:27]
  assign io_nextpc = io_is_jump ? dnpc : snpc;	// @[<stdin>:3:3, playground/src/IF_stage.scala:16:34, :17:34, :21:15]
  assign io_f_dbus_snpc = snpc;	// @[<stdin>:3:3, playground/src/IF_stage.scala:16:34]
endmodule

