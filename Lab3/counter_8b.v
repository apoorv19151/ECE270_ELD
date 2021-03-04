`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2020 20:51:16
// Design Name: 
// Module Name: counter_8b
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

module counter_8b(
    input counter_clk, // defining all the inputs and outputs.
    input reset,
    output [7:0] count
    );
    
    reg [7:0] count_reg=8'b00000000;
    reg [7:0] count_next; // we don't initialize next variable as it is the output of the combinational bolck
    
    always @(posedge counter_clk)   // sequential block for assigning the reg variable
        begin
            if(reset==1'b1)
                count_reg<=8'b00000000;
            else
                count_reg<=count_next;
        end
    
    always @ (*)    // combinational block for assigning the next variable.
        count_next = count_reg+1;
        assign count = count_reg;
   
endmodule
