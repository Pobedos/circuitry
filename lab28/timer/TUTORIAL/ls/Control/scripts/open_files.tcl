global env
# OPEN SOURCE FILES
set hdl_input_location [list "$env(HDS_PROJECT_DIR)/TUTORIAL/hdl" ]
read [list "$env(HDS_PROJECT_DIR)/TUTORIAL/hdl/control_fsm.v"] -format verilog -work tutorial 
present_design .tutorial.Control.INTERFACE
