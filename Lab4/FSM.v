`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2020 20:35:03
// Design Name: 
// Module Name: FSM
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

module FSM(
    input clk_pulse,
    input clear,
    input inp_1,
    output reg out,
    output reg [2:0] present_state
    );
    
    reg [2:0] next_state;
    
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
    
    always @ (posedge clk_pulse or posedge clear)
    begin
        if(clear == 1'b1)
            present_state <= S0;
        else
            present_state <= next_state;
    end
    
    always @(*)
    begin
    next_state = present_state;
        case(present_state)
        S0: if(inp_1==1'b1)
                next_state = S1;
            else
                next_state = S0;
        S1: if(inp_1==1'b1)
                next_state = S2;
            else
                next_state = S0;
        S2: if(inp_1==1'b1)
                next_state = S2;
            else
                next_state = S3;
        S3: if(inp_1==1'b1)
                next_state = S4;
            else
                next_state = S0;
        S4: if(inp_1==1'b1)
                next_state = S2;
            else
                next_state = S0;
        default:
                next_state = S0;
        endcase
    end
    
    always @ (posedge clk_pulse)   // output assignment block
    begin
    if(present_state == S4 && inp_1==1'b1)
        out <= 1'b1;
    else
        out <= 1'b0;
    end
        
endmodule
