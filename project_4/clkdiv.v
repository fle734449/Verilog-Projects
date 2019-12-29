`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 08:06:39 PM
// Design Name: 
// Module Name: clkdiv
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


module clkdiv(
    input clk,
    input reset,
    output reg clk_out
    );
    
    reg [23:0] count = 0;
    
    always @(posedge clk) begin
        if(reset) count =0;
        else count = count+1;
        
        if(count == 10000000) begin
            clk_out = ~clk_out;
            count = 0;
         end
    end
endmodule
