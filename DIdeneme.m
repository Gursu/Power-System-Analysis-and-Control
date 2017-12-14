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
plot(t,y,t,10*DI);