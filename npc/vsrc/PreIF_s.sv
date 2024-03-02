// Generated by CIRCT firtool-1.56.0
module PreIF_s(	// @[<stdin>:3:3]
  input         clock,	// @[<stdin>:4:11]
                reset,	// @[<stdin>:5:11]
                PreIF_to_if_ready,	// @[playground/src/PreIF.scala:7:15]
                PreIF_for_id_Br_J_taken,	// @[playground/src/PreIF.scala:7:15]
  input  [31:0] PreIF_for_id_Br_J_target,	// @[playground/src/PreIF.scala:7:15]
  input         PreIF_for_id_flush,	// @[playground/src/PreIF.scala:7:15]
  input  [31:0] PreIF_for_ex_epc_target,	// @[playground/src/PreIF.scala:7:15]
  input         PreIF_for_ex_epc_taken,	// @[playground/src/PreIF.scala:7:15]
                PreIF_for_ex_Br_B_taken,	// @[playground/src/PreIF.scala:7:15]
  input  [31:0] PreIF_for_ex_Br_B_target,	// @[playground/src/PreIF.scala:7:15]
  input         PreIF_for_ex_flush,	// @[playground/src/PreIF.scala:7:15]
                PreIF_ar_ready,	// @[playground/src/PreIF.scala:7:15]
  output        PreIF_to_if_valid,	// @[playground/src/PreIF.scala:7:15]
  output [31:0] PreIF_to_if_bits_nextpc,	// @[playground/src/PreIF.scala:7:15]
                PreIF_to_if_bits_pc,	// @[playground/src/PreIF.scala:7:15]
  output        PreIF_ar_valid,	// @[playground/src/PreIF.scala:7:15]
  output [31:0] PreIF_ar_bits_addr	// @[playground/src/PreIF.scala:7:15]
);

  wire        fetch_wen = PreIF_to_if_ready;	// @[playground/src/PreIF.scala:21:31]
  wire        resetn = ~reset;	// @[playground/src/PreIF.scala:18:28, :19:12]
  wire        PreIF_flush = PreIF_for_ex_flush | PreIF_for_id_flush;	// @[playground/src/PreIF.scala:24:33, :25:35]
  wire        _PreIF_to_if_valid_output = ~PreIF_flush & resetn;	// @[playground/src/PreIF.scala:18:28, :24:33, :27:26]
  reg  [31:0] PreIF_pc;	// @[playground/src/PreIF.scala:34:29]
  wire [31:0] PreIF_snpc = PreIF_pc + 32'h4;	// @[playground/src/PreIF.scala:34:29, :35:36, :39:26]
  wire [31:0] PreIF_dnpc =
    PreIF_for_ex_epc_taken
      ? PreIF_for_ex_epc_target
      : PreIF_for_id_Br_J_taken ? PreIF_for_id_Br_J_target : PreIF_for_ex_Br_B_target;	// @[playground/src/PreIF.scala:31:17, :36:36, :40:20]
  wire [31:0] PreIF_nextpc =
    PreIF_for_id_Br_J_taken | PreIF_for_ex_Br_B_taken | PreIF_for_ex_epc_taken
      ? PreIF_dnpc
      : PreIF_snpc;	// @[playground/src/PreIF.scala:35:36, :36:36, :37:36, :41:{21,31}]
  reg         arvalidReg;	// @[playground/src/PreIF.scala:48:25]
  reg  [31:0] araddrReg;	// @[playground/src/PreIF.scala:49:24]
  reg         ReadRequstState;	// @[playground/src/PreIF.scala:52:30]
  wire        is_fire = PreIF_to_if_ready & _PreIF_to_if_valid_output;	// @[playground/src/PreIF.scala:27:26, src/main/scala/chisel3/util/Decoupled.scala:52:35]
  wire        _GEN = ReadRequstState & PreIF_ar_ready;	// @[playground/src/PreIF.scala:52:30, :59:45, :60:25, :61:22]
  always @(posedge clock) begin	// @[<stdin>:4:11]
    if (reset) begin	// @[<stdin>:4:11]
      PreIF_pc <= 32'h7FFFFFFC;	// @[playground/src/PreIF.scala:34:29]
      arvalidReg <= 1'h0;	// @[playground/src/PreIF.scala:27:26, :48:25]
      araddrReg <= 32'h0;	// @[playground/src/PreIF.scala:49:24]
      ReadRequstState <= 1'h0;	// @[playground/src/PreIF.scala:27:26, :52:30]
    end
    else begin	// @[<stdin>:4:11]
      if (is_fire & resetn)	// @[playground/src/PreIF.scala:18:28, :91:15, src/main/scala/chisel3/util/Decoupled.scala:52:35]
        PreIF_pc <= PreIF_nextpc;	// @[playground/src/PreIF.scala:34:29, :37:36]
      if (ReadRequstState) begin	// @[playground/src/PreIF.scala:52:30]
        arvalidReg <= ~_GEN & arvalidReg;	// @[playground/src/PreIF.scala:48:25, :52:30, :59:45, :60:25, :61:22, :62:17]
        ReadRequstState <= ~_GEN & ReadRequstState;	// @[playground/src/PreIF.scala:52:30, :59:45, :60:25, :61:22]
      end
      else begin	// @[playground/src/PreIF.scala:52:30]
        arvalidReg <= fetch_wen | arvalidReg;	// @[playground/src/PreIF.scala:21:31, :48:25, :54:20, :57:17]
        ReadRequstState <= fetch_wen | ReadRequstState;	// @[playground/src/PreIF.scala:21:31, :52:30, :54:20, :55:22]
      end
      if (~ReadRequstState & fetch_wen)	// @[playground/src/PreIF.scala:21:31, :49:24, :52:30, :53:{23,33}, :54:20, :56:16]
        araddrReg <= PreIF_nextpc;	// @[playground/src/PreIF.scala:37:36, :49:24]
    end
  end // always @(posedge)
  assign PreIF_to_if_valid = _PreIF_to_if_valid_output;	// @[<stdin>:3:3, playground/src/PreIF.scala:27:26]
  assign PreIF_to_if_bits_nextpc = PreIF_nextpc;	// @[<stdin>:3:3, playground/src/PreIF.scala:37:36]
  assign PreIF_to_if_bits_pc = PreIF_pc;	// @[<stdin>:3:3, playground/src/PreIF.scala:34:29]
  assign PreIF_ar_valid = arvalidReg;	// @[<stdin>:3:3, playground/src/PreIF.scala:48:25]
  assign PreIF_ar_bits_addr = araddrReg;	// @[<stdin>:3:3, playground/src/PreIF.scala:49:24]
endmodule

