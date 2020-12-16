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
.vec 'mux_slice_input.vec'

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
xi5 s_in net19 gnd vdd net25 nand
xi4 net23 net25 gnd vdd s_out nand
xi3 sel r_in gnd vdd net23 nand
xi2 net22 net24 gnd vdd r_out nand
xi1 s_in net19 gnd vdd net22 nand
xi0 sel r_in gnd vdd net24 nand
xi6 gnd sel net19 vdd not

*------------------------------------------------------------------------
* Stimulus
*------------------------------------------------------------------------

.tran 1p 400p

.END
