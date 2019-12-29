`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2019 09:41:32 PM
// Design Name: 
// Module Name: datapath
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


module datapath(
    input clk, load,
    input [3:0] a, b,
    input Cin ,
    output [9:0] Q,
    input sel
    );
    wire [4:0] Q1;
    wire [4:0] Q2;
    reg [9:0] Data;
    datapath_rca rca(.clk(clk), .load(load), .a(a), .b(b), .Cin(Cin), .Q(Q1));
    datapath_cla cla(.clk(clk), .load(load), .a(a), .b(b), .Cin(Cin), .Q(Q2));
    
    always @( * )
    begin
        case (sel)
        0 : Data = (Data & 9'b0000000000) | Q1;
        1 : Data = ((Data & 9'b0000000000) | Q2) << 5;
        endcase
    end           
   
    
    datapath_loadreg register(.clk(clk), .load(load), .D(Data), .Q(Q));
endmodule
