function [veri1,veri2]=fazorel7(giris1,f,N,h)
%function [veri1,veri2]=fazorel7(giris1,f,N,h)
%
%giris1: harmonik bile�en de�eri hesaplanmak istenen de�i�ken (gerilim, ak�m,..vs.)
%f: frekans
%N: bir periyottaki �rnek say�s�
%h: Ka��nc� harmonik bile�en hesaplanacak?
%
%veri1: harmonik bile�enin etkin de�eri
%veri2: harmonik bile�enin a��s�
%
%NaN d�zenlemesi yap�ld�; b�ylece ��k�� verisi ham veri ile ayn� boyuta
%sahip olacak, birlikte grafik ekran�nda �izidirilebilecek. 12.01.2017 
%fazorel6'dan t�retildi. A�� hatal� hesaplan�yordu, d�zeltildi. 24.09.2017

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
        veri2(p)=angle(veri1(p)*exp(i*pi/2));%sin i�in a��;
        veri1(p)=abs((sqrt(2)/N)*veri1(p));
    end
end

end