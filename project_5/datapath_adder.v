`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2019 09:48:36 PM
// Design Name: 
// Module Name: datapath_adder
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


module datapath_adder(
 input a , b , Cin ,
    output S , Cout
);

   assign Cout = (b&Cin) | (a&Cin) | (a&b);
   assign S = a ^ b ^ Cin;
    
endmodule
