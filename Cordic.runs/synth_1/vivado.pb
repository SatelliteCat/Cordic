
x
Command: %s
53*	vivadotcl2G
3synth_design -top CORDIC_MUL -part xc7a100tcsg324-32default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2#
xc7a100t-csg3242default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2#
xc7a100t-csg3242default:defaultZ17-349h px� 
�
%s*synth2�
wStarting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 316.465 ; gain = 79.559
2default:defaulth px� 
�
synthesizing module '%s'638*oasys2

CORDIC_MUL2default:default2d
NC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/sources_1/new/CORDIC_MUL.vhd2default:default2
462default:default8@Z8-638h px� 
_
%s
*synth2G
3	Parameter num_iters bound to: 10 - type: integer 
2default:defaulth p
x
� 
[
%s
*synth2C
/	Parameter width bound to: 16 - type: integer 
2default:defaulth p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

CORDIC_MUL2default:default2
12default:default2
12default:default2d
NC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/sources_1/new/CORDIC_MUL.vhd2default:default2
462default:default8@Z8-256h px� 

!design %s has unconnected port %s3331*oasys2

CORDIC_MUL2default:default2
i_b[0]2default:defaultZ8-3331h px� 
�
%s*synth2�
xFinished RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 355.793 ; gain = 118.887
2default:defaulth px� 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 355.793 ; gain = 118.887
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
Loading part %s157*device2$
xc7a100tcsg324-32default:defaultZ21-403h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2

CLK_100MHZ2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
22default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
22default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

CLK_100MHZ2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
32default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
32default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

CLK_100MHZ2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
42default:default8@Z12-584h px�
�
&%s:No valid object(s) found for '%s'.
2779*	planAhead2 
create_clock2default:default23
-objects [get_ports CLK_100MHZ]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
42default:default8@Z12-4739h px�
�
No ports matched '%s'.
584*	planAhead2
BTN_UP2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
72default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
72default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
BTN_UP2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
82default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
82default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
SWITCHES[0]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
102default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
102default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
SWITCHES[1]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
112default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
112default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
SWITCHES[2]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
122default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
122default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
SWITCHES[3]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
132default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
132default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
SWITCHES[4]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
142default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
142default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
SWITCHES[5]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
152default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
152default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
SWITCHES[6]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
162default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
162default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
SWITCHES[7]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
172default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
172default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[0]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
202default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
202default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[0]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
212default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
212default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[1]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
222default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
222default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[1]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
232default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
232default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[2]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
242default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
242default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[2]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
252default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
252default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[3]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
262default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
262default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[3]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
272default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
272default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[4]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
282default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
282default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[4]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
292default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
292default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[5]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
302default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
302default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[5]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
312default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
312default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[6]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
322default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
322default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[6]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
332default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
332default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[7]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
342default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
342default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
LEDS[7]2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
352default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
352default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
UART_RX2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
382default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
382default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
UART_TX2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
392default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default2
392default:default8@Z17-55h px�
�
Finished Parsing XDC File [%s]
178*designutils2`
JC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/constrs_1/new/Nexys4.xdc2default:default8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0672default:default2
659.7582default:default2
0.0002default:defaultZ17-268h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
~Finished Constraint Validation : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7a100tcsg324-3
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:09 ; elapsed = 00:00:13 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:09 ; elapsed = 00:00:13 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
}HDL ADVISOR - The operator resource <%s> is shared. To prevent sharing consider applying a KEEP on the output of the operator4233*oasys2
adder2default:default2d
NC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/sources_1/new/CORDIC_MUL.vhd2default:default2
682default:default8@Z8-5818h px� 
�
}HDL ADVISOR - The operator resource <%s> is shared. To prevent sharing consider applying a KEEP on the output of the operator4233*oasys2
adder2default:default2d
NC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/sources_1/new/CORDIC_MUL.vhd2default:default2
682default:default8@Z8-5818h px� 
�
^ROM "%s" won't be mapped to RAM because address size (%s) is larger than maximum supported(%s)3997*oasys2
	s_working2default:default2
322default:default2
252default:defaultZ8-5545h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2#
s_a_current_reg2default:default2d
NC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/sources_1/new/CORDIC_MUL.vhd2default:default2
612default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2!
s_counter_reg2default:default2d
NC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/sources_1/new/CORDIC_MUL.vhd2default:default2
652default:default8@Z8-6014h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:13 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     16 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               16 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               15 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     16 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     15 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
� 
?
%s
*synth2'
Module CORDIC_MUL 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     16 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               16 Bit    Registers := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               15 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                1 Bit    Registers := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     16 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     15 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
+Unused sequential element %s was removed. 
4326*oasys2!
s_counter_reg2default:default2d
NC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/sources_1/new/CORDIC_MUL.vhd2default:default2
652default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2#
s_a_current_reg2default:default2d
NC:/Users/Liam/Documents/GitHub/Cordic/Cordic.srcs/sources_1/new/CORDIC_MUL.vhd2default:default2
612default:default8@Z8-6014h px� 

!design %s has unconnected port %s3331*oasys2

CORDIC_MUL2default:default2
i_b[0]2default:defaultZ8-3331h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2%
\s_shift_reg[15] 2default:defaultZ8-3333h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2#
s_shift_reg[15]2default:default2

CORDIC_MUL2default:defaultZ8-3332h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:09 ; elapsed = 00:00:13 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Timing Optimization : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
{Finished Technology Mapping : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
uFinished IO Insertion : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |    16|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |    34|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |     6|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |    43|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT5   |    16|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT6   |     6|
2default:defaulth px� 
D
%s*synth2,
|8     |FDRE   |    94|
2default:defaulth px� 
D
%s*synth2,
|9     |FDSE   |     1|
2default:defaulth px� 
D
%s*synth2,
|10    |IBUF   |    33|
2default:defaulth px� 
D
%s*synth2,
|11    |OBUF   |    17|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
� 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
� 
N
%s
*synth26
"|      |Instance |Module |Cells |
2default:defaulth p
x
� 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
� 
N
%s
*synth26
"|1     |top      |       |   267|
2default:defaulth p
x
� 
N
%s
*synth26
"+------+---------+-------+------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 6 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
~Synthesis Optimization Runtime : Time (s): cpu = 00:00:10 ; elapsed = 00:00:15 . Memory (MB): peak = 659.758 ; gain = 118.887
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Complete : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 659.758 ; gain = 422.852
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
492default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
162default:default2
382default:default2
312default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:182default:default2
00:00:242default:default2
659.7582default:default2
430.6212default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2\
HC:/Users/Liam/Documents/GitHub/Cordic/Cordic.runs/synth_1/CORDIC_MUL.dcp2default:defaultZ17-1381h px� 
�
sreport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.093 . Memory (MB): peak = 659.758 ; gain = 0.000
*commonh px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sun Dec 17 20:31:13 20172default:defaultZ17-206h px� 


End Record