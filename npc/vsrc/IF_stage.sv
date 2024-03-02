// Generated by CIRCT firtool-1.56.0
module IF_stage(	// @[<stdin>:71:3]
  input         clock,	// @[<stdin>:72:11]
                reset,	// @[<stdin>:73:11]
                IF_IO_valid,	// @[playground/src/IF_stage.scala:7:12]
  input  [31:0] IF_IO_bits_nextpc,	// @[playground/src/IF_stage.scala:7:12]
                IF_IO_bits_pc,	// @[playground/src/IF_stage.scala:7:12]
  input         IF_to_id_ready,	// @[playground/src/IF_stage.scala:7:12]
                IF_for_id_flush,	// @[playground/src/IF_stage.scala:7:12]
                IF_for_ex_flush,	// @[playground/src/IF_stage.scala:7:12]
                IF_r_valid,	// @[playground/src/IF_stage.scala:7:12]
  input  [31:0] IF_r_bits_data,	// @[playground/src/IF_stage.scala:7:12]
  output        IF_IO_ready,	// @[playground/src/IF_stage.scala:7:12]
                IF_to_id_valid,	// @[playground/src/IF_stage.scala:7:12]
  output [31:0] IF_to_id_bits_nextpc,	// @[playground/src/IF_stage.scala:7:12]
                IF_to_id_bits_pc,	// @[playground/src/IF_stage.scala:7:12]
                IF_to_id_bits_inst	// @[playground/src/IF_stage.scala:7:12]
);

  wire        if_inst_is_valid = IF_r_valid;	// @[playground/src/IF_stage.scala:17:38]
  wire        if_ready_go = if_inst_is_valid;	// @[playground/src/IF_stage.scala:17:38, :23:33]
  wire        if_flush = IF_for_ex_flush | IF_for_id_flush;	// @[playground/src/IF_stage.scala:19:30, :20:30]
  reg         if_valid;	// @[playground/src/IF_stage.scala:22:33]
  wire        _IF_IO_ready_output = (~if_valid | if_ready_go & IF_to_id_ready) & ~reset;	// @[playground/src/IF_stage.scala:22:33, :23:33, :25:{19,29,44,63,66}]
  wire [31:0] if_inst = IF_r_valid ? IF_r_bits_data : 32'h0;	// @[playground/src/IF_stage.scala:16:36, :35:18, :36:12]
  always @(posedge clock) begin	// @[<stdin>:72:11]
    if (reset)	// @[<stdin>:72:11]
      if_valid <= 1'h0;	// @[playground/src/IF_stage.scala:22:33]
    else if (_IF_IO_ready_output)	// @[playground/src/IF_stage.scala:25:63]
      if_valid <= IF_IO_valid;	// @[playground/src/IF_stage.scala:22:33]
  end // always @(posedge)
  assign IF_IO_ready = _IF_IO_ready_output;	// @[<stdin>:71:3, playground/src/IF_stage.scala:25:63]
  assign IF_to_id_valid = ~if_flush & if_valid & if_ready_go;	// @[<stdin>:71:3, playground/src/IF_stage.scala:19:30, :22:33, :23:33, :29:22]
  assign IF_to_id_bits_nextpc = IF_IO_bits_nextpc;	// @[<stdin>:71:3]
  assign IF_to_id_bits_pc = IF_IO_bits_pc;	// @[<stdin>:71:3]
  assign IF_to_id_bits_inst = if_inst;	// @[<stdin>:71:3, playground/src/IF_stage.scala:16:36]
endmodule

