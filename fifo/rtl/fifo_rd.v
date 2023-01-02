`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/01/2023 09:52:36 PM
// Design Name: 
// Module Name: fifo_rd
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


module fifo_rd(
    input           clk,
    input           rst_n,
    input           rd_empty,
    output          rd_req,
    input [7:0]     rd_data
    );
    
    reg rd_req_t;
    
    
    assign rd_req = rd_req_t & (~rd_empty);
    
    
    always@(posedge clk, negedge rst_n) begin
        if(!rst_n)
            rd_req_t <= 1'b0;
        else if(rd_empty)
            rd_req_t <= 1'b0;
        else
            rd_req_t <= 1'b1;
    end
    
    
endmodule
