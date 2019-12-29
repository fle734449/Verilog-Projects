//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Frank Le
// 
// Create Date: 09/16/2019 09:25:32 PM
// Design Name: 
// Module Name: tb_Mux_behavioral
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

module tb_Mux_behavioral;
 // Inputs to be defined as registers
    reg [1:0] sel;
    reg i0;
    reg i1;
    reg i2;
    reg i3;
    
    // Outputs to be defined as wires
    wire d;
    
    //Instantiate the Unit Under Test (UUT)
    Mux_behavioral uut (
        .sel(sel),
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .d(d)
    );
    
    initial begin
        //Initialize inputs
        i0 = 0;
        i1 = 0;
        i2 = 0;
        i3 = 0;
        sel = 2'b0;
        
        // Wait 50 ns for global reset to finish
        #100;
        
        //Stimulus - All input combinations by some wait time to observe the o/p
        sel = 0;
        #50;
        i0 = 1;
        #50;
        i0 = 0;
        
        sel = 1;
        #50;
        i1 = 1;
        #50;
        i1 = 0;
        
        sel = 2;
        #50;
        i2 = 1;
        #50;
        i2 = 0;
        
        sel = 3;
        #50;
        i3 = 1;
        #50;
        i3 = 0;
        
        end
        
endmodule
