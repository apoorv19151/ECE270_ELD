`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2020 15:14:09
// Design Name: 
// Module Name: bram_tb
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

module bram_tb();

    reg clk = 0;
    wire [3:0] Max;
    
    top_BRAM tb1(.clk(clk), .Max(Max));
    
    always #5 clk = ~clk;
   
endmodule
