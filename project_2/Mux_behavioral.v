//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Frank Le
// 
// Create Date: 09/16/2019 09:19:55 PM
// Design Name: 
// Module Name: Mux_behavioral
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
`timescale 1ns / 1ps

module Mux_behavioral(
    input [1:0] sel,
    input i0,
    input i1,
    input i2,
    input i3,
    output reg d
    );
    
    always @( * )
    begin
        case ( sel )
        0 : d = i0;
        1 : d = i1;
        2 : d = i2;
        3 : d = i3;
        endcase
    end

endmodule
