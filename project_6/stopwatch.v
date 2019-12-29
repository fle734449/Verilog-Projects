`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 07:16:14 PM
// Design Name: 
// Module Name: stopwatch
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

module stopwatch(
    input clk,
    input startstop,
    input reset,
    input [1:0] mode,
    input [7:0] sw,
    output reg [3:0] reg_d0, //count for right most digit
    output reg [3:0] reg_d1, //count for 2nd right most digit
    output reg [3:0] reg_d2, //count for 2nd left most digit
    output reg [3:0] reg_d3  //count for left most digit
    );
    
    reg startstop_ff;
    reg ss = 1;
    reg finish;
    reg idle = 1;
    
always @ (posedge clk) begin
    startstop_ff <= startstop;
    if( startstop_ff && !startstop)
        ss <= ~ss;
end
    
always @ (posedge clk) begin

//Mode 1 (Counting Up from 00.00)
    if (mode == 2'b00) begin
        if (ss == 1 && reset == 1) //if both stop & reset asserted 
                begin 
                    reg_d0 <= 0; //counter0 is 0
                    reg_d1 <= 0; //counter1 is 0
                    reg_d2 <= 0; //counter2 is 0
                    reg_d3 <= 0; //counter3 is 0
                    finish = 0;
                end
                
            // if only stop signal is asserted, store the previous count
            // when stop button is pressed again, resume the old count
            else if (ss == 1 && reset != 0) 
                begin
                    //store the old count
                    reg_d0 <= reg_d0;
                    reg_d1 <= reg_d1;
                    reg_d2 <= reg_d2;
                    reg_d3 <= reg_d3;
                end
             
             //Start stopwatch
             else if (ss != 1 && finish != 1)
                begin
                  if(reg_d0 == 9) begin           
                     reg_d0 <= 0;                          
                     if (reg_d1 == 9) begin          
                            reg_d1 <= 0;                  
                            if (reg_d2 == 9) begin
                                    reg_d2 <= 0;       
                                    if(reg_d3 == 9)begin
                                        reg_d2 <= 9;
                                        reg_d1 <= 9;
                                        reg_d0 <= 9;
                                        finish = 1;
                                    end else
                                        reg_d3 <= reg_d3 + 1; 
                                end else                      
                                    reg_d2 <= reg_d2 + 1;
                         end else                             
                             reg_d1 <= reg_d1 + 1; 
                  end else                                    
                    reg_d0 <= reg_d0 + 1;
                 end
     end
     
//Mode 2 (Counting Up from XX.00)
     if (mode == 2'b01) begin
         if(ss == 1 && reset == 0 && idle == 1) begin
              reg_d0 <= 0; //counter0 is 0
              reg_d1 <= 0; //counter1 is 0
              reg_d2 <= sw[3:0]; //counter2 is 0
              reg_d3 <= sw[7:4]; //counter3 is 0
              finish = 0;
              end
         if (ss == 1 && reset == 1) //if both stop & reset asserted 
                 begin 
                     reg_d0 <= 0; //counter0 is 0
                     reg_d1 <= 0; //counter1 is 0
                     reg_d2 <= sw[3:0]; //counter2 is 0
                     reg_d3 <= sw[7:4]; //counter3 is 0
                     finish = 0;
                     idle = 1;
                 end
                 
             // if only stop signal is asserted, store the previous count
             // when stop button is pressed again, resume the old count
             else if (ss == 1 && reset != 0) 
                 begin
                     //store the old count
                     reg_d0 <= reg_d0;
                     reg_d1 <= reg_d1;
                     reg_d2 <= reg_d2;
                     reg_d3 <= reg_d3;
                     idle = 1;
                 end
              
              //Start stopwatch
              else if (ss != 1 && finish != 1)
                 begin
                 idle = 0;
                   if(reg_d0 == 9) begin              
                      reg_d0 <= 0;                          
                      if (reg_d1 == 9) begin          
                             reg_d1 <= 0;                  
                             if (reg_d2 >= 9) begin     
                                     reg_d2 <= 0;       
                                     if(reg_d3 >= 9)begin
                                         reg_d2 <= 9;
                                         reg_d1 <= 9;
                                         reg_d0 <= 9;
                                         finish = 1;
                                         end else
                                         reg_d3 <= reg_d3 + 1; 
                                 end else                      
                                     reg_d2 <= reg_d2 + 1;
                          end else                             
                              reg_d1 <= reg_d1 + 1; 
                   end else                                    
                     reg_d0 <= reg_d0 + 1;
                  end
      end
 
 
//Mode 3 (Counting Down from 99.99)
    if (mode == 2'b10) begin
         if (ss == 1 && reset == 1)
         begin 
             reg_d0 <= 9;
             reg_d1 <= 9;
             reg_d2 <= 9;
             reg_d3 <= 9;
             finish = 0;
         end
         
         else if (ss == 1 && reset != 0) 
         begin
             reg_d0 <= reg_d0; //store the old count
             reg_d1 <= reg_d1; //store the old count
             reg_d2 <= reg_d2; //store the old count
             reg_d3 <= reg_d3; //store the old count
         end
         
         else if (ss != 1 && finish == 0) begin
         
           if(reg_d0 == 0) begin
              reg_d0 <= 9;
              if (reg_d1 == 0) begin
                     reg_d1 <= 9;
                     if (reg_d2 == 0) begin
                             reg_d2 <= 9; 
                             if(reg_d3 == 0) begin
                                 reg_d0 <= 0;
                                 reg_d1 <= 0;
                                 reg_d2 <= 0;
                                 reg_d3 <= 0;
                                 finish = 1;
                             end else
                                 reg_d3 <= reg_d3 - 1;
                         end else
                             reg_d2 <= reg_d2 - 1;
                  end else
                      reg_d1 <= reg_d1 - 1; 
           end else 
             reg_d0 <= reg_d0 - 1;
          end
    end
      
//Mode 4 (Counting Down from XX.00)
    if (mode == 2'b11) begin
      if (ss == 1 && reset == 0  && idle == 1) begin
          reg_d0 <= 0;
          reg_d1 <= 0;
          if(sw[3:0] > 9)  begin
            reg_d2 <= 9;
          end else begin
            reg_d2 <= sw[3:0];
          end
          if(sw[7:4] > 9) begin
            reg_d3 <= 9;
          end else begin
            reg_d3 <= sw[7:4];
          end
          finish = 0;
      end
      else if (ss == 1 && reset != 0) begin
          reg_d0 <= reg_d0; //store the old count
          reg_d1 <= reg_d1; //store the old count
          reg_d2 <= reg_d2; //store the old count
          reg_d3 <= reg_d3; //store the old count
          idle = 1;
      end
      else if (ss != 1 && finish == 0) begin //if no stop
        idle = 0;
        if(reg_d0 == 0) begin
              reg_d0 <= 9;
              if (reg_d1 == 0) begin
                     reg_d1 <= 9;
                     if (reg_d2 == 0) begin
                             reg_d2 <= 9; 
                             if(reg_d3 == 0) begin
                                 reg_d0 <= 0;
                                 reg_d1 <= 0;
                                 reg_d2 <= 0;
                                 reg_d3 <= 0;
                                 finish = 1;
                             end else
                                 reg_d3 <= reg_d3 - 1;
                         end else
                             reg_d2 <= reg_d2 - 1;
                      end else
                          reg_d1 <= reg_d1 - 1; 
                   end else 
                     reg_d0 <= reg_d0 - 1;
                  end
 end
     
     
end

endmodule

