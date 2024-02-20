// Generated by CIRCT firtool-1.56.0
module DPI_stage(	// @[<stdin>:1401:3]
  input        clock,	// @[<stdin>:1402:11]
               reset,	// @[<stdin>:1403:11]
               DPI_wb_valid,	// @[playground/src/Dpi_stage.scala:13:13]
  input [31:0] DPI_pc,	// @[playground/src/Dpi_stage.scala:13:13]
               DPI_nextpc,	// @[playground/src/Dpi_stage.scala:13:13]
               DPI_inst,	// @[playground/src/Dpi_stage.scala:13:13]
  input        DPI_inv_flag,	// @[playground/src/Dpi_stage.scala:13:13]
               DPI_func_flag,	// @[playground/src/Dpi_stage.scala:13:13]
               DPI_is_jal,	// @[playground/src/Dpi_stage.scala:13:13]
               DPI_is_ret,	// @[playground/src/Dpi_stage.scala:13:13]
               DPI_is_rd0,	// @[playground/src/Dpi_stage.scala:13:13]
               DPI_is_ebreak,	// @[playground/src/Dpi_stage.scala:13:13]
               DPI_ret_reg_data	// @[playground/src/Dpi_stage.scala:13:13]
);

  dpi_getinfo dpi_getinfo (	// @[playground/src/Dpi_stage.scala:26:25]
    .clock     (clock),
    .reset     (reset),
    .dpi_valid (DPI_wb_valid),
    .pc        (DPI_pc),
    .nextpc    (DPI_nextpc),
    .inst      (DPI_inst)
  );
  dpi_inv dpi_inv (	// @[playground/src/Dpi_stage.scala:34:21]
    .clock     (clock),
    .reset     (reset),
    .dpi_valid (DPI_wb_valid),
    .inv_flag  (DPI_inv_flag),
    .pc        (DPI_pc)
  );
  dpi_func dpi_func (	// @[playground/src/Dpi_stage.scala:41:22]
    .clock     (clock),
    .reset     (reset),
    .dpi_valid (DPI_wb_valid),
    .func_flag (DPI_func_flag),
    .is_jal    (DPI_is_jal),
    .pc        (DPI_pc),
    .nextpc    (DPI_nextpc),
    .is_rd0    (DPI_is_rd0),
    .is_ret    (DPI_is_ret)
  );
  dpi_ebreak dpi_ebreak (	// @[playground/src/Dpi_stage.scala:52:24]
    .clock        (clock),
    .reset        (reset),
    .dpi_valid    (DPI_wb_valid),
    .is_ebreak    (DPI_is_ebreak),
    .pc           (DPI_pc),
    .ret_reg_data ({31'h0, DPI_ret_reg_data})	// @[playground/src/Dpi_stage.scala:58:29]
  );
endmodule

