function veri3=filtre3(giris1,f,N,h)
%function veri3=filtre3(giris1,f,N,h)
%giris1: harmonik bileþen deðeri hesaplanmak istenen deðiþken (gerilim, akým,..vs.)
%f: frekans
%N: bir periyottaki örnek sayýsý
%veri3: harmonik bileþenin kutupsal deðeri (a+jb)
%h: Kaçýncý harmonik bileþen hesaplanacak?

omega=2*pi*f;
deltat=(1/f)/N;
teta=omega*deltat;

for p=1:length(giris1)
    veri3(p)=NaN;
    if p<=length(giris1)-N+1
        veri1(p)=0;    
        for k=0:N-1                
            veri1(p)=veri1(p)+giris1(p+k)*exp(-i*k*h*teta);
        end
        veri1(p)=(sqrt(2)/N)*veri1(p);
        veri2(p)=angle(veri1(p)*exp(i*pi/2));
        veri3(p)=abs(veri1(p))*sqrt(2)*sin(veri2(p));
    end
end
end