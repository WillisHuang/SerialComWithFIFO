`include "cmd_sets.v"

module cmd_decode(
	clk,
	rst_n,
	cmd,
	go
);
	// input / output declaration
	input	[7:0]	cmd;
		
	
	// ---- command decode state ----
	// read and find the corresponding command header
	//
	wire	decode_complete;
	reg		state, state_nxt;
	
	reg		[7:0]	cmd_page,cmd_page_nxt;
	
	localparam	DECODE_IDLE			=;
	localparam	DECODE_START		=;
	localparam	I2C_DECODE_START	=;	
	localparam	I3C_DECODE_START 	=;
	localparam	SPI_DECODE_START 	=;
	localparam	FPR_DECODE_START 	=;
	
	// ---- command decode state transition ----
	//
	always@(*) begin
		case(state)
			DECODE_IDLE: begin
				cmd_page_nxt = cmd;
				if(go)
					state_nxt = DECODE_START;
				else
					state_nxt = DECODE_IDLE;
			end
			DECODE_START: begin
				cmd_page_nxt = cmd;
				case(cmd[7:4])
					4'h1:	state_nxt = I2C_DECODE_START;
					4'h3:	state_nxt = I3C_DECODE_START;
					4'h4:	state_nxt = I3C_DECODE_START;
					4'h5:	state_nxt = SPI_DECODE_START;
					4'h7:	state_nxt = FPR_DECODE_START;
					default: state_nxt = DECODE_IDLE;
				endcase
			end
			I2C_DECODE_START: begin
				if(decode_complete)
					state_nxt = DECODE_IDLE;
				else
					state_nxt = I2C_DECODE_START;
			end // I2C
			
			I3C_DECODE_START: begin
				if(decode_complete)
					state_nxt = DECODE_IDLE;
				else
					state_nxt = I3C_DECODE_START;
			end // I3C
			
			SPI_DECODE_START: begin
				if(decode_complete)
					state_nxt = DECODE_IDLE;
				else
					state_nxt = SPI_DECODE_START;
			end // SPI
			
			FPR_DECODE_START: begin
				if(decode_complete)
					state_nxt = DECODE_IDLE;
				else
					state_nxt = FPR_DECODE_START;
			end // FPR
			
			default: begin
				state_nxt = DECODE_IDLE;
			end		
		endcase
	end
	
	always@(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			state <= DECODE_IDLE;
			cmd_page <= 4'd0;
		end
		else begin
			state <= state_nxt;
			cmd_page <= cmd_page_nxt;
		end	
	end


endmodule