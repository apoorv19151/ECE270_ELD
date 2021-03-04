`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2020 14:54:27
// Design Name: 
// Module Name: top_BRAM
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

module top_BRAM(
    input clk,
    output reg [3:0] Max = 0
    );
    
    wire [3:0] dout;
    reg [3:0] addr_reg = 0, addr_next;
    
    always @(posedge clk)
        begin
            addr_reg <= addr_next;
        end
        
    always @(*)
        begin
            if(addr_reg == 9)
                addr_next = addr_reg;
            else
                addr_next = addr_reg+1;
        end
    
    blk_mem_gen_0 your_instance_name (
  .clka(clk),    // input wire clka
  .addra(addr_reg),  // input wire [3 : 0] addra
  .douta(dout)  // output wire [3 : 0] douta
  );
  
  always @ (*)
    begin
        if(dout>Max)
            Max = dout;
        else
            Max = Max;
    end 
  
endmodule
