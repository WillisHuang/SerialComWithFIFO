/*
 -- ============================================================================
 -- FILE	 	: 	bus_arbiter.v
 -- Description :  	to make arbitration between multimasters
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  
 -- ============================================================================
*/

module bus_arbiter(
	input		clk,		// input clock
	input		rst_n,		// input reset
	input		m0_req_,	// master_0 request signal
	output	reg	m0_grnt_,	// master_0 grant signal
	input		m1_req_,	// master_1 request signal
	output	reg	m1_grnt_,	// master_1 grant signal
	input		m2_req_,	// master_2 request signal
	output	reg	m2_grnt_,	// master_2 grant signal
	input		m3_req_,	// master_3 request signal
	output	reg	m3_grnt_	// master_3 grant signal	
);

	reg	[1:0]	owner;		// the owner of the bus
							// 2'h0: master_0
							// 2'h1: master_1
							// 2'h2: master_2
							// 2'h3: master_3
	
	// the decision for the bus
	always@(*) begin
		m0_grnt_ = 1'b1;	// disable master_0 grant
		m1_grnt_ = 1'b1;	// disable master_1 grant
		m2_grnt_ = 1'b1;	// disable master_2 grant
		m3_grnt_ = 1'b1;	// disable master_3 grant
		case(owner)
			2'h0:	m0_grnt_ = 1'b0;	//enable master_0 grant
			2'h1:	m0_grnt_ = 1'b0;	//enable master_1 grant
			2'h2:	m0_grnt_ = 1'b0;	//enable master_2 grant
			2'h3:	m0_grnt_ = 1'b0;	//enable master_3 grant
		endcase
	end
	
	// the arbitration of the bus
	always@(posedge clk, negedge reset) begin
		if(!rst_n)
			owner	<= 2'h0;
		else begin
			case(owner)
				2'h0: begin	// owner is master_0, decide the next owner
					if(!m0_req_)	owner <= 2'h0;
					else if(!m1_req_)	owner <=2'h1;
					else if(!m2_req_)	owner <= 2'h2;
					else if(!m3_req_)	owner <= 2'h3;
				end
				2'h1: begin	// owner is master_1, decide the next owner
					if(!m1_req_)	owner <= 2'h1;
					else if(!m2_req_)	owner <=2'h2;
					else if(!m3_req_)	owner <= 2'h3;
					else if(!m0_req_)	owner <= 2'h0;
				end
				2'h2: begin	// owner is master_2, decide the next owner
					if(!m2_req_)	owner <= 2'h2;
					else if(!m3_req_)	owner <=2'h3;
					else if(!m0_req_)	owner <= 2'h0;
					else if(!m1_req_)	owner <= 2'h1;
				end
				2'h3: begin	// owner is master_3, decide the next owner
					if(!m3_req_)	owner <= 2'h3;
					else if(!m0_req_)	owner <=2'h0;
					else if(!m1_req_)	owner <= 2'h1;
					else if(!m2_req_)	owner <= 2'h2;
				end
			endcase
		end
	end


endmodule
