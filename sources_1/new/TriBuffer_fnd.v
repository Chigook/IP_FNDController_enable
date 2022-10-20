`timescale 1ns / 1ps


module TriBuffer_fnd(
    input [3:0] i_x,
    input i_en,

    output [3:0] o_y
    );

    assign o_y = (i_en == 1'b0) ? i_x : 4'b1111;
endmodule
