global env
# OPEN SOURCE FILES
read [list "$env(HDS_PROJECT_DIR)/timer_lib/hdl/control_fsm.v" \
           "$env(HDS_PROJECT_DIR)/timer_lib/hdl/BCDCounter.v" \
           "$env(HDS_PROJECT_DIR)/timer_lib/hdl/counter_struct.v" \
           "$env(HDS_PROJECT_DIR)/timer_lib/hdl/timer_struct.v" \
           "$env(HDS_PROJECT_DIR)/timer_lib/hdl/timer_tester_flow.v" \
           "$env(HDS_PROJECT_DIR)/timer_lib/hdl/timer_tb_struct.v"] -format verilog -work timer_lib -tech apa
present_design .timer_lib.timer_tb.INTERFACE
