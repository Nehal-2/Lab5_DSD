`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 02:31:14 PM
// Design Name: 
// Module Name: tb_clock_divider
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


module tb_clock_divider;
    logic clk;
    logic areset;
    logic clk_out;

    clock_divider # (.N(100)) dut (
            .clk(clk),
            .areset(areset),
            .clk_out(clk_out)
            );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units clock period
    end
    
    initial begin
        
        // Reset
        areset = 0; #10; areset = 1; 
        #1000
        
        // Reset
        areset = 0; #10; areset = 1; 
        #2000
        
        $finish;
     end
        
endmodule
