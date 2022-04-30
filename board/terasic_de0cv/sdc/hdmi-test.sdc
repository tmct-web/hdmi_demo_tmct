derive_pll_clocks
derive_clock_uncertainty

set_time_format -unit ns -decimal_places 3

create_clock -name MAIN_CLK -period 20.000 [get_ports {I_CLK}]
# create_generated_clock -source {media_pll0|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 10 -multiply_by 27 -duty_cycle 50.00 -name {media_pll0|altpll_component|auto_generated|pll1|clk[0]} {media_pll0|altpll_component|auto_generated|pll1|clk[0]}
# create_generated_clock -source {media_pll0|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 50 -multiply_by 27 -duty_cycle 50.00 -name {media_pll0|altpll_component|auto_generated|pll1|clk[1]} {media_pll0|altpll_component|auto_generated|pll1|clk[1]}
# create_generated_clock -source {media_pll0|altpll_component|auto_generated|pll1|inclk[0]} -divide_by 3125 -multiply_by 3 -duty_cycle 50.00 -name {media_pll0|altpll_component|auto_generated|pll1|clk[2]} {media_pll0|altpll_component|auto_generated|pll1|clk[2]}

