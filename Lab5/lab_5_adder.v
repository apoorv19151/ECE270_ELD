`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2020 14:34:44
// Design Name: 
// Module Name: lab_5_adder
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

module lab_5_adder(
    input [7:0] A,
    input [7:0] B,
    input clk,
    output reg [8:0] Sum
    );
    
    reg [7:0] FF_A, FF_B;
    wire [8:0] S;
    wire [6:0] C;
    reg [6:0] RegC;
    
    always @ (posedge clk)
    begin
        FF_A <= A;
        FF_B <= B;
        Sum <= S;
        RegC <= C; 
    end
    
    fa FA0(.A(FF_A[0]), .B(FF_B[0]), .C(1'b0), .Sum(S[0]), .Carry(C[0]));
    fa FA1(.A(FF_A[1]), .B(FF_B[1]), .C(RegC[0]), .Sum(S[1]), .Carry(C[1]));
    fa FA2(.A(FF_A[2]), .B(FF_B[2]), .C(RegC[1]), .Sum(S[2]), .Carry(C[2]));
    fa FA3(.A(FF_A[3]), .B(FF_B[3]), .C(RegC[2]), .Sum(S[3]), .Carry(C[3]));
    fa FA4(.A(FF_A[4]), .B(FF_B[4]), .C(RegC[3]), .Sum(S[4]), .Carry(C[4]));
    fa FA5(.A(FF_A[5]), .B(FF_B[5]), .C(RegC[4]), .Sum(S[5]), .Carry(C[5]));
    fa FA6(.A(FF_A[6]), .B(FF_B[6]), .C(RegC[5]), .Sum(S[6]), .Carry(C[6]));
    fa FA7(.A(FF_A[7]), .B(FF_B[7]), .C(RegC[6]), .Sum(S[7]), .Carry(S[8]));
        
endmodule
