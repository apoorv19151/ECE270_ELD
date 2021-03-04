`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2020 00:51:21
// Design Name: 
// Module Name: lab1_encoder
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

module lab1_encoder(
    input [3:0] in,
    output [1:0] out
    );
    assign out[1] = in[2] | in[3];
    assign out[0] = in[1] | in[3];    
endmodule
