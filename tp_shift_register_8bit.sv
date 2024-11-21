`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2024 11:25:32 AM
// Design Name: 
// Module Name: tp_shift_register_8bit
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


module tp_shift_register_8bit;
        logic CLK;
        logic RESET;
        logic SHIFT_ENABLE;
        logic DATA_IN;
        logic [7:0]q;
        
     //  shift_register_8bit DUT(.*);
   shift_register_8bit DUT (
        .CLK(CLK),
        .RESET(RESET),
        .SHIFT_ENABLE(SHIFT_ENABLE),
        .DATA_IN(DATA_IN),
        .q(q)
    );
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; 00
    end

    // Test sequence
    initial begin
        $display(" Time | Reset | Shift Enable | Data In | Register Output");
        $display("--------------------------------------------------------");
        $monitor("%t |   %b    |      %b       |    %b    |   %b", $time, RESET, SHIFT_ENABLE, DATA_IN, q);
        // Initialize signals
        RESET = 0; SHIFT_ENABLE = 0; DATA_IN = 0; #10;

        // Test: Activate reset
        RESET = 1; #10;
        RESET = 0; #10;
        
        SHIFT_ENABLE = 1;
        DATA_IN = 1; #10; // Input bit = 1
        DATA_IN = 0; #10; // Input bit = 0
        DATA_IN = 1; #10; // Input bit = 1
        DATA_IN = 1; #10; // Input bit = 1

        // RTR Stop shifting
        SHIFT_ENABLE = 0; #20;

        // Shift enable OFF, input data ignored
        DATA_IN = 0; #10;

        // Reactivate shift enable
        SHIFT_ENABLE = 1;
        DATA_IN = 1; #10;

        $finish;
    end
endmodule