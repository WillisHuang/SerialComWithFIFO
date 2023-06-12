/*
 -- ============================================================================
 -- FILE	 	: 	bus.v
 -- Description :  	top module of bus
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  
 -- ============================================================================
*/

module bus(
	input			clk,
	input			rst_n,
	output	[31:0]	m_rd_data,	// read out data
	output			m_rdy,		// data ready
	input			m0_req_,	// master_0 request signal
	input	[29:0]	m0_addr,	// master_0 address
	input			m0_asel_,	// master_0 address select
	input			m0_rw,		// master_0 read/write
	input	[31:0]	m0_wr_data,	// master_0 write data
	output			m0_grnt_,	// master_0 grant signal
	input			m1_req_,	// master_1 request signal
	input	[29:0]	m1_addr,	// master_1 address
	input			m1_asel_,	// master_1 address select
	input			m1_rw,		// master_1 read/write
	input	[31:0]	m1_wr_data,	// master_1 write data
	output			m1_grnt_,	// master_1 grant signal
	input			m2_req_,	// master_2 request signal
	input	[29:0]	m2_addr,	// master_2 address
	input			m2_asel_,	// master_2 address select
	input			m2_rw,		// master_2 read/write
	input	[31:0]	m2_wr_data,	// master_2 write data
	output			m2_grnt_,	// master_2 grant signal
	input			m3_req_,	// master_3 request signal
	input	[29:0]	m3_addr,	// master_3 address
	input			m3_asel_,	// master_3 address select
	input			m3_rw,		// master_3 read/write
	input	[31:0]	m3_wr_data,	// master_3 write data
	output			m3_grnt_,	// master_3 grant signal
	output	[29:0]	s_addr,		// slave address
	output			s_asel_,	// slave select
	output			s_rw,		// slave read/write
	output	[31:0]	s_wr_data,	// slave write data
	input	[31:0]	s0_rd_data,	// slave_0 read out data
	input			s0_rdy_,	// slave_0 ready
	output			s0_cs_,		// slave_0 chip select
	input	[31:0]	s1_rd_data,	// slave_1 read out data
	input			s1_rdy_,	// slave_1 ready
	output			s1_cs_,		// slave_1 chip select
	input	[31:0]	s2_rd_data,	// slave_2 read out data
	input			s2_rdy_,	// slave_2 ready
	output			s2_cs_,		// slave_2 chip select
	input	[31:0]	s3_rd_data,	// slave_3 read out data
	input			s3_rdy_,	// slave_3 ready
	output			s3_cs_,		// slave_3 chip select
	input	[31:0]	s4_rd_data,	// slave_4 read out data
	input			s4_rdy_,	// slave_4 ready
	output			s4_cs_,		// slave_4 chip select
	input	[31:0]	s5_rd_data,	// slave_5 read out data
	input			s5_rdy_,	// slave_5 ready
	output			s5_cs_,		// slave_5 chip select
	input	[31:0]	s6_rd_data,	// slave_6 read out data
	input			s6_rdy_,	// slave_6 ready
	output			s6_cs_,		// slave_6 chip select
	input	[31:0]	s7_rd_data,	// slave_7 read out data
	input			s7_rdy_,	// slave_7 ready
	output			s7_cs_,		// slave_7 chip select
);
	
	bus_arbiter 	u_bus_arbiter	(
										.clk		(  clk		),	// input clock
										.rst_n		( rst_n		),	// input reset
										.m0_req_	( m0_req_	),	// master_0 request signal
										.m0_grnt_	( m0_grnt_	),	// master_0 grant signal
										.m1_req_	( m1_req_	),	// master_1 request signal
										.m1_grnt_	( m1_grnt_	),	// master_1 grant signal
										.m2_req_	( m2_req_	),	// master_2 request signal
										.m2_grnt_	( m2_grnt_	),	// master_2 grant signal
										.m3_req_	( m3_req_	),	// master_3 request signal
										.m3_grnt_	( m3_grnt_	)	// master_3 grant signal	
									);
	bus_master_mux	u_bus_master_mux(
										.m0_addr	(m0_addr	),		// master_0 address
										.m0_asel_	(m0_asel_	),		// master_0 address select
										.m0_rw		(m0_rw		),		// master_0 read/write
										.m0_wr_data	(m0_wr_data	),		// master_0 write data
										.m0_grnt_	(m0_grnt_	),		// master_0 grant signal
										.m1_addr	(m1_addr	),		// master_1 address
										.m1_adrsel_	(m1_adrsel_	),		// master_1 address select
										.m1_rw		(m1_rw		),		// master_1 read/write
										.m1_wr_data	(m1_wr_data	),		// master_1 write data
										.m1_grnt_	(m1_grnt_	),		// master_1 grant signal
										.m2_addr	(m2_addr	),		// master_2 address
										.m2_adrsel_	(m2_adrsel_	),		// master_2 address select
										.m2_rw		(m2_rw		),		// master_2 read/write
										.m2_wr_data	(m2_wr_data	),		// master_2 write data
										.m2_grnt_	(m2_grnt_	),		// master_2 grant signal
										.m3_addr	(m3_addr	),		// master_3 address
										.m3_adrsel_	(m3_adrsel_	),		// master_3 address select
										.m3_rw		(m3_rw		),		// master_3 read/write
										.m3_wr_data	(m3_wr_data	),		// master_3 write data
										.m3_grnt_	(m3_grnt_	),		// master_3 grant signal
										.s_addr		(s_addr		),		// selected slave address
										.s_asel_	(s_asel_	),		// address selected 
										.s_rw		(s_rw		),		// slave read/write
										.s_wr_data	(s_wr_data	)		// slave write data
									);

	bus_addr_dec	u_bus_addr_dec	(
										.s_addr		(  s_addr  	),		// address
										.s0_cs_		(  s0_cs_  	),		// select slave_0
										.s1_cs_		(  s1_cs_  	),		// select slave_1
										.s2_cs_		(  s2_cs_  	),		// select slave_2
										.s3_cs_		(  s3_cs_  	),		// select slave_3
										.s4_cs_		(  s4_cs_  	),		// select slave_4
										.s5_cs_		(  s5_cs_  	),		// select slave_5
										.s6_cs_		(  s6_cs_  	),		// select slave_6
										.s7_cs_		(  s7_cs_  	)		// select slave_7
									);

	bus_slave_mux	u_bus_slave_mux	(
										.s0_cs_		(s0_cs_		),		// slave_0 chip select
										.s1_cs_		(s1_cs_		),		// slave_1 chip select
										.s2_cs_		(s2_cs_		),		// slave_2 chip select
										.s3_cs_		(s3_cs_		),		// slave_3 chip select
										.s4_cs_		(s4_cs_		),		// slave_4 chip select
										.s5_cs_		(s5_cs_		),		// slave_5 chip select
										.s6_cs_		(s6_cs_		),		// slave_6 chip select
										.s7_cs_		(s7_cs_		),		// slave_7 chip select
										.s0_rd_data	(s0_rd_data	),		// read out the data of slave_0
										.s0_rdy_	(s0_rdy_	),		// slave_0 data ready
										.s1_rd_data	(s1_rd_data	),		// read out the data of slave_1
										.s1_rdy_	(s1_rdy_	),		// slave_1 data ready
										.s2_rd_data	(s2_rd_data	),		// read out the data of slave_2
										.s2_rdy_	(s2_rdy_	),		// slave_2 data ready
										.s3_rd_data	(s3_rd_data	),		// read out the data of slave_3
										.s3_rdy_	(s3_rdy_	),		// slave_3 data ready
										.s4_rd_data	(s4_rd_data	),		// read out the data of slave_4
										.s4_rdy_	(s4_rdy_	),		// slave_4 data ready
										.s5_rd_data	(s5_rd_data	),		// read out the data of slave_5
										.s5_rdy_	(s5_rdy_	),		// slave_5 data ready
										.s6_rd_data	(s6_rd_data	),		// read out the data of slave_6
										.s6_rdy_	(s6_rdy_	),		// slave_6 data ready
										.s7_rd_data	(s7_rd_data	),		// read out the data of slave_7
										.s7_rdy_	(s7_rdy_	),		// slave_7 data ready
										.m_rd_data	(m_rd_data	),		// output data to master
										.m_rdy_		(m_rdy_		)		// output data is ready
									);

endmodule