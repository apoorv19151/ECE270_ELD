`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2020 00:15:33
// Design Name: 
// Module Name: counter_tb
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

module counter_tb();

    reg counter_clk, reset;
    wire [7:0] count;
    
    counter_8b ins1(.counter_clk(counter_clk), .reset(reset), .count(count));
    
    initial
        begin
            counter_clk = 1'b0;
            reset = 1'b1;
        end
    
    initial
        begin
            #5 reset = 1'b0;
            #50 reset = 1'b1;
            #5 reset = 1'b0;
        end
        
     always #5 counter_clk = ~counter_clk;
        
endmodule
