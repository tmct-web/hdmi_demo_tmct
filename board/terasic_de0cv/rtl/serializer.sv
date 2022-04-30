//=============================================================================
//  hdmi_test
//-----------------------------------------------------------------------------
//  serializer.sv
//  Serialization transmitter
//  * The serializer is located as a board-specific file as it is often device-dependent.
//-----------------------------------------------------------------------------
//  © 2022 tmct  https://ss1.xrea.com/tmct.s1009.xrea.com/
//  This project is distributed under the Apache License 2.0 and MIT License.
//=============================================================================
module serializer
(
    input logic clk_pixel,
    input logic clk_pixel_x5,   // Unused
    input logic reset,
    input logic [9:0] tmds_internal [2:0],
    output logic [2:0] tmds,
    output logic tmds_clock
);

    logic [9:0] tmds_reversed [2:0];
    logic buf_loaden;
    logic buf_lvdsclk;

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

    // CycloneV 'altlvds_tx' has puzzling behavior when using External PLL.
    // So use the PLL generated inside altlvds_tx.
    // CycloneV has some other behaviors that seem to be bugs.
    // ...They are probably limitations caused by too fine a process rule.
    stx stx0(
        .pll_areset     (reset),
	    .tx_in          ({10'b1111100000, tmds_reversed[2], tmds_reversed[1], tmds_reversed[0]}),
	    .tx_inclock     (clk_pixel),
	    .tx_out         ({tmds_clock, tmds[2], tmds[1], tmds[0]})
    );

endmodule
