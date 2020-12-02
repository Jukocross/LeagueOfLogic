set projDir "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/vivado"
set projName "testComponent"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/au_top_0.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/reset_conditioner_1.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/button_controller_2.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/counter_3.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/game_Controller_4.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/seven_seg_select_digit_5.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/seven_seg_select_value_negate_6.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/button_conditioner_7.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/edge_detector_8.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/alu_component_9.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/game_regFiles_10.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/game_fsm_11.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/seven_seg_12.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/pipeline_13.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/adderUnit_14.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/booleanUnit_15.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/shifterUnit_16.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/compareUnit_17.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/edge_detector_18.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/counter_19.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/variable_3bit_generator_20.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/counter_21.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/counter_22.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/verilog/pn_gen_23.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/testComponent/work/constraint/custom.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
