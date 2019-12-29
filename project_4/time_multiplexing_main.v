`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 11:01:05 PM
// Design Name: 
// Module Name: time_multiplexing_main
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


module time_multiplexing_main(
    input clk,
    input reset,
    input [15:0] SW,
    output [3:0] an,
    output [6:0] sseg
    );
    
    wire [6:0] in0, in1, in2, in3;
    wire slow_clk;
    
    //Module instantiation of hex2seg decoder
    hex2seg c1 (.SW(SW[3:0]), .out(in0));
    hex2seg c2 (.SW(SW[7:4]), .out(in1));
    hex2seg c3 (.SW(SW[11:8]), .out(in2));
    hex2seg c4 (.SW(SW[15:12]), .out(in3));
    
    //Module instantiation of the clock divider
    clk_div_disp c5 (.clk(clk), .reset(reset), .slow_clk(slow_clk));
    
    time_mux_state_machine c6(
    .clk (slow_clk),
    .reset (reset),
    .in0 (in0),
    .in1 (in1),
    .in2 (in2),
    .in3 (in3),
    .an (an),
    .sseg (sseg)
    );
endmodule
