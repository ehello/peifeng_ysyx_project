// Generated by CIRCT firtool-1.56.0
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

// external module singal_ebreak

module RegFile(	// @[<stdin>:8:3]
  input         clock,	// @[<stdin>:9:11]
                reset,	// @[<stdin>:10:11]
  input  [4:0]  io_waddr,	// @[playground/src/RegFile.scala:5:12]
  input  [31:0] io_wdata,	// @[playground/src/RegFile.scala:5:12]
  input  [4:0]  io_raddr1,	// @[playground/src/RegFile.scala:5:12]
                io_raddr2,	// @[playground/src/RegFile.scala:5:12]
  input         io_wen,	// @[playground/src/RegFile.scala:5:12]
  output [31:0] io_rdata1,	// @[playground/src/RegFile.scala:5:12]
                io_rdata2	// @[playground/src/RegFile.scala:5:12]
);

  reg [31:0] casez_tmp;	// @[playground/src/RegFile.scala:16:17]
  reg [31:0] casez_tmp_0;	// @[playground/src/RegFile.scala:17:17]
  reg [31:0] rf_0;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_1;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_2;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_3;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_4;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_5;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_6;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_7;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_8;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_9;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_10;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_11;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_12;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_13;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_14;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_15;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_16;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_17;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_18;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_19;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_20;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_21;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_22;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_23;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_24;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_25;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_26;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_27;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_28;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_29;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_30;	// @[playground/src/RegFile.scala:14:17]
  reg [31:0] rf_31;	// @[playground/src/RegFile.scala:14:17]
  always_comb begin	// @[playground/src/RegFile.scala:16:17]
    casez (io_raddr1)	// @[playground/src/RegFile.scala:16:17]
      5'b00000:
        casez_tmp = rf_0;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00001:
        casez_tmp = rf_1;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00010:
        casez_tmp = rf_2;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00011:
        casez_tmp = rf_3;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00100:
        casez_tmp = rf_4;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00101:
        casez_tmp = rf_5;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00110:
        casez_tmp = rf_6;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00111:
        casez_tmp = rf_7;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01000:
        casez_tmp = rf_8;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01001:
        casez_tmp = rf_9;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01010:
        casez_tmp = rf_10;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01011:
        casez_tmp = rf_11;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01100:
        casez_tmp = rf_12;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01101:
        casez_tmp = rf_13;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01110:
        casez_tmp = rf_14;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01111:
        casez_tmp = rf_15;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10000:
        casez_tmp = rf_16;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10001:
        casez_tmp = rf_17;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10010:
        casez_tmp = rf_18;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10011:
        casez_tmp = rf_19;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10100:
        casez_tmp = rf_20;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10101:
        casez_tmp = rf_21;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10110:
        casez_tmp = rf_22;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10111:
        casez_tmp = rf_23;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11000:
        casez_tmp = rf_24;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11001:
        casez_tmp = rf_25;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11010:
        casez_tmp = rf_26;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11011:
        casez_tmp = rf_27;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11100:
        casez_tmp = rf_28;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11101:
        casez_tmp = rf_29;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11110:
        casez_tmp = rf_30;	// @[playground/src/RegFile.scala:14:17, :16:17]
      default:
        casez_tmp = rf_31;	// @[playground/src/RegFile.scala:14:17, :16:17]
    endcase	// @[playground/src/RegFile.scala:16:17]
  end // always_comb
  always_comb begin	// @[playground/src/RegFile.scala:16:17]
    casez (io_raddr2)	// @[playground/src/RegFile.scala:16:17]
      5'b00000:
        casez_tmp_0 = rf_0;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00001:
        casez_tmp_0 = rf_1;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00010:
        casez_tmp_0 = rf_2;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00011:
        casez_tmp_0 = rf_3;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00100:
        casez_tmp_0 = rf_4;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00101:
        casez_tmp_0 = rf_5;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00110:
        casez_tmp_0 = rf_6;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b00111:
        casez_tmp_0 = rf_7;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01000:
        casez_tmp_0 = rf_8;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01001:
        casez_tmp_0 = rf_9;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01010:
        casez_tmp_0 = rf_10;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01011:
        casez_tmp_0 = rf_11;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01100:
        casez_tmp_0 = rf_12;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01101:
        casez_tmp_0 = rf_13;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01110:
        casez_tmp_0 = rf_14;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b01111:
        casez_tmp_0 = rf_15;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10000:
        casez_tmp_0 = rf_16;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10001:
        casez_tmp_0 = rf_17;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10010:
        casez_tmp_0 = rf_18;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10011:
        casez_tmp_0 = rf_19;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10100:
        casez_tmp_0 = rf_20;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10101:
        casez_tmp_0 = rf_21;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10110:
        casez_tmp_0 = rf_22;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b10111:
        casez_tmp_0 = rf_23;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11000:
        casez_tmp_0 = rf_24;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11001:
        casez_tmp_0 = rf_25;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11010:
        casez_tmp_0 = rf_26;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11011:
        casez_tmp_0 = rf_27;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11100:
        casez_tmp_0 = rf_28;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11101:
        casez_tmp_0 = rf_29;	// @[playground/src/RegFile.scala:14:17, :16:17]
      5'b11110:
        casez_tmp_0 = rf_30;	// @[playground/src/RegFile.scala:14:17, :16:17]
      default:
        casez_tmp_0 = rf_31;	// @[playground/src/RegFile.scala:14:17, :16:17]
    endcase	// @[playground/src/RegFile.scala:16:17]
  end // always_comb
  always @(posedge clock) begin	// @[<stdin>:9:11]
    if (reset) begin	// @[<stdin>:9:11]
      rf_0 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_1 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_2 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_3 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_4 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_5 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_6 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_7 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_8 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_9 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_10 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_11 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_12 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_13 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_14 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_15 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_16 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_17 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_18 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_19 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_20 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_21 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_22 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_23 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_24 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_25 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_26 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_27 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_28 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_29 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_30 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
      rf_31 <= 32'h0;	// @[playground/src/RegFile.scala:14:{17,25}]
    end
    else begin	// @[<stdin>:9:11]
      if (io_wen & io_waddr == 5'h0)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_0 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h1)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_1 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h2)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_2 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h3)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_3 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h4)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_4 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h5)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_5 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h6)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_6 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h7)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_7 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h8)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_8 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h9)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_9 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'hA)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_10 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'hB)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_11 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'hC)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_12 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'hD)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_13 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'hE)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_14 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'hF)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_15 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h10)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_16 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h11)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_17 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h12)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_18 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h13)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_19 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h14)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_20 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h15)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_21 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h16)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_22 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h17)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_23 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h18)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_24 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h19)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_25 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h1A)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_26 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h1B)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_27 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h1C)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_28 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h1D)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_29 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & io_waddr == 5'h1E)	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_30 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
      if (io_wen & (&io_waddr))	// @[playground/src/RegFile.scala:14:17, :15:{15,29}]
        rf_31 <= io_wdata;	// @[playground/src/RegFile.scala:14:17]
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// @[<stdin>:8:3]
    `ifdef FIRRTL_BEFORE_INITIAL	// @[<stdin>:8:3]
      `FIRRTL_BEFORE_INITIAL	// @[<stdin>:8:3]
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:31];	// @[<stdin>:8:3]
    initial begin	// @[<stdin>:8:3]
      `ifdef INIT_RANDOM_PROLOG_	// @[<stdin>:8:3]
        `INIT_RANDOM_PROLOG_	// @[<stdin>:8:3]
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// @[<stdin>:8:3]
        for (logic [5:0] i = 6'h0; i < 6'h20; i += 6'h1) begin
          _RANDOM[i[4:0]] = `RANDOM;	// @[<stdin>:8:3]
        end	// @[<stdin>:8:3]
        rf_0 = _RANDOM[5'h0];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_1 = _RANDOM[5'h1];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_2 = _RANDOM[5'h2];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_3 = _RANDOM[5'h3];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_4 = _RANDOM[5'h4];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_5 = _RANDOM[5'h5];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_6 = _RANDOM[5'h6];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_7 = _RANDOM[5'h7];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_8 = _RANDOM[5'h8];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_9 = _RANDOM[5'h9];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_10 = _RANDOM[5'hA];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_11 = _RANDOM[5'hB];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_12 = _RANDOM[5'hC];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_13 = _RANDOM[5'hD];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_14 = _RANDOM[5'hE];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_15 = _RANDOM[5'hF];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_16 = _RANDOM[5'h10];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_17 = _RANDOM[5'h11];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_18 = _RANDOM[5'h12];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_19 = _RANDOM[5'h13];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_20 = _RANDOM[5'h14];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_21 = _RANDOM[5'h15];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_22 = _RANDOM[5'h16];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_23 = _RANDOM[5'h17];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_24 = _RANDOM[5'h18];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_25 = _RANDOM[5'h19];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_26 = _RANDOM[5'h1A];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_27 = _RANDOM[5'h1B];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_28 = _RANDOM[5'h1C];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_29 = _RANDOM[5'h1D];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_30 = _RANDOM[5'h1E];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
        rf_31 = _RANDOM[5'h1F];	// @[<stdin>:8:3, playground/src/RegFile.scala:14:17]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// @[<stdin>:8:3]
      `FIRRTL_AFTER_INITIAL	// @[<stdin>:8:3]
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_rdata1 = (|io_raddr1) ? casez_tmp : 32'h0;	// @[<stdin>:8:3, playground/src/RegFile.scala:14:25, :16:{17,27}]
  assign io_rdata2 = (|io_raddr2) ? casez_tmp_0 : 32'h0;	// @[<stdin>:8:3, playground/src/RegFile.scala:14:25, :17:{17,27}]
endmodule

module Alu(	// @[<stdin>:57:3]
  input  [11:0] io_op,	// @[playground/src/Alu.scala:5:14]
  input  [31:0] io_src1,	// @[playground/src/Alu.scala:5:14]
                io_src2,	// @[playground/src/Alu.scala:5:14]
  output [31:0] io_result	// @[playground/src/Alu.scala:5:14]
);

  assign io_result =
    io_op == 12'h80
      ? {31'h0, io_src1 == io_src2}
      : io_op == 12'h40
          ? {31'h0, io_src1 < io_src2}
          : io_op == 12'h20
              ? io_src1 ^ io_src2
              : io_op == 12'h10
                  ? io_src1 | io_src2
                  : io_op == 12'h8
                      ? io_src1 & io_src2
                      : io_op == 12'h4
                          ? ~io_src1
                          : io_op == 12'h2
                              ? io_src1 - io_src2
                              : io_op == 12'h1 ? io_src1 + io_src2 : 32'h0;	// @[<stdin>:57:3, playground/src/Alu.scala:11:23, :12:23, :13:15, :14:23, :15:23, :16:23, :17:28, :18:27, :19:37]
endmodule

module SimTop(	// @[<stdin>:92:3]
  input         clock,	// @[<stdin>:93:11]
                reset,	// @[<stdin>:94:11]
  input  [31:0] io_inst,	// @[playground/src/SimTop.scala:6:14]
  output [31:0] io_pc,	// @[playground/src/SimTop.scala:6:14]
                io_result,	// @[playground/src/SimTop.scala:6:14]
  output        io_wen,	// @[playground/src/SimTop.scala:6:14]
  output [31:0] io_imm	// @[playground/src/SimTop.scala:6:14]
);

  wire [31:0] _alu_io_result;	// @[playground/src/SimTop.scala:79:18]
  wire [31:0] _RegFile_io_rdata1;	// @[playground/src/SimTop.scala:71:21]
  wire [31:0] _RegFile_io_rdata2;	// @[playground/src/SimTop.scala:71:21]
  reg  [31:0] pc;	// @[playground/src/SimTop.scala:15:17]
  wire        alu_op_0 = {io_inst[14:12], io_inst[6:0]} == 10'h13;	// @[playground/src/SimTop.scala:32:23]
  wire        Isa_ebreak = io_inst == 32'h100073;	// @[playground/src/SimTop.scala:33:23]
  wire [31:0] Imm =
    alu_op_0 | Isa_ebreak
      ? {{12{io_inst[19]}}, io_inst[19:12], io_inst[20], io_inst[30:21], 1'h0}
      : 32'h0;	// @[<stdin>:92:3, playground/src/Bundle.scala:32:{10,15,37}, playground/src/SimTop.scala:25:{39,54,66}, :32:23, :33:23, :39:30, :44:40]
  always @(posedge clock) begin	// @[<stdin>:93:11]
    if (reset)	// @[<stdin>:93:11]
      pc <= 32'h80000000;	// @[playground/src/SimTop.scala:15:17]
    else	// @[<stdin>:93:11]
      pc <= pc + 32'h4;	// @[playground/src/SimTop.scala:15:17, :16:9]
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// @[<stdin>:92:3]
    `ifdef FIRRTL_BEFORE_INITIAL	// @[<stdin>:92:3]
      `FIRRTL_BEFORE_INITIAL	// @[<stdin>:92:3]
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:0];	// @[<stdin>:92:3]
    initial begin	// @[<stdin>:92:3]
      `ifdef INIT_RANDOM_PROLOG_	// @[<stdin>:92:3]
        `INIT_RANDOM_PROLOG_	// @[<stdin>:92:3]
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// @[<stdin>:92:3]
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;	// @[<stdin>:92:3]
        pc = _RANDOM[/*Zero width*/ 1'b0];	// @[<stdin>:92:3, playground/src/SimTop.scala:15:17]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// @[<stdin>:92:3]
      `FIRRTL_AFTER_INITIAL	// @[<stdin>:92:3]
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  singal_ebreak singal_ebreak (	// @[playground/src/SimTop.scala:34:27]
    .clock (clock),
    .flag  (Isa_ebreak)	// @[playground/src/SimTop.scala:33:23]
  );
  RegFile RegFile (	// @[playground/src/SimTop.scala:71:21]
    .clock     (clock),
    .reset     (reset),
    .io_waddr  (io_inst[11:7]),	// @[playground/src/SimTop.scala:22:42]
    .io_wdata  (_alu_io_result),	// @[playground/src/SimTop.scala:79:18]
    .io_raddr1 (io_inst[19:15]),	// @[playground/src/SimTop.scala:27:23]
    .io_raddr2 (io_inst[24:20]),	// @[playground/src/SimTop.scala:26:23]
    .io_wen    (alu_op_0),	// @[playground/src/SimTop.scala:32:23]
    .io_rdata1 (_RegFile_io_rdata1),
    .io_rdata2 (_RegFile_io_rdata2)
  );
  Alu alu (	// @[playground/src/SimTop.scala:79:18]
    .io_op     ({11'h0, alu_op_0}),	// @[playground/src/SimTop.scala:32:23, :83:23]
    .io_src1   (_RegFile_io_rdata1),	// @[playground/src/SimTop.scala:71:21]
    .io_src2   (alu_op_0 ? Imm : _RegFile_io_rdata2),	// @[playground/src/SimTop.scala:32:23, :44:40, :71:21, :81:15]
    .io_result (_alu_io_result)
  );
  assign io_pc = pc;	// @[<stdin>:92:3, playground/src/SimTop.scala:15:17]
  assign io_result = _alu_io_result;	// @[<stdin>:92:3, playground/src/SimTop.scala:79:18]
  assign io_wen = alu_op_0;	// @[<stdin>:92:3, playground/src/SimTop.scala:32:23]
  assign io_imm = Imm;	// @[<stdin>:92:3, playground/src/SimTop.scala:44:40]
endmodule


// ----- 8< ----- FILE "./ebreak.v" ----- 8< -----

import "DPI-C" function void sim_exit();
module singal_ebreak(
    input clock,
    input flag
);
always @(posedge clock)begin
    if(flag==1) sim_exit();
end
endmodule //moduleName

// ----- 8< ----- FILE "firrtl_black_box_resource_files.f" ----- 8< -----


