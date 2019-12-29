`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2019 06:47:46 PM
// Design Name: 
// Module Name: rca
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


module rca(
    input clk, 
    input load,
    input [3:0] a,
    input [3:0] b,
    input Cin,
    output [4:0] Q
);
    wire r1, r2, r3;
    wire [4:0] Data;
    
    adder a0(.a(a[0]), .b(b[0]), .Cin(Cin), .S(Data[0]), .Cout(r1));
    adder a1(.a(a[1]), .b(b[1]), .Cin(r1), .S(Data[1]), .Cout(r2));
    adder a2(.a(a[2]), .b(b[2]), .Cin(r2), .S(Data[2]), .Cout(r3));
    adder a3(.a(a[3]), .b(b[3]), .Cin(r3), .S(Data[3]), .Cout(Data[4]));

    loadreg register(.clk(clk), .load(load), .D(Data), .Q(Q));
endmodule
