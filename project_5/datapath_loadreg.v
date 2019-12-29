`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2019 09:49:03 PM
// Design Name: 
// Module Name: datapath_loadreg
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


module datapath_loadreg(
input clk , load ,
    input [9:0] D,
    output reg [9:0] Q
    ) ;
    
initial Q = 0;
always @(posedge clk) begin
    if (load) 
        Q<=D;
    end
endmodule