//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Frank Le
// 
// Create Date: 09/28/2019 10:46:27 PM
// Design Name: 
// Module Name: tb_SevenSeg_Display
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
module tb_SevenSeg_Display;
    reg [3:0] SW;
    wire [6:0] out; 

    SevenSeg_Display uut (
        .SW(SW),
        .out(out)
    );
    
    initial begin
        #50;
        
        //iterate thorugh values 0 - 15
        SW = 0;
        #50;
        
        SW = 1;
        #50;
        
        SW = 2;
        #50;
        
        SW = 3;
        #50;
        
        SW = 4;
        #50;
        
        SW = 5;
        #50;
        
        SW = 6;
        #50;
        
        SW = 7;
        #50;
        
        SW = 8;
        #50;
        
        SW = 9;
        #50;
        
        SW = 10;
        #50;
        
        SW = 11;
        #50;
        
        SW = 12;
        #50;
        
        SW = 13;
        #50;
        
        SW = 14;
        #50;
        
        SW = 15;
        #50;
    
    
    
    end
endmodule
