`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 07:09:45 PM
// Design Name: 
// Module Name: call_system
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


module call_system(
    input clk,
    input call,
    input cancel,
    output reg light_state
    );
    
    reg next_state;
    initial light_state = 0;
    
    always @(*) begin
        case({call, cancel, light_state})
            3'b000: next_state = 1'b0;
            3'b001: next_state = 1'b1;
            3'b010: next_state = 1'b0;
            3'b011: next_state = 1'b0;
            3'b100: next_state = 1'b1;
            3'b101: next_state = 1'b1;
            3'b110: next_state = 1'b1;
            3'b111: next_state = 1'b1;
            default: next_state = 1'b0;
         endcase
     end
     
     always @(posedge clk) begin
        light_state <= next_state;
     end
endmodule
