onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /timer_tb/alarm
add wave -noupdate -format Logic /timer_tb/clk
add wave -noupdate -format Literal /timer_tb/d
add wave -noupdate -format Literal -radix unsigned /timer_tb/high
add wave -noupdate -format Literal -radix unsigned /timer_tb/low
add wave -noupdate -format Logic /timer_tb/reset
add wave -noupdate -format Logic /timer_tb/start
add wave -noupdate -format Logic /timer_tb/stop
add wave -noupdate -format Logic /timer_tb/U_0/I0/beep
add wave -noupdate -format Logic /timer_tb/U_0/I0/hold
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ns} {1 us}
