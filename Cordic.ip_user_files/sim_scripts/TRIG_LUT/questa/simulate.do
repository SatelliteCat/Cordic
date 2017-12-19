onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib TRIG_LUT_opt

do {wave.do}

view wave
view structure
view signals

do {TRIG_LUT.udo}

run -all

quit -force
