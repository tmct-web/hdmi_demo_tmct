//=============================================================================
//  hdmi_test
//-----------------------------------------------------------------------------
//  serializer.sv
//  Serialization transmitter
//  * The serializer is located as a board-specific file as it is often device-dependent.
//-----------------------------------------------------------------------------
//  © 2021 tmct-web  https://ss1.xrea.com/tmct.s1009.xrea.com/
//  This project is distributed under the Apache License 2.0 and MIT License.
//=============================================================================
module serializer
(
    input logic clk_pixel,
    input logic clk_pixel_x5,
    input logic reset,
    input logic [9:0] tmds_internal [2:0],
    output logic [2:0] tmds,
    output logic tmds_clock
);

    logic [9:0] tmds_reversed [2:0];

    // altlvds transfers data MSB-first.
    // However, TMDS needs to transfer data LSB first, so the bit assignment needs to be reversed.
    genvar i, j;
    generate
        for (i = 0; i < 3; i++)
        begin: tmds_rev
            for (j = 0; j < 10; j++)
            begin: tmds_rev_channel
                assign tmds_reversed[i][j] = tmds_internal[i][9-j];
            end
        end
    endgenerate

    // altlvds_tx transfers data at a double data rate based on clk_pixel_x5.
    // In other words, the data is transferred at a rate 10 times faster than the clk_pixel(pixel clock).
    stx stx0
    (
	    .tx_in          ({10'b1111100000, tmds_reversed[2], tmds_reversed[1], tmds_reversed[0]}),
	    .tx_inclock     (clk_pixel_x5),
	    .tx_syncclock   (clk_pixel),
	    .tx_out         ({tmds_clock, tmds[2], tmds[1], tmds[0]})
    );

endmodule
