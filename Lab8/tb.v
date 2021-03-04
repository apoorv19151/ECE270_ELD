`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2020 17:52:58
// Design Name: 
// Module Name: tb
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

module tb();

    reg aclk, aresetn, X_valid, T_valid, Q_ready; // defining the input and output for our tb
    reg [31:0] X,T;
    wire [31:0] Q;
    wire X_ready, T_ready, Q_valid;
    
    topModule tb_module(.aclk(aclk), .aresetn(aresetn), .T(T), .Q(Q), .X(X),
                    .X_valid(X_valid), .T_valid(T_valid), .Q_valid(Q_valid), .X_ready(X_ready), 
                    .T_ready(T_ready), .Q_ready(Q_ready)); 
                    
   initial
        begin           // initializing the values
            aclk=0;
            aresetn=0;
            X=0;
            X_valid=0;
            T=0;
            T_valid=0;
            Q_ready=0;
        end
        
    always #5 aclk=~aclk; // defining the clock
      
    initial
    #100 aresetn = 1;     
        
    initial              // definig the values for T
        begin
        #110 T=5;
        #5 T_valid=1;
            while(T_ready==0)
            #5 T_valid=1;
          #10 T_valid=0;
          
        #50 T=20;
        #5 T_valid=1;
            while(T_ready==0)
            #5 T_valid=1;
          #10 T_valid=0;
        end
        
    initial              // defining the values for X and Q
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
