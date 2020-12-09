** mux_slice.sp
** Objective: Lab 5 Part 1
** Author: Cole Maxwell
** Generated for: hspiceD
** Generated on: Dec 8
** Design library name: gates
** Design cell name: mux_slice
** Design view name: schematic

*------------------------------------------------------------------------
* Parameters and models
*------------------------------------------------------------------------


* include transistor models. include command can also be used to include other spice files
.include '$PDK_DIR/ncsu_basekit/models/hspice/hspice_nom.include'

* Analysis commands
.param vdd_val = 1.1
Vsupply vdd 0 vdd_val
Vgnd gnd 0 0

* Digital vector file for input from same directory
.vec 'arbiter_input.vec'

* Simulation options
.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
+    POST



** Library name: gates
** Cell name: arbiter
** View name: schematic
m3 q s_in vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m2 q q_not vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m1 q_not q vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m0 q_not r_in vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m7 net23 s_in gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m6 q q_not net23 gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m5 net24 r_in gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m4 q_not q net24 gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1

*------------------------------------------------------------------------
* Stimulus
*------------------------------------------------------------------------

.tran 1p 400p

.END
