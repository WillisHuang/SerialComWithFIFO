`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2023 11:49:59 AM
// Design Name: 
// Module Name: dds
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


module dds(
    clk,
    rst_n,
    f_word,
    data,
    clk_en
    );
    
    input clk;
    input rst_n;
    input [23:0] f_word;
    output reg data;
    output clk_en;
    
    reg [23:0] phase_acc;
    
    reg [1:0] data_d;
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            phase_acc <= 'd0;
        end
        else begin
           phase_acc <= phase_acc + f_word;     
        end
    end
    
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            data_d <= {2{phase_acc[23]}};
        end
        else begin
            data_d[1] <= data_d[0];
            data_d[0] <= phase_acc[23];
        end
    end
    
     assign clk_en = data_d[0] & ~data_d[1];
        
    always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            data <= 1'b1;
        end
        else begin
            data <= phase_acc[23];
        end
    end
    
    
    
endmodule
