// Generated by CIRCT firtool-1.56.0
module DPI_stage(	// @[<stdin>:1439:3]
  input        clock,	// @[<stdin>:1440:11]
               reset,	// @[<stdin>:1441:11]
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
               DPI_ret_reg_data,	// @[playground/src/Dpi_stage.scala:13:13]
               DPI_csr_commit_wen,	// @[playground/src/Dpi_stage.scala:13:13]
  input [11:0] DPI_csr_commit_waddr,	// @[playground/src/Dpi_stage.scala:13:13]
  input [31:0] DPI_csr_commit_wdata,	// @[playground/src/Dpi_stage.scala:13:13]
  input        DPI_csr_commit_exception_wen,	// @[playground/src/Dpi_stage.scala:13:13]
  input [3:0]  DPI_csr_commit_exception_mcause_in,	// @[playground/src/Dpi_stage.scala:13:13]
  input [31:0] DPI_csr_commit_exception_pc_wb	// @[playground/src/Dpi_stage.scala:13:13]
);

  Dpi_GetInfo dpi_getinfo (	// @[playground/src/Dpi_stage.scala:27:25]
    .clock     (clock),
    .reset     (reset),
    .dpi_valid (DPI_wb_valid),
    .pc        (DPI_pc),
    .nextpc    (DPI_nextpc),
    .inst      (DPI_inst)
  );
  Dpi_Inv dpi_inv (	// @[playground/src/Dpi_stage.scala:35:21]
    .clock     (clock),
    .reset     (reset),
    .dpi_valid (DPI_wb_valid),
    .inv_flag  (DPI_inv_flag),
    .pc        (DPI_pc)
  );
  Dpi_Func dpi_func (	// @[playground/src/Dpi_stage.scala:42:22]
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
  Dpi_Ebreak dpi_ebreak (	// @[playground/src/Dpi_stage.scala:53:24]
    .clock        (clock),
    .reset        (reset),
    .dpi_valid    (DPI_wb_valid),
    .is_ebreak    (DPI_is_ebreak),
    .pc           (DPI_pc),
    .ret_reg_data ({31'h0, DPI_ret_reg_data})	// @[playground/src/Dpi_stage.scala:59:29]
  );
  Dpi_CsrCommit dpi_csrcommit (	// @[playground/src/Dpi_stage.scala:61:27]
    .clock         (clock),
    .reset         (reset),
    .dpi_valid     (DPI_wb_valid),
    .csr_wen       (DPI_csr_commit_wen),
    .waddr         (DPI_csr_commit_waddr),
    .wdata         (DPI_csr_commit_wdata),
    .exception_wen (DPI_csr_commit_exception_wen),
    .mcause_in     ({28'h0, DPI_csr_commit_exception_mcause_in}),	// @[playground/src/Dpi_stage.scala:69:29]
    .pc_wb         (DPI_csr_commit_exception_pc_wb)
  );
endmodule

