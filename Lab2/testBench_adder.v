`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2020 20:12:03
// Design Name: 
// Module Name: testBench_adder
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

module testBench_adder();
    
    reg [2:0] A,B;
    wire [3:0] Sum;
    
    top_adder ta1(.A(A), .B(B), .Sum(Sum));
    
    initial
    begin
        A = 3'd0;
        B = 3'd0;
    end
    
    initial
    begin
        #5 A = 3'd7; B = 3'd7;
        #5 A = 3'd1; B = 3'd4;
        #5 A = 3'd6; B = 3'd2;
    end   
endmodule
