`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2020 16:07:59
// Design Name: 
// Module Name: clk_pulse
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

module clk_pulse(
    input clk_200H,
    input inp_0,
    input inp_1,
    output clk_pulse
    );
    
    wire inp_or;
    reg FF1_reg, FF2_reg, FF3_reg;
    reg FF1_next, FF2_next, FF3_next;
    
    assign inp_or = inp_0 | inp_1;
    
    always @ (posedge clk_200H)
    begin
        FF1_reg <= FF1_next;
        FF2_reg <= FF2_next;
        FF3_reg <= FF3_next;    
    end
    
    always @ (*)
        FF1_next = inp_or;
        
    always @ (*)
        FF2_next = FF1_reg;
        
    always @ (*)
        FF3_next = FF2_reg;
        
    assign clk_pulse = FF1_reg & FF2_reg & ~FF3_reg;
    
endmodule
