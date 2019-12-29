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


module tb_time_mux_state_machine;
reg clk;
reg reset;
reg [15:0] SW;
wire [3:0] an;
wire [6:0] sseg;

time_multiplexing_main u1 (
.clk(clk),
.reset(reset),
.SW(SW),
.an(an),
.sseg(sseg)
);

initial begin

clk = 0;
reset = 1;
SW = 16'h0000;

#10
reset = 0;
SW = 16'h0004;

#10

SW = 16'h0034;

#10

reset = 1;

#10

reset = 0;

SW = 16'h0234;

#10

SW = 16'hABCD;

end

always
#5 clk = ~clk;


endmodule
