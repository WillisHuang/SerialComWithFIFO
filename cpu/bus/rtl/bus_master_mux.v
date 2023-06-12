/*
 -- ============================================================================
 -- FILE	 	: 	bus_master_mux.v
 -- Description :  	to select the master
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  
 -- ============================================================================
*/

module bus_master_mux(
	input		[29:0] 	m0_addr,		// master_0 address
	input				m0_asel_,		// master_0 address select
	input				m0_rw,			// master_0 read/write
	input		[31:0]	m0_wr_data,		// master_0 write data
	input				m0_grnt_,		// master_0 grant signal
	input		[29:0] 	m1_addr,		// master_1 address
	input				m1_adrsel_,		// master_1 address select
	input				m1_rw,			// master_1 read/write
	input		[31:0]	m1_wr_data,		// master_1 write data
	input				m1_grnt_,		// master_1 grant signal
	input		[29:0] 	m2_addr,		// master_2 address
	input				m2_adrsel_,		// master_2 address select
	input				m2_rw,			// master_2 read/write
	input		[31:0]	m2_wr_data,		// master_2 write data
	input				m2_grnt_,		// master_2 grant signal
	input		[29:0] 	m3_addr,		// master_3 address
	input				m3_adrsel_,		// master_3 address select
	input				m3_rw,			// master_3 read/write
	input		[31:0]	m3_wr_data,		// master_3 write data
	input				m3_grnt_,		// master_3 grant signal
	output	reg	[29:0]	s_addr,			// selected slave address
	output	reg			s_asel_,		// address selected 
	output	reg			s_rw,			// slave read/write
	output	reg	[31:0]	s_wr_data		// slave write data
);
	
	always@(*) begin
		if(!m0_grnt_) begin
			s_addr 		= m0_addr;
			s_asel_ 	= m0_asel_;
			s_rw		= m0_rw;
			s_wr_data	= m0_wr_data;
		end
		else if(!m1_grnt_) begin
			s_addr 		= m1_addr;
			s_asel_ 	= m1_asel_;
			s_rw		= m1_rw;
			s_wr_data	= m1_wr_data;
		end
		else if(!m2_grnt_) begin
			s_addr 		= m2_addr;
			s_asel_ 	= m2_asel_;
			s_rw		= m2_rw;
			s_wr_data	= m2_wr_data;
		end
		else if(!m3_grnt_) begin
			s_addr 		= m3_addr;
			s_asel_ 	= m3_asel_;
			s_rw		= m3_rw;
			s_wr_data	= m3_wr_data;
		end
		else begin					// default 
			s_addr 		= 30'h0;
			s_asel_ 	= 1'b1;		// disable
			s_rw		= 1'b1;		// read
			s_wr_data	= 32'h0;
		end
	end

endmodule
