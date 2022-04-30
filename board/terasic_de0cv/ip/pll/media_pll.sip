set_global_assignment -entity "media_pll" -library "lib_media_pll" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "media_pll" -library "lib_media_pll" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "media_pll" -library "lib_media_pll" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_media_pll" -name SPD_FILE [file join $::quartus(sip_path) "media_pll.spd"]

set_global_assignment -library "lib_media_pll" -name MISC_FILE [file join $::quartus(sip_path) "media_pll_sim/media_pll.vo"]
