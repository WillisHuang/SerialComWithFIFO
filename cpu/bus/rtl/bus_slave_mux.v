/*
 -- ============================================================================
 -- FILE	 	: 	bus_slave_mux.v
 -- Description :  	to select the slave
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  
 -- ============================================================================
*/

module bus_slave_mux(
	input				s0_cs_,			// slave_0 chip select
	input				s1_cs_,			// slave_1 chip select
	input				s2_cs_,			// slave_2 chip select
	input				s3_cs_,			// slave_3 chip select
	input				s4_cs_,			// slave_4 chip select
	input				s5_cs_,			// slave_5 chip select
	input				s6_cs_,			// slave_6 chip select
	input				s7_cs_,			// slave_7 chip select
	input	[31:0]		s0_rd_data,		// read out the data of slave_0
	input				s0_rdy_,		// slave_0 data ready
	input	[31:0]		s1_rd_data,		// read out the data of slave_1
	input				s1_rdy_,		// slave_1 data ready
	input	[31:0]		s2_rd_data,		// read out the data of slave_2
	input				s2_rdy_,		// slave_2 data ready
	input	[31:0]		s3_rd_data,		// read out the data of slave_3
	input				s3_rdy_,		// slave_3 data ready
	input	[31:0]		s4_rd_data,		// read out the data of slave_4
	input				s4_rdy_,		// slave_4 data ready
	input	[31:0]		s5_rd_data,		// read out the data of slave_5
	input				s5_rdy_,		// slave_5 data ready
	input	[31:0]		s6_rd_data,		// read out the data of slave_6
	input				s6_rdy_,		// slave_6 data ready
	input	[31:0]		s7_rd_data,		// read out the data of slave_7
	input				s7_rdy_,		// slave_7 data ready
	output	reg	[31:0]	m_rd_data,		// output data to master
	output	reg			m_rdy_			// output data is ready
);

	always@(*) begin
		if(!s0_cs_) begin
			m_rd_data 	= s0_rd_data;
			m_rdy_		= s0_rdy_;
		end
		else if(!s1_cs_) begin
			m_rd_data 	= s1_rd_data;
			m_rdy_		= s1_rdy_;
		end
		else if(!s2_cs_) begin
			m_rd_data 	= s2_rd_data;
			m_rdy_		= s2_rdy_;
		end
		else if(!s3_cs_) begin
			m_rd_data 	= s3_rd_data;
			m_rdy_		= s3_rdy_;
		end
		else if(!s4_cs_) begin
			m_rd_data 	= s4_rd_data;
			m_rdy_		= s4_rdy_;
		end
		else if(!s5_cs_) begin
			m_rd_data 	= s5_rd_data;
			m_rdy_		= s5_rdy_;
		end
		else if(!s6_cs_) begin
			m_rd_data 	= s6_rd_data;
			m_rdy_		= s6_rdy_;
		end
		else if(!s7_cs_) begin
			m_rd_data 	= s7_rd_data;
			m_rdy_		= s7_rdy_;
		end
		else begin					// default
			m_rd_data 	= 32'h0;
			m_rdy_		= 1'b1;		// disabled
		end
	end


endmodule