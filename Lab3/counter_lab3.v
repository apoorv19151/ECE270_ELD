`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2020 20:47:51
// Design Name: 
// Module Name: counter_lab3
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

module counter_lab3(
    input clk_125M,
    input reset,
    output [7:0] count
    );
    wire clk_5MHz, clk_1Hz;
      clk_IP ins3
   (
    .clk_out1(clk_5MHz),     // output clk_out1
    .clk_in1(clk_125M));
    
    clk_divider ins1(.clk_in(clk_5MHz), .divided_clk(clk_1Hz));
    counter_8b ins2(.counter_clk(clk_1Hz), .reset(reset), .count(count));
    
    ila_0 your_instance_name (
	.clk(clk_125M), // input wire clk
	.probe0(clk_1Hz), // input wire [0:0]  probe0  
	.probe1(reset), // input wire [0:0]  probe1 
	.probe2(count) // input wire [7:0]  probe2
);  
endmodule
