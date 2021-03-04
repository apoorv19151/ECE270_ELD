`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2020 14:36:00
// Design Name: 
// Module Name: fa
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

module fa(
    input A,
    input B,
    input C,
    output Sum,
    output Carry
    );
    
    assign Sum = A^B^C;
    assign Carry = ((A^B)&C) | (A&B);
    
endmodule
