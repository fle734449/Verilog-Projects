`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 11:10:40 PM
// Design Name: 
// Module Name: clk_div_disp
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


module clk_div_disp(
    input clk,
    input reset,
    output reg slow_clk
    );
    
    reg [14:0] count = 0;
    
    always @(posedge clk) begin
        if(reset) count =0;
        else count = count+1;
        
        if(count == 20000) begin
            slow_clk = ~slow_clk;
            count = 0;
         end
    end
endmodule
