`timescale 1ns / 1ps

module FNDController(
    input i_clk,
    input i_reset,
    input [13:0] i_value,
    input [1:0] i_control,

    output [3:0] o_fndSelect,
    output [7:0] o_fndFont
    );

    wire w_clk;

    clock_divider U0(
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_clk(w_clk)
    );

    wire [1:0] w_counter;

    counter_fnd U1(
        .i_clk(w_clk),
        .i_reset(i_reset),
        .o_counter(w_counter)
    );

    wire [3:0] w_fndSelect;
    decoder_2x4 U2(
        .i_digitSelect(w_counter),
        .o_digit(w_fndSelect)
    );

    TriBuffer_fnd U3(
        .i_x(w_fndSelect),
        .i_en(i_control[1]),
        .o_y(o_fndSelect)
    );

    wire [3:0] w_1, w_10, w_100, w_1000;

    wire [13:0] w_value14;
    DataRegister U4(
        .i_data(i_value),
        .i_en(i_control[0]),
        .o_data(w_value14)
    );

    digit_divider U5(
        .i_value(w_value14),
        .o_1(w_1),
        .o_10(w_10),
        .o_100(w_100),
        .o_1000(w_1000)
    );

    wire [3:0] w_value;
    mux_4x1 U6(
        .i_1Value(w_1),
        .i_10Value(w_10),
        .i_100Value(w_100),
        .i_1000Value(w_1000),
        .i_sel(w_counter),
        .o_value(w_value)
    );

    BCDtoFND_decoder U7(
        .i_value(w_value),
        .o_fndFont(o_fndFont)
    );

endmodule
