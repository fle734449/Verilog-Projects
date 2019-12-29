`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 11:24:01 PM
// Design Name: 
// Module Name: tb_time_mux_state_machine
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


module tb_stopwatch;
reg clk;
reg startstop;
reg reset;
reg [7:0] sw;
reg [1:0] mode;
wire dp;
wire [3:0] an;
wire [6:0] sseg;

time_multiplexing_main u1 (
.clk(clk),
.startstop(startstop),
.reset(reset),
.sw(sw),
.mode(mode),
.dp(dp),
.an(an),
.sseg(sseg)
);

initial begin

//Mode 0:
//clk = 0;
//mode = 0;
//startstop = 1;
//reset = 1;
//#10
//startstop = 0;
//reset = 0;
//sw = 8'b00000000;

//Mode 1:
//clk = 0;
//sw = 8'b10001000;
//mode = 1;
//startstop = 1;
//reset = 1;
//#10
//startstop = 0;
//reset = 0;

//Mode 2:
//clk = 0;
//mode = 2;
//startstop = 1;
//reset = 1;
//#10
//startstop = 0;
//reset = 0;

//Mode 3:
//clk = 0;
//sw = 8'b00000001;
//mode = 3;
//startstop = 1;
//reset = 1;
//#10
//startstop = 0;
//reset = 0;

end

always
#5 clk = ~clk;


endmodule
