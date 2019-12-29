`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 07:09:03 PM
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
    output  time_clk,
    output reg slow_clk
    );
    
    reg[19:0] time_count = 0;
    reg [14:0] count = 0;
    reg time_c;
    assign time_clk = time_c;

    always @(posedge clk) begin
        if (time_count < 500000) begin 
            time_count <= time_count + 1;
          end
        else begin
            time_c <= ~time_c;
            time_count <= 0;
          end
    end

    always @(posedge clk) begin
        if(reset) count = 0;
        else count = count+1;
        
        if(count == 20000) begin
            slow_clk = ~slow_clk;
            count = 0;
         end
    end
endmodule
