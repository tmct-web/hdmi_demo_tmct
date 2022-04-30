## Generated SDC file "hdmi_test.out.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

## DATE    "Sat Apr 30 09:27:49 2022"

##
## DEVICE  "5CEBA4F23C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {MAIN_CLK} -period 20.000 -waveform { 0.000 10.000 } [get_ports {I_CLK}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} -source [get_pins {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|refclkin}] -duty_cycle 50/1 -multiply_by 215 -divide_by 7 -master_clock {MAIN_CLK} [get_pins {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] 
create_generated_clock -name {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 61 -master_clock {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} [get_pins {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 500 -master_clock {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} [get_pins {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~FRACTIONAL_PLL|vcoph[0]} -source [get_pins {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~FRACTIONAL_PLL|refclkin}] -duty_cycle 50/1 -multiply_by 40 -divide_by 2 -master_clock {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk} [get_pins {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~FRACTIONAL_PLL|vcoph[0]}] 
create_generated_clock -name {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_ena~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_ena~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 10/1 -multiply_by 1 -divide_by 20 -phase 11439720/39721 -master_clock {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~FRACTIONAL_PLL|vcoph[0]} [get_pins {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_ena~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 2 -phase 180/1 -master_clock {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~FRACTIONAL_PLL|vcoph[0]} [get_pins {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.310  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {media_pll0|media_pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|writeclk}] 
set_false_path -from [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|writeclk}] 
set_false_path -from [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|writeclk}] 
set_false_path -from [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd4|writeclk}] 


#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[0]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[0]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[1]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[1]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[2]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[2]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[3]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[3]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[4]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[4]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[5]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[5]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[6]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[6]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[7]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[7]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[8]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[8]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[9]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd1|txin[9]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[0]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[0]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[1]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[1]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[2]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[2]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[3]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[3]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[4]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[4]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[5]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[5]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[6]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[6]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[7]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[7]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[8]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[8]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[9]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd2|txin[9]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[0]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[0]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[1]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[1]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[2]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[2]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[3]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[3]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[4]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[4]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[5]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[5]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[6]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[6]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[7]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[7]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[8]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[8]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[9]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd3|txin[9]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd4|txin[0]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd4|txin[0]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd4|txin[1]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd4|txin[1]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd4|txin[2]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd4|txin[2]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd4|txin[3]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd4|txin[3]}] 9
set_multicycle_path -setup -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd4|txin[4]}] 9
set_multicycle_path -hold -end -to [get_pins { hdmi0|serializer0|stx0|ALTLVDS_TX_component|auto_generated|sd4|txin[4]}] 9


#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

