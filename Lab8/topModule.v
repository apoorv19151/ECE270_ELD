`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 14:31:24
// Design Name: 
// Module Name: topModule
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

module topModule(
    input aclk,     // defining inputs and outputs
    input aresetn,  // In case of X and T, tb will act as master
    input [31:0] T,
    input T_valid,
    output T_ready,
    input [31:0] X,
    input X_valid,
    output X_ready,
    output [31:0] Q,
    output Q_valid,   // In case of Q, since the output is coming from the IP, tb will act as slave
    input Q_ready
    );
    
wire [31:0] FT;             // fixed to float IP for converting the input to float
wire FT_valid, FT_ready;    // floating point IP only works on floating point numbers
                            
    fixed_to_float T_float (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(T_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(T_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(T),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(FT_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(FT_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(FT)    // output wire [31 : 0] m_axis_result_tdata
);

wire [31:0] FX;
wire FX_valid, FX_ready;

fixed_to_float X_float(
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(X_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(X_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(X),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(FX_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(FX_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(FX)    // output wire [31 : 0] m_axis_result_tdata
);

wire [31:0] X_div_T;
wire X_div_T_valid, X_div_T_ready;  // IP for performing the division X/T

divide XdivT (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(FX_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(FX_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(FX),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(FT_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(FT_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(FT),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(X_div_T_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(X_div_T_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(X_div_T)    // output wire [31 : 0] m_axis_result_tdata
);

wire [31:0] X_div_T_square;
wire X_div_T_sqaure_valid, X_div_T_square_ready; // IP for calculating the square of X/T

Multiply XdivT_square (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(X_div_T_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(X_div_T_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(X_div_T),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(X_div_T_valid),            // input wire s_axis_b_tvalid
//  .s_axis_b_tready(X_div_T_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(X_div_T),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(X_div_T_sqaure_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(X_div_T_square_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(X_div_T_square)    // output wire [31 : 0] m_axis_result_tdata
);

wire [31:0] sub;
wire sub_valid, sub_ready;  // IP for calculating X/T - (X/T)^2

subtract X_div_T_sub_X_div_T_square (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(X_div_T_valid),            // input wire s_axis_a_tvalid
//  .s_axis_a_tready(X_div_T_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(X_div_T),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(X_div_T_sqaure_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(X_div_T_square_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(X_div_T_square),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(sub_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(sub_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(sub)    // output wire [31 : 0] m_axis_result_tdata
);

wire [31:0] root;
wire root_valid, root_ready;  // IP for calculating the sqrt root of X/T - (X/T)^2

square_root squareRoot (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(sub_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(sub_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(sub),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(root_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(root_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(root)    // output wire [31 : 0] m_axis_result_tdata
);

addition result (              // IP for calculating the final result X/T + (sqrt root of X/T - (X/T)^2)
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(X_div_T_valid),            // input wire s_axis_a_tvalid
//  .s_axis_a_tready(X_div_T_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(X_div_T),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(root_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(root_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(root),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(Q_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(Q_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(Q)    // output wire [31 : 0] m_axis_result_tdata
);

endmodule
