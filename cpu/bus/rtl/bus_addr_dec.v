/*
 -- ============================================================================
 -- FILE	 	: 	bus_addr_dec.v
 -- Description :  	to decode the address
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  
 -- ============================================================================
*/

module bus_addr_dec(
	input	[29:0]	s_addr,		// address
	output			s0_cs_,		// select slave_0
	output			s1_cs_,		// select slave_1
	output			s2_cs_,		// select slave_2
	output			s3_cs_,		// select slave_3
	output			s4_cs_,		// select slave_4
	output			s5_cs_,		// select slave_5
	output			s6_cs_,		// select slave_6
	output			s7_cs_		// select slave_7
);

	wire	[2:0]	s_index = s_addr[29:27];
	
	always@(*) begin
		s0_cs_ = 1'b1;	// disable the chip select
		s1_cs_ = 1'b1;
		s2_cs_ = 1'b1;
		s3_cs_ = 1'b1;
		s4_cs_ = 1'b1;
		s5_cs_ = 1'b1;
		s6_cs_ = 1'b1;
		s7_cs_ = 1'b1;
		case(s_index)
			3'h0: s0_cs_ = 1'b0;	// enable the chip select
			3'h1: s1_cs_ = 1'b0;
			3'h2: s2_cs_ = 1'b0;
			3'h3: s3_cs_ = 1'b0;
			3'h4: s4_cs_ = 1'b0;
			3'h5: s5_cs_ = 1'b0;
			3'h6: s6_cs_ = 1'b0;
			3'h7: s7_cs_ = 1'b0;
		endcase	
	end

endmodule