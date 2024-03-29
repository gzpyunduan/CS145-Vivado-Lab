`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/12 13:39:17
// Design Name: 
// Module Name: flowing_light_tb
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


module flowing_light_tb();

    reg clock;
    reg reset;
    wire [7:0] led;

    flowing_light u0(
        .clock(clock),
        .reset(reset),
        .led(led)
    );

    parameter Period = 10;

    always #(Period * 2) clock = !clock;

    initial begin
        clock = 1'b0;
        reset = 1'b0;
        #(Period * 2) reset = 1'b1;
        #(Period * 4) reset = 1'b0;
    end

endmodule
