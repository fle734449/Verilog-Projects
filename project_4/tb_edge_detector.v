`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 09:13:49 PM
// Design Name: 
// Module Name: tb_edge_detector
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


module tb_edge_detector;

reg clk = 0;
reg signal = 0;
reg reset = 0;

wire outedge;

edge_detector u1(
    .clk(clk),
    .signal(signal),
    .reset(reset),
    .outedge(outedge)
    );

always #5 clk = ~clk;

initial begin
    signal = 0; reset = 0;
    #10 signal = 1; reset = 0;
    #10 signal = 0; reset = 1;
    #10 signal = 1; reset = 1;
    #10 signal = 0; reset = 0;
    #10 signal = 1; reset = 0;
    #10 reset = 1;
    #20 reset = 0;
    #20 signal = 0; reset = 1;
    #20 signal = 0; reset = 0;
end  
    
endmodule

