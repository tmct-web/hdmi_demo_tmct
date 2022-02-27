## Generated SDC file "hdmi_test.out.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

## DATE    "Sat Feb 19 22:10:55 2022"

##
## DEVICE  "EP3C16F484C6"
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

create_generated_clock -name {media_pll0|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {media_pll0|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 27 -divide_by 10 -master_clock {MAIN_CLK} [get_pins {media_pll0|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {media_pll0|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {media_pll0|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 27 -divide_by 50 -master_clock {MAIN_CLK} [get_pins {media_pll0|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {media_pll0|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {media_pll0|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 3 -divide_by 3125 -master_clock {MAIN_CLK} [get_pins {media_pll0|altpll_component|auto_generated|pll1|clk[2]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {media_pll0|altpll_component|auto_generated|pll1|clk[0]}]  0.020  


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



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

