# Power-System-Analysis-and-Control
Electrical power system analysis and control tools for MATLAB / GNU Octave

`dnm210b.m`: State estimation function

`dnm210Hmatris.m`: Code for state matrix formation in dnm210b.m

`dosya_oku2.m`: Code for reading power system data formed like IEEE14bara.txt

`dosya_oku3.m`: The function which generates bus admittance (Ybara) and line-charging susceptance (ypq2) matrices according to the location of power system data file (konum)

`gucaks.m`: Power flow program (location of power system data file must be defined (e.g. konum='IEEE14bara.txt';) and dosya_oku2.m must be run before execution.)

`IEEE14bara.txt`: IEEE 14 bus test system bus and line data as an example (to be used in power flow and state estimation procedures)
