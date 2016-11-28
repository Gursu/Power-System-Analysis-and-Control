%Dosyayý okumak üzere aç.
[dosya,ileti]=fopen(konum,'r');
%Dosyayý satýr satýr okuyabilmek için <satir> isminde bir deðiþken
%tanýmlanýyor.
satir=1;
bosluklar=0;
devam=1;%Dosya okuma kýlavuzu
sayac=0;
sayac2=0;
while devam==1 %Dosyanýn en sonuna gelmediðim sürece    
    clear satir;
    satir=fgetl(dosya);%Satýr okunuyor.
    genislik=size(satir,2);
    %satir    
    if satir==-1
        devam=0;
    else %dosyanýn sonuna henüz gelmediysem
        sayac=sayac+1;        
        if sayac==1
            fseek(dosya,0,'bof');            
            n=str2num(fread(dosya,genislik,'*char')');
            R(n,n)=0; X(n,n)=0; Y(n,n)=0; B(n,n)=0; ypq2(n,n)=0;
            fseek(dosya,2,'cof');            
        else
            if genislik==0 sayac2=sayac2+1; end
            if sayac2==0
        clear bosluklar;
        bosluklar(1)=0; bosluklar(1,2:5)=find(satir==' ');
        fseek(dosya,-genislik-2,'cof');
        %
        bara1=fread(dosya,bosluklar(2)-bosluklar(1)-1,'*char'); %1. bara bilgisi okunuyor; bara1 deðiþkenine atanýyor.
        bara1=str2num(bara1');
        fseek(dosya,1,'cof');%boþluðu atla.
        %
        bara2=fread(dosya,bosluklar(3)-bosluklar(2)-1,'*char'); %2. bara bilgisi okunuyor; bara2 deðiþkenine atanýyor.
        bara2=str2num(bara2');
        fseek(dosya,1,'cof');%boþluðu atla.
        %
        deger=fread(dosya,bosluklar(4)-bosluklar(3)-1,'*char'); %R deðeri okunuyor.        
        deger=str2num(deger');
        R(bara1,bara2)=deger;
        fseek(dosya,1,'cof');%boþluðu atla.
        %
        deger=fread(dosya,bosluklar(5)-bosluklar(4)-1,'*char'); %X deðeri okunuyor.
        deger=str2num(deger');
        X(bara1,bara2)=deger;
        fseek(dosya,1,'cof');%boþluðu atla.
        %
        deger=fread(dosya,genislik+2-bosluklar(5)-1,'*char'); %B deðeri okunuyor.
        deger=str2num(deger');
        B(bara1,bara2)=deger;
        fseek(dosya,1,'cof');
            else if genislik>0
                %Güç deðerleri okunacak.
                %fseek(dosya,1,'cof');
                clear bosluklar;
                bosluklar(1)=0; bosluklar(1,2:6)=find(satir==' ');
                fseek(dosya,-genislik-2,'cof');
                %
                deger=fread(dosya,bosluklar(2)-bosluklar(1)-1,'*char');
                deger=str2num(deger');
                fseek(dosya,1,'cof');%boþluðu atla.
                %
                deger2=fread(dosya,bosluklar(3)-bosluklar(2)-1,'*char');
                deger2=str2num(deger2');
                bara(deger)=deger2;
                fseek(dosya,1,'cof');%boþluðu atla.
                %
                deger3=fread(dosya,bosluklar(4)-bosluklar(3)-1,'*char');
                deger3=str2num(deger3');
                V(deger)=deger3;
                fseek(dosya,1,'cof');%boþluðu atla.
                %
                deger3=fread(dosya,bosluklar(5)-bosluklar(4)-1,'*char');
                deger3=str2num(deger3');
                delta(deger)=deger3;
                fseek(dosya,1,'cof');%boþluðu atla.               
                %
                deger3=fread(dosya,bosluklar(6)-bosluklar(5)-1,'*char');
                deger3=str2num(deger3');
                Psch(1,deger)=deger3;
                fseek(dosya,1,'cof');%boþluðu atla.
                %
                deger3=fread(dosya,genislik+2-bosluklar(6)-1,'*char');
                deger3=str2num(deger3');
                Qsch(1,deger)=deger3;
                fseek(dosya,1,'cof');%boþluðu atla.               
                end
            end
        end
    end    
end
fclose(dosya);