`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2020 17:53:33
// Design Name: 
// Module Name: pipeline_tb
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

module pipeline_tb();

    reg clk;
    reg [7:0] A,B;
    wire [8:0] Sum;
    
    lab_5_adder tb1(.clk(clk), .A(A), .B(B), .Sum(Sum));
    
    initial
        begin
            A = 8'd0;
            B = 8'd0;
            clk = 1'b0;
        end
    
    initial
        begin
            @(posedge clk) A = 8'd3; B = 8'd4;
            @(posedge clk) A = 8'd3; B = 8'd4;
            @(posedge clk) A = 8'd5; B = 8'd4;
            @(posedge clk) A = 8'd5; B = 8'd4;
            @(posedge clk) A = 8'd6; B = 8'd2;
            @(posedge clk) A = 8'd6; B = 8'd2;
            @(posedge clk) A = 8'd7; B = 8'd7;
            @(posedge clk) A = 8'd7; B = 8'd7;   
        end
        
        always #5 clk = ~clk;
    
endmodule
