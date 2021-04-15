global env
# SET WORKING DIR
set_working_dir "$env(HDS_PROJECT_DIR)/TUTORIAL/ls/Control/netlists"

# SETUP
source "$env(HDS_PROJECT_DIR)/TUTORIAL/ls/Control/scripts/setup.tcl"

# READ IN SOURCE FILES
source "$env(HDS_PROJECT_DIR)/TUTORIAL/ls/Control/scripts/open_files.tcl"

# OPTIMIZE
source "$env(HDS_PROJECT_DIR)/TUTORIAL/ls/Control/scripts/optimize.tcl"

puts "Info: HDS Synthesis run finished"
