%A rough demonstration of Discrimination Index (DI) mentioned in article ( I. G. Tekdemir and B. Alboyaci, "A Novel Approach for Improvement of Power Swing Blocking and Deblocking Functions in Distance Relays," in IEEE Transactions on Power Delivery, vol. 32, no. 4, pp. 1986-1994, Aug. 2017. doi: 10.1109/TPWRD.2016.2600638 ) for a 5-cycle synthetically created sine wave. Amplitude of the wave is doubled after 2 cycles, so as to demonstrate a sudden change in system (a fault in a power system, e.g.).
%clear;clc;
t=0:0.001:0.1;
y(1:40)=sin(2*pi*50*t(1:40));
y(41:101)=2*sin(2*pi*50*t(41:101));
N=20;
for p=1:length(t)	
	DI(p)=0;
	if p>=2*N-1
		for q=0:N-1
			DI(p)=DI(p)+(y(-q+p-3)-3*y(-q+p-2)+3*y(-q+p-1)-y(-q+p)+mean(y(-q+p-N+1:-q+p)))^2;
		end			
	end
end
plot(t,y,t,10*DI);%DI is multiplied by 10 so as to make the view of graphics comfortable
