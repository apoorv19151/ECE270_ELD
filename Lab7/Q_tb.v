`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2020 20:00:39
// Design Name: 
// Module Name: Q_tb
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

module Q_tb();
    
    reg aclk, aresetn,N_valid,X_valid,T_valid,Q_ready;
    reg [31:0] N,X,T;
    wire [31:0] Q;
    wire N_ready,X_ready,T_ready,Q_valid;
    
    top_QFunc tb1(.aclk(aclk), .aresetn(aresetn), .N(N), .T(T), .Q(Q), .X(X),
                    .N_valid(N_valid), .X_valid(X_valid), .T_valid(T_valid),
                    .Q_valid(Q_valid), .N_ready(N_ready), .X_ready(X_ready), 
                    .T_ready(T_ready), .Q_ready(Q_ready));
                    
    initial
        begin
            aclk=0;
            aresetn=0;
            N=0;
            N_valid=0;
            X=0;
            X_valid=0;
            T=0;
            T_valid=0;
            Q_ready=0;
        end
        
    always #5 aclk=~aclk;
    
    initial
        begin
        #100 aresetn=1;
        #10 N=100;
        #5 N_valid=1;
            while(N_ready==0)
            #5 N_valid=1;
          #10 N_valid=0;
          
        #50 N=200;
        #5 N_valid=1;
            while(N_ready==0)
            #5 N_valid=1;
          #10 N_valid=0;
        end
        
    initial
        begin
        #110 T=2;
        #5 T_valid=1;
            while(T_ready==0)
            #5 T_valid=1;
          #10 T_valid=0;
          
        #50 T=4;
        #5 T_valid=1;
            while(T_ready==0)
            #5 T_valid=1;
          #10 T_valid=0;
        end
        
    initial
        begin
        #110 X=2;
        #5 X_valid=1;
            while(X_ready==0)
            #5 X_valid=1;
          #10 X_valid=0;
          #5 Q_ready = 1'b1;
          
          wait(Q_valid==1'b1)
            #5 Q_ready=1'b1;
          #5 Q_ready=1'b0;
          
        #50 X=4;
        #5 X_valid=1;
            while(X_ready==0)
            #5 X_valid=1;
          #10 X_valid=0;
          #5 Q_ready = 1'b1;
          
          wait(Q_valid==1'b1)
            #5 Q_ready=1'b1;
          #5 Q_ready=1'b0;
        end
endmodule
