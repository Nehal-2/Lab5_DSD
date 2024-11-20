`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 01:03:20 PM
// Design Name: 
// Module Name: tb_mod_n_counter
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


module tb_mod_n_counter;
    localparam N = 6;
    localparam WIDTH = $clog2(N);
    logic clk;
    logic areset;
    logic en;
    logic up_down;
    logic load;
    logic [WIDTH-1:0] d;
    logic [WIDTH-1:0] q;

    mod_n_counter #(.N(N)) dut (
        .clk(clk),
        .areset(areset),
        .en(en),
        .load(load),
        .up_down(up_down),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units clock period
    end

    // Test sequence
    initial begin
        $display("                Time   | Reset | Enable | Load     |   Data    | Counter Output");
        $display("             ------------------------------------------------------------");
        $monitor("%t   |   %b   |    %b   |    %b   |   %b   |      %b", $time, areset, en, load, d, q);
        
        
        // Initialize
        areset = 0; en = 0; load = 0; up_down = 0; d = 0; #10;
        
        // Reset active
        areset = 0; #10;
        areset = 1; #10;

        // Enable up-counting
        en = 1; up_down = 0; #70;
        
        // Load data to counter
        load = 1; 
        d = $random % N; // Random n-bit data
        #10;
        load = 0; #30;

        // Disable enable, counter holds value
        en = 0; #20;

        // Enable down-counting
        en = 1; up_down = 1; #70;
        
        // Reset during operation
        areset = 0; #10;
        areset = 1; #10;
        
        // Load data while En = 0
        en = 0; load = 1; d = $random % N; #10;
        load = 0; en = 1; #30;
        
        // Reactivate reset during operation
        areset = 0; #10;

        areset = 1; #10;
        
        $finish;
    end
endmodule

