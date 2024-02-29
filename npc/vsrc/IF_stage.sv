// Generated by CIRCT firtool-1.56.0
module IF_stage(	// @[<stdin>:11:3]
  input         clock,	// @[<stdin>:12:11]
                reset,	// @[<stdin>:13:11]
                IF_to_id_ready,	// @[playground/src/IF_stage.scala:6:12]
                IF_for_id_Br_J_taken,	// @[playground/src/IF_stage.scala:6:12]
  input  [31:0] IF_for_id_Br_J_target,	// @[playground/src/IF_stage.scala:6:12]
  input         IF_for_id_flush,	// @[playground/src/IF_stage.scala:6:12]
  input  [31:0] IF_for_ex_epc_target,	// @[playground/src/IF_stage.scala:6:12]
  input         IF_for_ex_epc_taken,	// @[playground/src/IF_stage.scala:6:12]
                IF_for_ex_Br_B_taken,	// @[playground/src/IF_stage.scala:6:12]
  input  [31:0] IF_for_ex_Br_B_target,	// @[playground/src/IF_stage.scala:6:12]
  input         IF_for_ex_flush,	// @[playground/src/IF_stage.scala:6:12]
  output        IF_to_id_valid,	// @[playground/src/IF_stage.scala:6:12]
  output [31:0] IF_to_id_bits_nextpc,	// @[playground/src/IF_stage.scala:6:12]
                IF_to_id_bits_pc,	// @[playground/src/IF_stage.scala:6:12]
                IF_to_id_bits_inst	// @[playground/src/IF_stage.scala:6:12]
);

  wire        if_ready_go = IF_to_id_ready;	// @[playground/src/IF_stage.scala:29:33]
  wire [31:0] if_inst = 32'h0;	// @[playground/src/IF_stage.scala:47:36]
  wire        if_flush = IF_for_ex_flush | IF_for_id_flush;	// @[playground/src/IF_stage.scala:25:30, :26:29]
  reg         if_valid;	// @[playground/src/IF_stage.scala:28:33]
  wire        _IF_to_id_valid_output = ~if_flush & if_valid & if_ready_go;	// @[playground/src/IF_stage.scala:25:30, :28:33, :29:33, :34:22]
  reg  [31:0] if_pc;	// @[playground/src/IF_stage.scala:42:26]
  wire [31:0] if_snpc = if_pc + 32'h4;	// @[playground/src/IF_stage.scala:42:26, :43:33, :49:20]
  wire [31:0] if_dnpc =
    IF_for_ex_epc_taken
      ? IF_for_ex_epc_target
      : IF_for_id_Br_J_taken ? IF_for_id_Br_J_target : IF_for_ex_Br_B_target;	// @[playground/src/IF_stage.scala:39:17, :44:33, :50:17]
  wire [31:0] if_nextpc =
    IF_for_id_Br_J_taken | IF_for_ex_Br_B_taken | IF_for_ex_epc_taken ? if_dnpc : if_snpc;	// @[playground/src/IF_stage.scala:43:33, :44:33, :45:33, :51:{18,28}]
  always @(posedge clock) begin	// @[<stdin>:12:11]
    if (reset) begin	// @[<stdin>:12:11]
      if_valid <= 1'h0;	// @[playground/src/IF_stage.scala:28:33]
      if_pc <= 32'h7FFFFFFC;	// @[playground/src/IF_stage.scala:42:26]
    end
    else begin	// @[<stdin>:12:11]
      if_valid <= if_ready_go | if_valid;	// @[playground/src/IF_stage.scala:28:33, :29:33, :31:20, :32:13]
      if (_IF_to_id_valid_output)	// @[playground/src/IF_stage.scala:34:22]
        if_pc <= if_nextpc;	// @[playground/src/IF_stage.scala:42:26, :45:33]
    end
  end // always @(posedge)
  read_inst Fetch (	// @[playground/src/IF_stage.scala:82:19]
    .clock     (clock),
    .reset     (reset),
    .nextpc    (if_nextpc),	// @[playground/src/IF_stage.scala:45:33]
    .fetch_wen (if_ready_go),	// @[playground/src/IF_stage.scala:29:33]
    .inst      (IF_to_id_bits_inst)
  );
  assign IF_to_id_valid = _IF_to_id_valid_output;	// @[<stdin>:11:3, playground/src/IF_stage.scala:34:22]
  assign IF_to_id_bits_nextpc = if_nextpc;	// @[<stdin>:11:3, playground/src/IF_stage.scala:45:33]
  assign IF_to_id_bits_pc = if_pc;	// @[<stdin>:11:3, playground/src/IF_stage.scala:42:26]
endmodule

