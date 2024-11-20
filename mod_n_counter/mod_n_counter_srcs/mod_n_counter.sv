`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 12:04:50 PM
// Design Name: 
// Module Name: mod_n_counter
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


module mod_n_counter#(
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
    
    logic [WIDTH-1 : 0] count;
    
    nbit_counter #(.n(WIDTH)) counter_inst (
        .clk(clk),
        .areset(areset),
        .en(en),
        .load(load),
        .up_down(up_down),
        .d(d),
        .q(count)
    );
    
    always_comb begin
        if (count >= N)
            q = count - N; // Wrap around when mod is exceeded
        else
            q = count;
    end
    
endmodule
