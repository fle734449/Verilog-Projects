`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2019 09:44:27 PM
// Design Name: 
// Module Name: datapath_rca
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


module datapath_rca(
    input clk , load ,
    input [3:0] a, b ,
    input Cin ,
    output [4:0] Q
);
    wire r1, r2, r3;
    
    datapath_adder a0(.a(a[0]), .b(b[0]), .Cin(Cin), .S(Q[0]), .Cout(r1));
    datapath_adder a1(.a(a[1]), .b(b[1]), .Cin(r1), .S(Q[1]), .Cout(r2));
    datapath_adder a2(.a(a[2]), .b(b[2]), .Cin(r2), .S(Q[2]), .Cout(r3));
    datapath_adder a3(.a(a[3]), .b(b[3]), .Cin(r3), .S(Q[3]), .Cout(Q[4]));

endmodule
