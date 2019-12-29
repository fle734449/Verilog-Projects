`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2019 06:39:09 PM
// Design Name: 
// Module Name: loadreg
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


module loadreg(
    input clk,
    input load,
    input [4:0] D,
    output reg [4:0] Q
    );
    
initial Q = 0;
always @(posedge clk) begin
    if (load) 
        Q<=D;
    end
endmodule