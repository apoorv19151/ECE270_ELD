`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2020 23:20:29
// Design Name: 
// Module Name: clk_tb
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

module clk_tb();

    reg clk_in;
    wire divided_clk;
    
    clk_divider tb1(.clk_in(clk_in), .divided_clk(divided_clk));
    
    initial
        clk_in = 1'b0;
   
    always #100 clk_in = ~clk_in;
   
endmodule
