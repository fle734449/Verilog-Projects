//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Frank Le
// 
// Create Date: 09/16/2019 07:09:31 PM
// Design Name: 
// Module Name: Mux_structural
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

module Mux_structural(
    input [1:0] sel,
    input i0,
    input i1,
    input i2,
    input i3,
    output d
    );
    
    // Defining wires 
    wire [1:0] sel_not;
    wire x0, x1, x2, x3;
    
    // Instantiating Not gates as per the schematic
    not n1 (sel_not[0], sel[0]);
    not n2 (sel_not[1], sel[1]);
    
    // Instantiating And gates as per the schematic
    
    and and0 (x0, i0, sel_not[1], sel_not[0]);
    and and1 (x1, i1, sel_not[1], sel[0]);
    and and2 (x2, i2, sel[1], sel_not[0]);
    and and3 (x3, i3, sel[1], sel[0]);
    
    //Instantiating Or gates as per schematic
    or or1 (d, x0, x1, x2, x3);
    
endmodule