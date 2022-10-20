`timescale 1ns / 1ps

module mux_4x1(
    input [3:0] i_1000Value, i_100Value, i_10Value, i_1Value,
    input [1:0] i_sel,

    output [3:0] o_value
    );

    reg [3:0] r_value;

    assign o_value = r_value;

    always @(i_sel) begin
        case (i_sel)
        2'h0 : r_value = i_1Value;
        2'h1 : r_value = i_10Value;
        2'h2 : r_value = i_100Value;
        2'h3 : r_value = i_1000Value;
        endcase
    end 
endmodule
