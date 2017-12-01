@echo off
set xv_path=E:\\xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim CORDIC_DIV_TB_behav -key {Behavioral:sim_1:Functional:CORDIC_DIV_TB} -tclbatch CORDIC_DIV_TB.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
