`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 10:58:35 AM
// Design Name: 
// Module Name: shift_register_8bit
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


module shift_register_8bit(

input logic CLK,
input logic RESET,
input logic SHIFT_ENABLE,
input logic DATA_IN,

output logic [7:0] q
);
    
    always@(posedge CLK, negedge RESET)
    begin
    if(!RESET)
    begin
    q<= 8'b00000000;
    
    end
    
    else if (SHIFT_ENABLE)
    begin
    q[7] <= q[6];
    q[6] <= q[5];
    q[5] <= q[4];
    q[4] <= q[3];
    q[3] <= q[2];
    q[2] <= q[1];
    q[1] <= q[0];
    q[0] <= DATA_IN;
    
    
    
    // q[0] <= q[1];
   // q[1] <= q[2];
  // q[2] <= q[3];
  // q[3] <= q[4];
  // q[4] <= q[5];
  // q[5] <= q[6];
  // q[6] <= q[7];
  // q[7] <= DATA_IN;
        
        end
        end
endmodule
