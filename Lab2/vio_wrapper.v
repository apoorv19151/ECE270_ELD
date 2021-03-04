`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2020 21:03:11
// Design Name: 
// Module Name: vio_wrapper
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

module vio_wrapper(
    input clk
    );
   
    wire [2:0] A,B;
    wire [3:0] Sum;
    
    vio_0 vio1 (
  .clk(clk),                // input wire clk
  .probe_in0(Sum),    // input wire [3 : 0] probe_in0
  .probe_out0(A),  // output wire [2 : 0] probe_out0
  .probe_out1(B)  // output wire [2 : 0] probe_out1
);

top_adder vin2(.A(A), .B(B), .Sum(Sum));

endmodule
