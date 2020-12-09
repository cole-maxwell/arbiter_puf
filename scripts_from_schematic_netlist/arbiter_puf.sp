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
.vec 'arbiter_puf_input.vec'

* Simulation options
.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
+    POST

** Library name: gates
** Cell name: nand
** View name: schematic
.subckt nand a b gnd vdd y
m1 y a net16 gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m0 net16 b gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m3 y b vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m2 y a vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends nand
** End of subcircuit definition.

** Library name: gates
** Cell name: not
** View name: schematic
.subckt not gnd in out vdd
m0 out in gnd gnd NMOS_VTL L=50e-9 W=90e-9 AD=9.45e-15 AS=9.45e-15 PD=300e-9 PS=300e-9 M=1
m1 out in vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends not
** End of subcircuit definition.

** Library name: gates
** Cell name: mux_slice
** View name: schematic
.subckt mux_slice gnd r_in r_out sel s_in s_out vdd
xi5 s_in net19 gnd vdd net25 nand
xi4 net23 net25 gnd vdd s_out nand
xi3 sel r_in gnd vdd net23 nand
xi2 net22 net24 gnd vdd r_out nand
xi1 s_in net19 gnd vdd net22 nand
xi0 sel r_in gnd vdd net24 nand
xi6 gnd sel net19 vdd not
.ends mux_slice
** End of subcircuit definition.

** Library name: gates
** Cell name: arbiter
** View name: schematic
.subckt arbiter gnd q q_not r_in s_in vdd
m3 q s_in vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m2 q q_not vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m1 q_not q vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m0 q_not r_in vdd vdd PMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m7 net23 s_in gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m6 q q_not net23 gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m5 net24 r_in gnd gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
m4 q_not q net24 gnd NMOS_VTL L=50e-9 W=180e-9 AD=18.9e-15 AS=18.9e-15 PD=390e-9 PS=390e-9 M=1
.ends arbiter
** End of subcircuit definition.

** Library name: gates
** Cell name: arbiter_puf
** View name: schematic
xi7 gnd net34 net32 sel7 net33 net31 vdd mux_slice
xi6 gnd r net46 sel0 s net45 vdd mux_slice
xi5 gnd net36 net34 sel6 net35 net33 vdd mux_slice
xi4 gnd net38 net36 sel5 net37 net35 vdd mux_slice
xi3 gnd net40 net38 sel4 net39 net37 vdd mux_slice
xi2 gnd net46 net44 sel1 net45 net43 vdd mux_slice
xi1 gnd net44 net42 sel2 net43 net41 vdd mux_slice
xi0 gnd net42 net40 sel3 net41 net39 vdd mux_slice
xi8 gnd q q_not net32 net31 vdd arbiter

*------------------------------------------------------------------------
* Stimulus
*------------------------------------------------------------------------

.tran 1p 1000p

.END
