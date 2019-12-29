`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2019 08:58:50 PM
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(
    input clk,
    input signal,
    input reset,
    output reg outedge
    );
    
    wire slow_clk; //divided clk
    reg [1:0] state; //Stores current state
    reg [1:0] next; //Stores next state
    
    //Instantiate clk divider module
    clkdiv cl(.clk(clk), .reset(reset), .clk_out(slow_clk));
    
    //Combinational Logic
    always @(*) begin
        case(state)
            2'b00: begin
                outedge = 1'b0;
                if(~signal) next = 2'b00;
                else next = 2'b01;
            end
            2'b01 : begin
                outedge = 1'b1;
                if(~signal) next = 2'b00;
                else next = 2'b10;
            end
            2'b10 : begin
                outedge = 1'b0;
                if(~signal) next = 2'b00;
                else next = 2'b10;
            end
            default : begin
                next = 2'b00;
                outedge = 1'b0;
            end
        endcase
    end
    
    //Sequential Logic
    always @(posedge slow_clk) begin
        if(reset) state <= 2'b00; //Note that this is a synchronous reset
        else state <= next; //change state
    end
    
endmodule
