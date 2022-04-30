//=============================================================================
//  hdmi_test
//-----------------------------------------------------------------------------
//  hdmi_test_top.sv
//  hdmi-test top-level entry
//-----------------------------------------------------------------------------
//  © 2021 tmct-web  https://ss1.xrea.com/tmct.s1009.xrea.com/
//  This project is distributed under the Apache License 2.0 and MIT License.
//=============================================================================
module hdmi_test
(
    input logic I_CLK,                  // Main clock input
    input logic I_RESET_N,              // Asynchronous reset input(Active 'L')

    output logic [2:0] O_TMDS_DATA,     // TMDS Data output
    output logic O_TMDS_CLK,            // TMDS Clock output

    output logic O_PLL_LOCKED,          // PLL Locked output

    input logic [3:0] I_AUDIO_PITCH,    // for Audio test pattern generation
                                        // The pitch of the audio test pattern will change 
                                        // depending on this input pattern.

    output logic O_AUDIO,               // for Debug
    output logic O_AUDIO_CLK,           // for Debug
    output logic O_VIDEO_CLK            // for Debug
);

    localparam VIDEO_ID_CODE = 3;
    localparam AUDIO_BIT_WIDTH = 16;
    localparam AUDIO_RATE = 48000;
    localparam bit DVI_OUTPUT = 1'b0;
    localparam real VIDEO_REFRESH_RATE = 59.94;

    localparam VIDEO_WIDTH = 10'd720;           // for Video test pattern generation
    localparam VIDEO_HEIGHT = 10'd480;          // for Video test pattern generation
    localparam VIDEO_HEND = VIDEO_WIDTH - 1;    // for Video test pattern generation
    localparam VIDEO_VEND = VIDEO_HEIGHT - 1;   // for Video test pattern generation

    logic clk;
    logic reset;
    logic video_clk;
    logic video_clk_x5;
    logic audio_clk;
    logic [7:0] r;
    logic [7:0] g;
    logic [7:0] b;
    logic [7:0] shift;
    logic [9:0] cx;
    logic [9:0] cy;
    logic [7:0] audio_sample;
    logic [AUDIO_BIT_WIDTH-1:0] audio_sample_dampened;

    assign clk = I_CLK;
    assign reset = ~I_RESET_N;
    assign audio_sample_dampened = {7'h0, audio_sample, 1'h0};

    assign O_AUDIO = audio_sample[7];
    assign O_AUDIO_CLK = audio_clk;
    assign O_VIDEO_CLK = video_clk;

    //-------------------------------------------------------------------------
    //  PLL
    //-------------------------------------------------------------------------
    media_pll media_pll0
    (
        .areset(reset),
	    .inclk0(clk),
	    .c0(video_clk_x5),      // TMDS Data clock (5 times the pixel clock)
                                // In this project, altlvds_tx is used as a serializer for TMDS data.
                                // This clock is used as the transmit clock for altlvds_tx.
                                // Since altlvds_tx sends data with dual edge timing, 
                                // data is sent at twice the speed of this clock.
                                // In other words, the TMDS data is transmitted at 10 times the speed of the pixel clock.
                                //
	    .c1(video_clk),         // Pixcel clock
                                //
	    .c2(audio_clk),         // Audio sampling clock
	    .locked(O_PLL_LOCKED)
    );


    //-------------------------------------------------------------------------
    //  Test pattern generator
    //-------------------------------------------------------------------------
    // Video
    always_ff @ (posedge reset, posedge video_clk)
    begin
        if (reset)
        begin
            r <= 8'h0;
            g <= 8'h0;
            b <= 8'h0;
            shift <= 8'h0;
        end
        else
        begin
            if ((cx == 10'd0) || (cy == 10'd0) || cx == VIDEO_HEND || (cy == VIDEO_VEND))
            begin
                r <= 8'hff;
                g <= 8'hff;
                b <= 8'hff;
            end
            else
            begin
                r <= (cx[7:0] + shift) & 8'hff;
                g <= (cy[7:0] + shift) & 8'hff;
                b <= (cx[7:0] + cy[7:0] - shift) & 8'hff;
            end
            if ((cx == 9'h0) && (cy == 9'h0)) shift <= shift + 8'h1;
        end
    end


    // Audio
    always_ff @ (posedge reset, posedge audio_clk)
    begin
        if (reset)
        begin
            audio_sample <= 8'h0;
        end
        else
        begin
            audio_sample <= audio_sample + {4'h0, I_AUDIO_PITCH[3:0]};
        end
    end


    //-------------------------------------------------------------------------
    //  HDMI body
    //-------------------------------------------------------------------------
    hdmi #
    (
        .VIDEO_ID_CODE(VIDEO_ID_CODE),
        .DVI_OUTPUT(DVI_OUTPUT),
        .VIDEO_REFRESH_RATE(VIDEO_REFRESH_RATE),
        .AUDIO_RATE(AUDIO_RATE),
        .AUDIO_BIT_WIDTH(AUDIO_BIT_WIDTH)
    )
    hdmi0
    (
        .clk_pixel_x5(video_clk_x5),
        .clk_pixel(video_clk),
        .clk_audio(audio_clk),
        .reset(reset),
        .rgb({r, g, b}),
        .audio_sample_word('{audio_sample_dampened, audio_sample_dampened}),

        .tmds(O_TMDS_DATA),
        .tmds_clock(O_TMDS_CLK),
        .cx(cx),
        .cy(cy),
        .frame_width(),
        .frame_height(),
        .screen_width(),
        .screen_height()
    );

endmodule
