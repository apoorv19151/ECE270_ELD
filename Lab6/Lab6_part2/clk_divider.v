`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2020 16:02:43
// Design Name: 
// Module Name: clk_divider
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

module clk_divider
    #(
        parameter div_value = 2499999
    )
    (
    input clk_in,
    output reg divided_clk = 0
    );
    
    reg [31:0] count_reg=0, count_next=0;
    
    always @ (posedge clk_in)
        begin
            if(count_reg == div_value)
                count_reg <= 0;
            else
                count_reg<=count_next;
        end
     
     always @ (*)
        count_next = count_reg+1;
        
     always @ (posedge clk_in)
        begin
            if(count_next == div_value)
                divided_clk <= ~divided_clk;
            else
                divided_clk <= divided_clk;
        end 
  
endmodule
