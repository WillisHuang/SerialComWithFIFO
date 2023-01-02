`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/01/2023 09:46:03 PM
// Design Name: 
// Module Name: fifo_wr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_wr(
    input           clk,
    input           rst_n,
    input           wr_full,
    output          wr_req,
    output reg [7:0] wr_data
    );
    
    reg wr_req_t;
    
    assign wr_req = wr_req_t & (~wr_full);
    
    
    always@(posedge clk , negedge rst_n) begin
        if(!rst_n)
            wr_req_t <= 1'b0;
        else if(wr_full)
            wr_req_t <= 1'b0;
        else
            wr_req_t <= 1'b1;
    end
    
    always@(posedge clk , negedge rst_n) begin
        if(!rst_n)
            wr_data <= 8'd0;
        else if(wr_full)
            wr_data <= 8'd0;
        else
            wr_data <= wr_data+1'b1;
    end
    
    
    
    
endmodule
