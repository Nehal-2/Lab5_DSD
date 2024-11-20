`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 04:34:43 PM
// Design Name: 
// Module Name: real_time_mod_count
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


module real_time_mod_count#(
        parameter N = 100,
        localparam WIDTH = $clog2(N)
)(      
        input logic clk,
        input logic areset,
        input logic en,
        input logic load,
        input logic up_down, // down count if high
        input logic [WIDTH-1:0] d,
        output logic [WIDTH-1:0] q  

    );
    
    logic clk_div;
    
    clock_divider clk_div_inst (
            .clk(clk),
            .areset(areset),
            .clk_out(clk_div)
            );
            
    mod_n_counter #(.N(N)) mod_counter_inst (
        .clk(clk_div),
        .areset(areset),
        .en(en),
        .load(load),
        .up_down(up_down),
        .d(d),
        .q(q)
    );
    
endmodule
