`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2019 11:03:07 PM
// Design Name: 
// Module Name: tb_datapath
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


module tb_datapath;

reg clk;
reg load;
reg [3:0] a;
reg [3:0] b;
reg Cin;
reg sel;
wire [9:0] Q;


datapath uut (
    .clk(clk),
    .load(load),
    .a(a),
    .b(b),
    .Cin(Cin),
    .sel(sel),
    .Q(Q)
    );

    initial begin

    clk = 0;

    load = 0;
    sel = 0;
    a = 4'b0001;
    b = 4'b0101;
    Cin = 1'b0;
    load = 1;
    #10

    load = 0;
    a = 4'b0111;
    b = 4'b0111;
    Cin = 1'b0;
    load = 1;
    #10

    load = 0;
    a = 4'b1000;
    b = 4'b0111;
    Cin = 1'b1;
    load = 1;
    #10

    load = 0;
    a = 4'b1100;
    b = 4'b0100;
    Cin = 1'b0;
    load = 1;
    #10
    
    sel = 1;
    load = 0;
    a = 4'b1000;
    b = 4'b1000;
    Cin = 1'b1;
    load = 1;
    #10

    load = 0;
    a = 4'b1001;
    b = 4'b1010;
    Cin = 1'b1;
    load = 1;
    #10

    load = 0;
    a = 4'b1111;
    b = 4'b1111;
    Cin = 1'b0;
    load = 1;
    #10
    
    sel = 0;
    load = 0;
    a = 4'b1111;
    b = 4'b1111;
    Cin = 1'b0;
    load = 1;
    end

    always
    #5 clk = ~clk;

endmodule