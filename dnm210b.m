function [Vgenlik,Vacid,dene]=dnm210b(skonum,yontem)
%function [Vgenlik,Vacid,dene]=dnm210b(skonum,yontem)
%
%Vgenlik: Durum kestirimi sonrasında elde edilen gerilim genlik değeri (pu)
%Vaci: Durum kestirimi sonrasında elde edilen gerilim açı değeri (radyan)
%
%skonum: Aşağıdaki ölçüm değerlerinin kaydedildiği .mat dosyasının konumu
%konum: Değerleri okunacak olan sistemin txt dosyasının konumu
%('sistem_elm.txt' gibi)
%E: Kestirim öncesi bilinen gerilim genlik ölçümü değerleri (pu)
%P: Kestirim öncesi bilinen bara aktif güç ölçümü değerleri (pu)
%Q: Kestirim öncesi bilinen bara reaktif güç ölçümü değerleri (pu)
%Pij: Kestirim öncesi bilinen hat aktif güç akışı ölçümü değerleri (pu)
%Qij: Kestirim öncesi bilinen hat reaktif güç akışı ölçümü değerleri (pu)
%Rx: Sırasıyla E, P, Q, Pij, Qij ölçümlerini yapan cihazların standart sapma
%değerleri (Rx=[0.01,0.02,0.001]; %3 ölçüm için örnek bir Rx vektörü)
%
%ör1: E=[1 1;1.02 3]; %1. baranın ve 3. baranın gerilim genliği ölçümleri sırasıyla 1pu ve 1.02 pu değerindedir.
%
%ör2: P=[2.4 4;-3.2 5]; %4. baranın aktif güç ölçümü 2.4pu, 5. baranın
%aktif güç ölçümü -3.2pu değerindedir. (Q değişkeni de aynı yapıdadır.)
%
%ör3: Pij=[1.2 1 5;-1.1 5 1]; %1. baradan 5. baraya aktif güç ölçümü 1.2pu,
%5. baradan 1. baraya aktif güç ölçümü -1.1pu değerindedir. (Qij değişkeni de aynı yapıdadır.)
%
%İbrahim Gürsu Tekdemir, 2016

load(skonum);

%Yakınsama çözünürlüğü
hata=0.001;

%dx hesabına ilişkin yöntem seçimi
%yontem=1;

%Ybara matrisi, uygun txt dosyasından okunarak üretilecek.
[Ybara,ypq2]=dosya_oku3(konum);
Bkacak=abs(ypq2)*2;

%G,B ve teta'ların Ybara'ya göre hesaplanması
G=real(Ybara);
B=imag(Ybara);
teta=atan2(B,G);

%Bara sayısı
N=length(Ybara);

%Toplam ölçüm sayısı
Nm=size(E,1)+size(P,1)+size(Q,1)+size(Pij,1)+size(Qij,1);

%R matrisinin üretilmesi
for p=1:Nm
    R(p,p)=1/((Rx(p))^2);
end

%Durumlar için başlangıç değerlerinin üretilmesi (initialization of states)
for p=1:N
    delta1(p)=0;
    V1(p)=1;
end

dene=1;
dongu=1;
while dongu==1
    %H matrisinde kullanılacak değerlerin elde edilmesi
    delta(1)=0;
    for n=2:N
        delta(n)=delta1(dene,n);        
    end
    for n=1:N        
        V(n)=V1(dene,n);
    end
    
    %H matrisinin hesaplanması
    dnm210Hmatris;
        
    %dx vektörünün elde edilmesi
    if yontem==1
        Ga=H'*(R\H);
        dx=Ga\(H'*(R\zif));
    else if yontem==2
            Ga=H'*inv(R)*H;
            %Yedek=inv(Ga)*H'*inv(R)*zif;
            %dx=Ga\(H'*inv(R)*zif);
            [ALT,UST,PER]=lu(Ga);
            u=H'*inv(R)*zif;
            u=PER*u;
            
            px=size(ALT,1);
            qx=size(ALT,2);
            
            py=size(UST,1);
            qy=size(UST,2);
            
            for p=1:px
                sayac=0;
                for q=1:qx
                    if p==q t(p,1)=(u(p,1)-sayac)/ALT(p,q);
                    else if ALT(p,q)==0 b=1;
                        else sayac=sayac+ALT(p,q)*t(q,1);
                        end
                    end
                end
            end
            
            sat=py+1;
            sut=qy+1;
            for p=1:py
                sayac=0;
                sat=sat-1;
                sut=qy+1;
                for q=1:qy
                    sut=sut-1;
                    if sat==sut 
                        %if UST(sat,sut)==0 dx(sat,1)=0; 
                        %else
                        dx(sat,1)=(t(sat,1)-sayac)/UST(sat,sut); 
                        %end
                    else if UST(sat,sut)==0 b=1;
                        else sayac=sayac+UST(sat,sut)*dx(sut,1);
                        end
                    end
                end
            end           
        end
    end
    
    sayac=0;
    delta1(dene+1,1)=0;
    for n=2:N
        sayac=sayac+1;
        delta1(dene+1,n)=delta1(dene,n)+dx(sayac);       
    end
    for n=1:N
        sayac=sayac+1;
        V1(dene+1,n)=V1(dene,n)+dx(sayac);       
    end
       
    enbuyuk=abs(dx(1,1));
    for n=1:(2*N-1)
        if abs(dx(n,1))>enbuyuk
            enbuyuk=abs(dx(n,1));
        end
    end
    if enbuyuk<hata || dene>50
        dongu=0;
    else
        dene=dene+1;
    end    
end

Vgenlik=V1(size(V1,1),:);
Vacid=delta1(size(delta1,1),:)*180/pi;

end
