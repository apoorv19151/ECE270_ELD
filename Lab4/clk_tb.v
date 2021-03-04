`timescale 1ms / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2020 19:44:19
// Design Name: 
// Module Name: clk_tb
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

module clk_tb();

    reg clk_200H, inp_0, inp_1;
    wire clk_pulse, FF1_reg, FF2_reg, FF3_reg;
    
    clk_pulse tb1(.clk_200H(clk_200H), .inp_0(inp_0), .inp_1(inp_1),
                    .FF1_reg(FF1_reg), .FF2_reg(FF2_reg), .FF3_reg(FF3_reg), .clk_pulse(clk_pulse));
                    
    initial
    begin
        clk_200H = 1'b0;
        inp_0 = 1'b0;
        inp_1 = 1'b1;
    end
    
    initial
    begin
        #2.4 inp_1=1'b1;
        #0.5 inp_1=1'b0;
        #0.5 inp_1=1'b1;
        #0.5 inp_1=1'b0;
        #0.5 inp_1=1'b1;
        #0.5 inp_1=1'b0;
        #0.5 inp_1=1'b1;
        #0.5 inp_1=1'b0;
        
        @(posedge clk_200H) inp_1=1'b1;
        @(posedge clk_200H) inp_1=1'b1;
        @(posedge clk_200H) inp_1=1'b1;
        @(negedge clk_200H) inp_1=1'b0;
        @(posedge clk_200H) inp_0=1'b1;
        
        #0.5 inp_0=1'b0;
        #0.5 inp_0=1'b1;
        #0.5 inp_0=1'b0;
        #0.5 inp_0=1'b1;
        #0.5 inp_0=1'b0;
        #0.5 inp_0=1'b1;
        #0.5 inp_0=1'b0;
        
        @(posedge clk_200H) inp_0=1'b1;
        @(posedge clk_200H) inp_0=1'b1;
        @(posedge clk_200H) inp_0=1'b0;
        
        #100 $finish;
    end
    
    always #2.5 clk_200H = ~clk_200H;
                       
endmodule
