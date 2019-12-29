`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 07:55:47 PM
// Design Name: 
// Module Name: call_system_dataflow
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


module call_system_dataflow(
    input clk,
    input call,
    input cancel,
    output reg light_state
    );
    
    wire next_state;
    initial light_state = 0;
    
    assign next_state = call | light_state&(!cancel);
     
     always @(posedge clk) begin
        light_state <= next_state;
     end
endmodule

