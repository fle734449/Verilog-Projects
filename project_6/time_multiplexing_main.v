`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 07:13:01 PM
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
    input startstop,
    input reset,
    input [7:0] sw,
    input [1:0] mode,
    output dp,
    output [3:0] an,
    output [6:0] sseg
    );
    
    wire [6:0] in0, in1, in2, in3;
    wire slow_clk;
    wire time_clk;
    wire [3:0] reg_d0; //count for right most digit
    wire [3:0] reg_d1; //count for second right most digit
    wire [3:0] reg_d2; //count for second left most digit
    wire [3:0] reg_d3; //count for left most digit
    
    // Module instantiation of hexto7segment decoder
    hex2seg c1 (.SW(reg_d0), .out(in0));
    hex2seg c2 (.SW(reg_d1), .out(in1));
    hex2seg c3 (.SW(reg_d2), .out(in2));
    hex2seg c4 (.SW(reg_d3), .out(in3));
    
    // Module instantiation of clock divider
    // same functionality as the clk_div before, but may have a different width requirement
    clk_div_disp c5 (.clk(clk), .reset(reset), .slow_clk(slow_clk), .time_clk(time_clk));
    
    
    stopwatch c6 (
        .clk(time_clk),
        .startstop(startstop),
        .reset(reset),
        .mode(mode[1:0]),
        .sw(sw[7:0]),
        .reg_d0(reg_d0),
        .reg_d1(reg_d1),
        .reg_d2(reg_d2),
        .reg_d3(reg_d3));
    
    
    // Module instantiation of the multiplexer
    //replace slow_clk with clk for simulation, and vice versa
    time_mux_state_machine c7 (
        .clk(slow_clk),
        .reset(reset),
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .dp(dp),
        .an(an),
        .sseg(sseg));  
endmodule
