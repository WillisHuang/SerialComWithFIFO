`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2023 12:03:48 PM
// Design Name: 
// Module Name: fifo_rw
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


module fifo_operation(
    input sys_clk,
    input sys_rst_n
    );
    
    wire clk_50m;
    wire clk_25m;
    wire locked;
    
    wire rst_n;
    
    wire wr_full;
    wire wr_req;
    wire [7:0] wr_data;
    
    wire rd_empty;
    wire rd_req;
    wire [7:0] rd_data;
    
    assign rst_n = sys_rst_n & locked;
    
    clk_wiz_0 u_clk_wiz
       (
        // Clock out ports
        .clk_out1(clk_50m),     // output clk_out1
        .clk_out2(clk_25m),     // output clk_out2
        // Status and control signals
        .resetn(sys_rst_n), // input resetn
        .locked(locked),       // output locked
       // Clock in ports
        .clk_in1(sys_clk));      // input clk_in1
    
    fifo_wr  u_fifo_wr(
            .clk(clk_50m),
            .rst_n(rst_n),
            .wr_full(wr_full),
            .wr_req(wr_req),
            .wr_data(wr_data)
            );
            
    fifo #(8, 12) u_fifo
            (
                .rdata(rd_data),
                .wfull(wr_full),
                .rempty(rd_empty),
                .wdata(wr_data),
                .winc(wr_req), 
                .wclk(clk_50m), 
                .wrst_n(rst_n),
                .rinc(rd_req), 
                .rclk(clk_25m), 
                .rrst_n(rst_n)
            );
            
    fifo_rd u_fifo_rd(
                .clk(clk_25m),
                .rst_n(rst_n),
                .rd_empty(rd_empty),
                .rd_req(rd_req),
                .rd_data(rd_data)
                );
    
    
endmodule
