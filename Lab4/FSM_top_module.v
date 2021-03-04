`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2020 18:20:57
// Design Name: 
// Module Name: FSM_top_module
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

module FSM_top_module(
    input clk_125,
    input clear,
    input inp_0,
    input inp_1,
    output out,
    output [2:0] present_state
    );
    
    wire clk_5M, clk_200Hz, clk_pulse;
    
      clkIP in1
   (
    .clk_out1(clk_5M),     // output clk_out1
    .clk_in1(clk_125));      // input clk_in1
    
    clk_divider #(.div_value(12499)) in2(.clk_in(clk_5M), .divided_clk(clk_200Hz));
    clk_pulse in3(.clk_200H(clk_200Hz), .inp_0(inp_0), .inp_1(inp_1), .clk_pulse(clk_pulse));
    FSM in4(.clk_pulse(clk_pulse), .clear(clear), .inp_1(inp_1), .out(out), .present_state(present_state));

endmodule
