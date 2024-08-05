function [veri1,veri2]=fazorel7(giris1,f,N,h)
%function [veri1,veri2]=fazorel7(giris1,f,N,h)
%
%giris1: harmonik bileþen deðeri hesaplanmak istenen deðiþken (gerilim, akým,..vs.)
%f: frekans
%N: bir periyottaki örnek sayýsý
%h: Kaçýncý harmonik bileþen hesaplanacak?
%
%veri1: harmonik bileþenin etkin deðeri
%veri2: harmonik bileþenin açýsý
%
%NaN düzenlemesi yapýldý; böylece çýkýþ verisi ham veri ile ayný boyuta
%sahip olacak, birlikte grafik ekranýnda çizidirilebilecek. 12.01.2017 
%fazorel6'dan türetildi. Açý hatalý hesaplanýyordu, düzeltildi. 24.09.2017

omega=2*pi*f;
deltat=(1/f)/N;
teta=omega*deltat;

for p=1:length(giris1)
    veri1(p)=NaN;
    veri2(p)=NaN;
    if p>=N
        veri1(p)=0;    
        for k=0:N-1                
            veri1(p)=veri1(p)+giris1(p+k-N+1)*exp(-i*k*h*teta);
        end        
        veri2(p)=angle(veri1(p)*exp(i*pi/2));%sin için açý;
        veri1(p)=abs((sqrt(2)/N)*veri1(p));
    end
end

end