`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 01:32:06 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider#(
        parameter N = 100000000
        
)(      input logic clk,
        input logic areset,
        output logic clk_out

    );
    
    localparam WIDTH = $clog2(N);
    logic [WIDTH-1 : 0] count;
    logic en_counter = 1'b1;
    logic overflow;
    
    mod_n_counter #(.N(N)) mod_counter_inst (
        .clk(clk),
        .areset(areset),
        .en(en_counter),
        .q(count)
    );
    
    assign overflow = (count == N-1);
    
    d_flipflop FF(
        .d(~clk_out),
        .en(overflow),
        .clk(clk),
        .areset(areset),
        .qs(clk_out)
    );
    
endmodule
