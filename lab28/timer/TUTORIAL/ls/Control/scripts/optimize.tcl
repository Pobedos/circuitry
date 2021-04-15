global env
# OPTIMIZE
 optimize .tutorial.Control.INTERFACE  -effort quick -chip  -hierarchy auto
 optimize_timing -force .tutorial.Control.INTERFACE

 # WRITE DESIGN NETLIST
 auto_write -format edif "$env(HDS_PROJECT_DIR)/TUTORIAL/ls/Control/netlists/Control.edf"

 # WRITE XDB FILE
 auto_write -format xdb "$env(HDS_PROJECT_DIR)/TUTORIAL/ls/Control/xdb/Control.xdb"

 # WRITE REPORTS
 report_area -cell_usage > "$env(HDS_PROJECT_DIR)/TUTORIAL/ls/Control/reports/Control_INTERFACE_sum.txt"
 report_delay -num_paths 1 -clock_frequency >> "$env(HDS_PROJECT_DIR)/TUTORIAL/ls/Control/reports/Control_INTERFACE_sum.txt"
 file copy -force "$env(HDS_PROJECT_DIR)/TUTORIAL/ls/Control/reports/Control_INTERFACE_sum.txt" "$env(HDS_PROJECT_DIR)/TUTORIAL/ls/Control/netlists/Control_INTERFACE_sum"

 # Specify output file location (LS2000.1a2 and later)
 set output_file "$env(HDS_PROJECT_DIR)/TUTORIAL/ls/Control/netlists/Control.edf"
