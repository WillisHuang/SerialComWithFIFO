`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2023 12:22:15 PM
// Design Name: 
// Module Name: fifo_rw_tb
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


module fifo_rw_tb();


parameter T = 20;

reg sys_clk;
reg sys_rst_n;

initial begin
    sys_clk = 1'b0;
    sys_rst_n = 1'b0;
    
    #(T+1)
    sys_rst_n = 1'b1;
end

always #(T/2) sys_clk = ~sys_clk;


fifo_rw u_fifo_rw(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n)
    );


endmodule
