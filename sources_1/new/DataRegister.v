`timescale 1ns / 1ps


module DataRegister(
    input [13:0] i_data,
    input i_en,

    output [13:0] o_data
    );

    reg [13:0] r_oData = 0;
    reg [13:0] r_tmpData = 0;

    assign o_data = r_oData;

    always @(*) begin
        r_oData <= i_data - r_tmpData;
        if (i_en) begin
            r_tmpData <= i_data;
        end
    end
endmodule
