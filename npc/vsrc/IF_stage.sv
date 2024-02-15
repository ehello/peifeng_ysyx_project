// Generated by CIRCT firtool-1.56.0
module IF_stage(	// @[<stdin>:11:3]
  input         clock,	// @[<stdin>:12:11]
                reset,	// @[<stdin>:13:11]
                IF_IO_ready,	// @[playground/src/IF_stage.scala:6:12]
                IF_br_bus_is_jump,	// @[playground/src/IF_stage.scala:6:12]
  input  [31:0] IF_br_bus_dnpc,	// @[playground/src/IF_stage.scala:6:12]
                IF_epc_bus_csr_epc,	// @[playground/src/IF_stage.scala:6:12]
  input         IF_epc_bus_epc_wen,	// @[playground/src/IF_stage.scala:6:12]
                IF_flush,	// @[playground/src/IF_stage.scala:6:12]
  output        IF_IO_valid,	// @[playground/src/IF_stage.scala:6:12]
  output [31:0] IF_IO_bits_nextpc,	// @[playground/src/IF_stage.scala:6:12]
                IF_IO_bits_pc,	// @[playground/src/IF_stage.scala:6:12]
                IF_IO_bits_inst	// @[playground/src/IF_stage.scala:6:12]
);

  wire        if_ready_go = 1'h1;	// @[playground/src/IF_stage.scala:14:33, :16:14]
  reg         if_valid;	// @[playground/src/IF_stage.scala:13:33]
  wire        if_allowin = ~if_valid | if_ready_go & IF_IO_ready;	// @[playground/src/IF_stage.scala:13:33, :14:33, :15:32, :17:{16,26,41}]
  reg  [31:0] REGpc;	// @[playground/src/IF_stage.scala:26:24]
  wire [31:0] snpc = REGpc + 32'h4;	// @[playground/src/IF_stage.scala:26:24, :27:31, :32:18]
  wire [31:0] dnpc = IF_epc_bus_epc_wen ? IF_epc_bus_csr_epc : IF_br_bus_dnpc;	// @[playground/src/IF_stage.scala:28:31, :33:15]
  wire [31:0] nextpc = IF_br_bus_is_jump | IF_epc_bus_epc_wen ? dnpc : snpc;	// @[playground/src/IF_stage.scala:27:31, :28:31, :29:31, :34:{15,33}]
  always @(posedge clock) begin	// @[<stdin>:12:11]
    if (reset) begin	// @[<stdin>:12:11]
      if_valid <= 1'h0;	// @[playground/src/IF_stage.scala:13:33]
      REGpc <= 32'h7FFFFFFC;	// @[playground/src/IF_stage.scala:26:24]
    end
    else begin	// @[<stdin>:12:11]
      if_valid <= if_allowin;	// @[playground/src/IF_stage.scala:13:33, :15:32]
      REGpc <= nextpc;	// @[playground/src/IF_stage.scala:26:24, :29:31]
    end
  end // always @(posedge)
  read_inst Fetch (	// @[playground/src/IF_stage.scala:30:23]
    .clock  (clock),
    .reset  (reset),
    .nextpc (nextpc),	// @[playground/src/IF_stage.scala:29:31]
    .pc     (REGpc),	// @[playground/src/IF_stage.scala:26:24]
    .inst   (IF_IO_bits_inst)
  );
  assign IF_IO_valid = ~IF_flush & if_valid & if_ready_go;	// @[<stdin>:11:3, playground/src/IF_stage.scala:13:33, :14:33, :23:19]
  assign IF_IO_bits_nextpc = nextpc;	// @[<stdin>:11:3, playground/src/IF_stage.scala:29:31]
  assign IF_IO_bits_pc = REGpc;	// @[<stdin>:11:3, playground/src/IF_stage.scala:26:24]
endmodule

