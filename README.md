# Power-System-Analysis-and-Control
Electrical power system analysis and control tools for MATLAB / GNU Octave

`dnm210b.m`: State estimation function

`dnm210Hmatris.m`: Code for state matrix formation in dnm210b.m

`dosya_oku2.m`: Code for reading power system data formed like IEEE14bara.txt

`dosya_oku3.m`: The function which generates bus admittance (Ybara) and line-charging susceptance (ypq2) matrices according to the location of power system data file (konum)

`guc1.m`: MATLAB function which gets active power (P) and terminal voltage (V) of the generator connected to Bus-2 as inputs (x, y) and returns total active power loss of IEEE 14 bus test system as the output (kay). It is calculated by running power flow analysis.

`gucaks.m`: Power flow program (location of power system data file must be defined (e.g. konum='IEEE14bara.txt';) and dosya_oku2.m must be run before execution.)

`gucaksIEEE14.m`: Power flow program which is dedicated to solution of IEEE 14 bus test system.

`IEEE14bara.txt`: IEEE 14 bus test system bus and line data as an example (to be used in power flow and state estimation procedures)

`DIdeneme.m`: A rough demonstration of Discrimination Index (DI) mentioned in article ( I. G. Tekdemir and B. Alboyaci, "A Novel Approach for Improvement of Power Swing Blocking and Deblocking Functions in Distance Relays," in IEEE Transactions on Power Delivery, vol. 32, no. 4, pp. 1986-1994, Aug. 2017. doi: 10.1109/TPWRD.2016.2600638 ) for a 5-cycle synthetically created sine wave. Amplitude of the wave is doubled after 2 cycles, so as to demonstrate a sudden change in system (a fault in a power system, e.g.).

`m2pca_cizim.m`: An HTML/canvas graphic tool for Principle Component Analysis (PCA) results. First 3 principle components are to be transformed to RGB (red-green-blue) equivalent values and represented by uniquely colored circles. If PCA is applied to a time series data, it would also be meaningful to see the newly colored circles in chronological order as the output of the code.

`fazorel7.m`: Function for creating phasor of electrical voltage or current in a power system by using Discrete Fourier Transform (DFT). It is possible to create any harmonic component with its amplitude and angle.
