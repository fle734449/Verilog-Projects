//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Frank Le
// 
// Create Date: 09/28/2019 09:05:54 PM
// Design Name: 
// Module Name: SevenSeg_Display
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
module SevenSeg_Display(
    input [3:0] SW,
    output [6:0] out,
    wire an0, an1, an2, an3, dp
    );
    
    //defining anodes
    assign an0 = 1'b0;
    assign an1 = 1'b1;
    assign an2 = 1'b1;
    assign an3 = 1'b1;
    assign dp = 1'b1;
    
    //defining wires
    wire [3:0] SW_not;
    
    // Instantiating Not gates as per the schematic
    not n0 (SW_not[0], SW[0]);
    not n1 (SW_not[1], SW[1]);
    not n2 (SW_not[2], SW[2]);
    not n3 (SW_not[3], SW[3]);
    
     // Instantiating And gates as per the schematic
     
    //segment a
    wire a0, a1, a2, a3;
    and and0 (a0, SW_not[3], SW_not[2], SW_not[1], SW[0]); 
    and and1 (a1, SW_not[3], SW[2], SW_not[1], SW_not[0]);
    and and2 (a2, SW[3], SW[2], SW_not[1], SW[0]);
    and and3 (a3, SW[3], SW_not[2], SW[1], SW[0]);
    
    //segment b
    wire b0, b1, b2, b3;
    and and4 (b0, SW_not[3], SW[2], SW_not[1], SW[0]); 
    and and5 (b1, SW[2], SW[1], SW_not[0]);
    and and6 (b2, SW[3], SW[2],  SW_not[0]);
    and and7 (b3, SW[3], SW[1], SW[0]);
    
    //segment c
    wire c0, c1, c2;
    and and8 (c0, SW_not[3], SW_not[2], SW[1], SW_not[0]); 
    and and9 (c1, SW[3], SW[2], SW[1]);
    and and10 (c2, SW[3], SW[2], SW_not[0]);

    //segment d
    wire d0, d1, d2, d3;
    and and11 (d0, SW_not[3], SW_not[2], SW_not[1], SW[0]); 
    and and12 (d1, SW_not[3], SW[2], SW_not[1], SW_not[0]);
    and and13 (d2, SW[2], SW[1], SW[0]);
    and and14 (d3, SW[3], SW_not[2], SW[1], SW_not[0]);
   
    //segment e
    wire e0, e1, e2;
    and and15 (e0, SW_not[2], SW_not[1], SW[0]); 
    and and16 (e1, SW_not[3], SW[2], SW_not[1]);
    and and17 (e2, SW_not[3], SW[1], SW[0]);

    //segment f
    wire f0, f1, f2, f3;
    and and18 (f0, SW_not[3], SW_not[2], SW[0]); 
    and and19 (f1, SW_not[3], SW_not[2], SW[1]);
    and and20 (f2, SW_not[3], SW[1], SW[0]);
    and and21 (f3, SW[3], SW[2], SW_not[1], SW[0]);
    
    //segment g
    wire g0, g1, g2;
    and and22 (g0, SW_not[3], SW_not[2], SW_not[1]); 
    and and23 (g1, SW_not[3], SW[2], SW[1], SW[0]);
    and and24 (g2, SW[3], SW[2], SW_not[1], SW_not[0]);

    //Instantiating Or gates as per schematic
    or or0 (out[6], a0, a1, a2, a3);
    or or1 (out[5], b0, b1, b2, b3);
    or or2 (out[4], c0, c1, c2);
    or or3 (out[3], d0, d1, d2, d3);
    or or4 (out[2], e0, e1, e2);
    or or5 (out[1], f0, f1, f2, f3);
    or or6 (out[0], g0, g1, g2);
    
    
endmodule
