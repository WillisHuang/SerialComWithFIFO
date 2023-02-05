`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2023 01:48:25 PM
// Design Name: 
// Module Name: dds_tb
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


module dds_tb();

    reg clk;
    reg rst_n;
    
    reg [23:0] f_word;
    
    wire data;
    wire clk_en;
    
    dds u_dds(
        .clk(clk),
        .rst_n(rst_n),
        .f_word(f_word),
        .data(data),
        .clk_en(clk_en)
        );
    
    
    
    initial clk = 1;
    always #5 clk = ~clk;
    
    
    initial begin
        rst_n = 0;
        f_word = 1;
        
        #200;
        
        rst_n = 1;
        #5000000;
        $display($time, "  : 25MHz sck\n\n ");
        f_word = 24'd4194304;        
        #5000000;
        $display($time, "  : 3MHz sck\n\n ");
        f_word = 24'd503316;
        #5000000;
        $display($time, "  : 400KHz sck\n\n ");
        f_word = 24'd67108; 
        #5000000;
        $display($time, "  : 100KHz sck\n\n ");
        f_word = 24'd16777;
        #5000000;
        $stop;       
    
    end
    
    
    

endmodule
