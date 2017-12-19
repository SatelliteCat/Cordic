onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+TRIG_LUT -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.TRIG_LUT xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {TRIG_LUT.udo}

run -all

endsim

quit -force
