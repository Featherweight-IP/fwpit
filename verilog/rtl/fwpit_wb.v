
/****************************************************************************
 * fwpit_wb.v
 ****************************************************************************/

`include "wishbone_macros.svh"
  
/**
 * Module: fwpit_wb
 * 
 * TODO: Add module documentation
 */
module fwpit_wb #(
		parameter PRE_COUNT_SIZE = 15,
		parameter COUNT_SIZE     = 16
		) ( 
		input		clock,
		input		reset,
		`WB_TARGET_PORT(rt_, 3, 32),
		output		irq);

	wire pit_o;
	
	pit_top #(
		.ARST_LVL        (1'b1       ), 
		.PRE_COUNT_SIZE  (PRE_COUNT_SIZE ), 
		.COUNT_SIZE      (COUNT_SIZE     ), 
		.DECADE_CNTR     (1'b1           ), 
		.NO_PRESCALE     (1'b0           ), 
		.SINGLE_CYCLE    (1'b1           ), 
		.DWIDTH          (32             )
		) pit_top (
		.wb_dat_o        (rt_dat_r       ), 
		.wb_ack_o        (rt_ack         ), 
		.wb_clk_i        (clock          ), 
		.wb_rst_i        (reset          ), 
		.arst_i          (reset          ), 
		.wb_adr_i        (rt_adr       ), 
		.wb_dat_i        (rt_dat_w       ), 
		.wb_we_i         (rt_we        ), 
		.wb_stb_i        (rt_stb       ), 
		.wb_cyc_i        (rt_cyc       ), 
		.wb_sel_i        (rt_sel       ), 
		.pit_o           (pit_o          ), 
		.pit_irq_o       (irq            ), 
		/*
		.cnt_flag_o      (cnt_flag_o     ), 
		.cnt_sync_o      (cnt_sync_o     ), 
		 */
		.ext_sync_i      (1'b0     ));

endmodule


