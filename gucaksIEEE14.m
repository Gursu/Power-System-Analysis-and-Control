%GÜÇ AKIŞI programı
%guc_gursu3: Matris tersi için LU faktorizasyon kullanılıyor.
%guc_gursu4: Önceki programa kademe değiştirici (tap changer) ayarı da eklenmiş durumda.
k=1;
Sbaz=100;
hata=0.001;%hata; çözüm hassasiyeti
%Sistem değişkenleri okunacak.
%Hat değişkenleri-ilk durum
%DOSYAYI OKUMA
%Okunacak dosyanın konumu girilecek.
%dosya_oku2;
%Veri düzenleme/hesaplama
Z=R+X*i; ypq2=0.5i*B;

%tr=[1/t bara1 bara2 Y]
%dönüştürme oranı= 1:t (bara1:bara2)
yontem=1;%tr matrisinin Y bara matrisine nasıl eklemleneceğini bildiren parametre. Eğer kademe değiştirici trafo yoksa yontem=0; kullanılmalı.

%Stevenson'un "Power System Analysis" kitabındaki 9.14 örneği için kademe
%değiştirici verisi. (Program çalıştırılmadan önce
%konum='sistem_9_14_Stevenson.txt'; komutu kullanılmalı.)
%tr=[1/0.975 2 3 1/0.04i];

%IEEE-14 baralı test sistemi için kademe değiştirici verisi. (Program çalıştırılmadan önce konum='sistem2x.txt'; komutu kullanılmalı.)
tr=[1/0.978 4 7 1/0.20912i;1/0.969 4 9 1/0.55618i;1/0.932 5 6 1/0.25202i];

%68 baralı test sistemi için kademe değiştirici verisi. (Program çalıştırılmadan önce konum='bara68guc.txt'; komutu kullanılmalı.)
%tr=[0.975609756097561 + 0.00000000000000i,2.00000000000000 + 0.00000000000000i,53.0000000000000 + 0.00000000000000i,0.00000000000000 - 110.497237569061i;0.934579439252336 + 0.00000000000000i,6.00000000000000 + 0.00000000000000i,54.0000000000000 + 0.00000000000000i,0.00000000000000 - 40.0000000000000i;0.934579439252336 + 0.00000000000000i,10.0000000000000 + 0.00000000000000i,55.0000000000000 + 0.00000000000000i,0.00000000000000 - 50.0000000000000i;0.943396226415094 + 0.00000000000000i,12.0000000000000 + 0.00000000000000i,11.0000000000000 + 0.00000000000000i,0.844411840765037 - 22.9574469207995i;0.943396226415094 + 0.00000000000000i,12.0000000000000 + 0.00000000000000i,13.0000000000000 + 0.00000000000000i,0.844411840765037 - 22.9574469207995i;0.943396226415094 + 0.00000000000000i,19.0000000000000 + 0.00000000000000i,20.0000000000000 + 0.00000000000000i,3.66626512334363 - 72.2777981459173i;0.934579439252336 + 0.00000000000000i,19.0000000000000 + 0.00000000000000i,56.0000000000000 + 0.00000000000000i,3.46311779547816 - 70.2518181368426i;0.991080277502478 + 0.00000000000000i,20.0000000000000 + 0.00000000000000i,57.0000000000000 + 0.00000000000000i,2.77085065114990 - 55.4170130229981i;0.975609756097561 + 0.00000000000000i,22.0000000000000 + 0.00000000000000i,58.0000000000000 + 0.00000000000000i,0.00000000000000 - 69.9300699300699i;0.975609756097561 + 0.00000000000000i,25.0000000000000 + 0.00000000000000i,60.0000000000000 + 0.00000000000000i,1.11399925733383 - 43.0746379502414i;0.975609756097561 + 0.00000000000000i,29.0000000000000 + 0.00000000000000i,61.0000000000000 + 0.00000000000000i,3.27868852459016 - 63.9344262295082i;1.05708245243129 + 0.00000000000000i,35.0000000000000 + 0.00000000000000i,34.0000000000000 + 0.00000000000000i,1.82581705313128 - 135.110461931714i;0.961538461538462 + 0.00000000000000i,31.0000000000000 + 0.00000000000000i,62.0000000000000 + 0.00000000000000i,0.00000000000000 - 38.4615384615385i;0.961538461538462 + 0.00000000000000i,32.0000000000000 + 0.00000000000000i,63.0000000000000 + 0.00000000000000i,0.00000000000000 - 76.9230769230769i;0.961538461538462 + 0.00000000000000i,36.0000000000000 + 0.00000000000000i,64.0000000000000 + 0.00000000000000i,0.00000000000000 - 133.333333333333i;0.961538461538462 + 0.00000000000000i,37.0000000000000 + 0.00000000000000i,65.0000000000000 + 0.00000000000000i,0.00000000000000 - 303.030303030303i];
%tr(:,1)=1;

%tr=[0.975609756097561 + 0.00000000000000i,2.00000000000000 + 0.00000000000000i,53.0000000000000 + 0.00000000000000i,0.00000000000000 - 110.497237569061i;0.934579439252336 + 0.00000000000000i,6.00000000000000 + 0.00000000000000i,54.0000000000000 + 0.00000000000000i,0.00000000000000 - 40.0000000000000i;0.934579439252336 + 0.00000000000000i,10.0000000000000 + 0.00000000000000i,55.0000000000000 + 0.00000000000000i,0.00000000000000 - 50.0000000000000i;0.943396226415094 + 0.00000000000000i,12.0000000000000 + 0.00000000000000i,11.0000000000000 + 0.00000000000000i,0.00000000000000 - 22.9885057471264i;0.943396226415094 + 0.00000000000000i,12.0000000000000 + 0.00000000000000i,13.0000000000000 + 0.00000000000000i,0.00000000000000 - 22.9885057471264i;0.943396226415094 + 0.00000000000000i,19.0000000000000 + 0.00000000000000i,20.0000000000000 + 0.00000000000000i,0.00000000000000 - 72.4637681159420i;0.934579439252336 + 0.00000000000000i,19.0000000000000 + 0.00000000000000i,56.0000000000000 + 0.00000000000000i,0.00000000000000 - 70.4225352112676i;0.991080277502478 + 0.00000000000000i,20.0000000000000 + 0.00000000000000i,57.0000000000000 + 0.00000000000000i,0.00000000000000 - 55.5555555555556i;0.975609756097561 + 0.00000000000000i,22.0000000000000 + 0.00000000000000i,58.0000000000000 + 0.00000000000000i,0.00000000000000 - 69.9300699300699i;0.975609756097561 + 0.00000000000000i,25.0000000000000 + 0.00000000000000i,60.0000000000000 + 0.00000000000000i,0.00000000000000 - 43.1034482758621i;0.975609756097561 + 0.00000000000000i,29.0000000000000 + 0.00000000000000i,61.0000000000000 + 0.00000000000000i,0.00000000000000 - 64.1025641025641i;1.05708245243129 + 0.00000000000000i,35.0000000000000 + 0.00000000000000i,34.0000000000000 + 0.00000000000000i,0.00000000000000 - 135.135135135135i;0.961538461538462 + 0.00000000000000i,31.0000000000000 + 0.00000000000000i,62.0000000000000 + 0.00000000000000i,0.00000000000000 - 38.4615384615385i;0.961538461538462 + 0.00000000000000i,32.0000000000000 + 0.00000000000000i,63.0000000000000 + 0.00000000000000i,0.00000000000000 - 76.9230769230769i;0.961538461538462 + 0.00000000000000i,36.0000000000000 + 0.00000000000000i,64.0000000000000 + 0.00000000000000i,0.00000000000000 - 133.333333333333i;0.961538461538462 + 0.00000000000000i,37.0000000000000 + 0.00000000000000i,65.0000000000000 + 0.00000000000000i,0.00000000000000 - 303.030303030303i];
%tr=[1.02500000000000 + 0.00000000000000i,2.00000000000000 + 0.00000000000000i,53.0000000000000 + 0.00000000000000i,0.00000000000000 - 110.497237569061i;1.07000000000000 + 0.00000000000000i,6.00000000000000 + 0.00000000000000i,54.0000000000000 + 0.00000000000000i,0.00000000000000 - 40.0000000000000i;1.07000000000000 + 0.00000000000000i,10.0000000000000 + 0.00000000000000i,55.0000000000000 + 0.00000000000000i,0.00000000000000 - 50.0000000000000i;1.06000000000000 + 0.00000000000000i,12.0000000000000 + 0.00000000000000i,11.0000000000000 + 0.00000000000000i,0.844411840765037 - 22.9574469207995i;1.06000000000000 + 0.00000000000000i,12.0000000000000 + 0.00000000000000i,13.0000000000000 + 0.00000000000000i,0.844411840765037 - 22.9574469207995i;1.06000000000000 + 0.00000000000000i,19.0000000000000 + 0.00000000000000i,20.0000000000000 + 0.00000000000000i,3.66626512334363 - 72.2777981459173i;1.07000000000000 + 0.00000000000000i,19.0000000000000 + 0.00000000000000i,56.0000000000000 + 0.00000000000000i,3.46311779547816 - 70.2518181368426i;1.00900000000000 + 0.00000000000000i,20.0000000000000 + 0.00000000000000i,57.0000000000000 + 0.00000000000000i,2.77085065114990 - 55.4170130229981i;1.02500000000000 + 0.00000000000000i,22.0000000000000 + 0.00000000000000i,58.0000000000000 + 0.00000000000000i,0.00000000000000 - 69.9300699300699i;1.02500000000000 + 0.00000000000000i,25.0000000000000 + 0.00000000000000i,60.0000000000000 + 0.00000000000000i,1.11399925733383 - 43.0746379502414i;1.02500000000000 + 0.00000000000000i,29.0000000000000 + 0.00000000000000i,61.0000000000000 + 0.00000000000000i,3.27868852459016 - 63.9344262295082i;0.946000000000000 + 0.00000000000000i,35.0000000000000 + 0.00000000000000i,34.0000000000000 + 0.00000000000000i,1.82581705313128 - 135.110461931714i;1.04000000000000 + 0.00000000000000i,31.0000000000000 + 0.00000000000000i,62.0000000000000 + 0.00000000000000i,0.00000000000000 - 38.4615384615385i;1.04000000000000 + 0.00000000000000i,32.0000000000000 + 0.00000000000000i,63.0000000000000 + 0.00000000000000i,0.00000000000000 - 76.9230769230769i;1.04000000000000 + 0.00000000000000i,36.0000000000000 + 0.00000000000000i,64.0000000000000 + 0.00000000000000i,0.00000000000000 - 133.333333333333i;1.04000000000000 + 0.00000000000000i,37.0000000000000 + 0.00000000000000i,65.0000000000000 + 0.00000000000000i,0.00000000000000 - 303.030303030303i];

%Ybara matrisini oluşturmak için 1.döngü
for p=1:n
    for q=1:n
        if p==q
            Y(p,q)=0;            
        else if Z(p,q)==0
                Y(p,q)=0;                
            else Y(p,q)=-1/Z(p,q);
            end
            if ypq2(p,q)==0
               ypq2(p,q)=ypq2(q,p);
            end
        end
    end
end

%Ybara matrisini oluşturmak için 2.döngü
for p=1:n
    for q=1:n
        if p==q
            for a=1:n
                if a==p
                    Y(p,q)=Y(p,q);                                        
                else
                    Y(p,q)=Y(p,q)-Y(p,a)+ypq2(p,a);                                        
                end
            end
        else if Y(p,q)==0
                Y(p,q)=Y(q,p);                
            end
        end
    end
end

if yontem==1
    %1.YÖNTEM (t)
    for p=1:size(tr,1)
        Y(tr(p,2),tr(p,2))=Y(tr(p,2),tr(p,2))+(abs(tr(p,1))^2)*tr(p,4);
        Y(tr(p,2),tr(p,3))=Y(tr(p,2),tr(p,3))-(real(tr(p,1))-imag(tr(p,1))*i)*tr(p,4);
        Y(tr(p,3),tr(p,2))=Y(tr(p,3),tr(p,2))-(tr(p,1))*tr(p,4);
        Y(tr(p,3),tr(p,3))=Y(tr(p,3),tr(p,3))+tr(p,4);
    end
else
    if yontem~=0
        %2.YÖNTEM (a)
        for p=1:size(tr,1)
            Y(tr(p,2),tr(p,2))=Y(tr(p,2),tr(p,2))+tr(p,4);
            Y(tr(p,2),tr(p,3))=Y(tr(p,2),tr(p,3))-tr(p,4)/(tr(p,1));
            Y(tr(p,3),tr(p,2))=Y(tr(p,3),tr(p,2))-tr(p,4)/(real(tr(p,1))-imag(tr(p,1))*i);
            Y(tr(p,3),tr(p,3))=Y(tr(p,3),tr(p,3))+tr(p,4)/(abs(tr(p,1))^2);
        end
    end
end

%Kapasitör eklentisi
%Y(9,9)=Y(9,9)+0.19i;%IEEE-14 baralı test sistemi için
%Y(3,3)=Y(3,3)+0.18i;%sistem_9_14_Stevenson için
%Y(4,4)=Y(4,4)+0.15i;%sistem_9_14_Stevenson için

Ybara=Y;

teta(n,n)=0;

%G,B ve teta'ların Ybara'ya göre hesaplanması
G=real(Ybara);
B=imag(Ybara);
teta=atan2(B,G);        

dongu=1;
while dongu==1
    %DPQ'nun bulunması (Psch-Pcal , Qsch-Qcal)
    %1.döngü
    x=0;
    for p=1:n
        if bara(p)==1 P(k,p)=0;
        else
            P(k,p)=(V(k,p)^2)*G(p,p);
            for i=1:n
                if i==p b=1;
                else
                    P(k,p)=P(k,p)+abs(Ybara(p,i)*V(k,p)*V(k,i))*cos(teta(p,i)+delta(k,i)-delta(k,p));
                end
            end
            x=x+1;
            DPQ(x,k)=Psch(1,p)-P(k,p);        
        end
    end
    
    %2.döngü
    for p=1:n        
        if bara(p)==1 Q(k,p)=0;
        else
            if bara(p)==2 Q(k,p)=0;
            else
                Q(k,p)=-(V(k,p)^2)*B(p,p);
                for i=1:n
                    if i==p b=1;
                    else
                        Q(k,p)=Q(k,p)-abs(Ybara(p,i)*V(k,p)*V(k,i))*sin(teta(p,i)+delta(k,i)-delta(k,p));
                    end
                end
                x=x+1;
                DPQ(x,k)=Qsch(1,p)-Q(k,p);            
            end
        end
    end
    
    maks=abs(DPQ(1,k));
    
    for i=1:size(DPQ,1)
        if abs(DPQ(i,k))>maks
            maks=abs(DPQ(i,k));        
        end
    end
    if maks>hata
        %J'nin hesaplanması
        g=0;
        %1.blok
        for p=1:n
            if bara(p)==1 b=1;
            else
                g=g+1;
                h=0;
                %1.bölge
                for q=1:n
                    if bara(q)==1 b=1;
                    else
                        h=h+1;
                        if p==q
                            J(g,h)=0;
                            for i=1:n
                                if i==p b=1;
                                else J(g,h)=J(g,h)+abs(V(k,p)*V(k,i)*Ybara(p,i))*sin(teta(p,i)+delta(k,i)-delta(k,p));
                                end
                            end
                        else
                            J(g,h)=-abs(V(k,p)*V(k,q)*Ybara(p,q))*sin(teta(p,q)+delta(k,q)-delta(k,p));
                        end
                    end
                end
                %2.bölge
                for q=1:n
                    if bara(q)==1 b=1;
                    else if bara(q)==2 b=1;
                        else
                            h=h+1;
                            if p==q
                                J(g,h)=2*(V(k,p)^2)*G(p,p);
                                for i=1:n
                                    if i==p b=1;
                                    else J(g,h)=J(g,h)+abs(V(k,p)*V(k,i)*Ybara(p,i))*cos(teta(p,i)+delta(k,i)-delta(k,p));
                                    end
                                end
                            else
                                J(g,h)=abs(V(k,p)*V(k,q)*Ybara(p,q))*cos(teta(p,q)+delta(k,q)-delta(k,p));
                            end
                        end
                    end
                end
            end
        end
        
        %2.blok
        for p=1:n
            if bara(p)==1 b=1;
            else if bara(p)==2 b=1;
                else
                    g=g+1;
                    h=0;       
                    %1.bölge        
                    for q=1:n            
                        if bara(q)==1 b=1;            
                        else
                            h=h+1;
                            if p==q
                                J(g,h)=0;
                                for i=1:n
                                    if i==p b=1;
                                    else J(g,h)=J(g,h)+abs(V(k,p)*V(k,i)*Ybara(p,i))*cos(teta(p,i)+delta(k,i)-delta(k,p));
                                    end
                                end
                            else
                                J(g,h)=-abs(V(k,p)*V(k,q)*Ybara(p,q))*cos(teta(p,q)+delta(k,q)-delta(k,p));
                            end
                        end
                    end
                    %2.bölge
                    for q=1:n            
                        if bara(q)==1 b=1;            
                        else if bara(q)==2 b=1;                
                            else
                                h=h+1;
                                if p==q
                                    J(g,h)=-2*(V(k,p)^2)*B(p,p);
                                    for i=1:n
                                        if i==p b=1;
                                        else J(g,h)=J(g,h)-abs(V(k,p)*V(k,i)*Ybara(p,i))*sin(teta(p,i)+delta(k,i)-delta(k,p));
                                        end
                                    end
                                else
                                    J(g,h)=-abs(V(k,p)*V(k,q)*Ybara(p,q))*sin(teta(p,q)+delta(k,q)-delta(k,p));
                                end
                            end
                        end
                    end
                end
            end
        end
        %dx hesabı; delta ve V yenileme         
        %dx(:,k)=inv(J)*DPQ(:,k);
        dx(:,k)=J\DPQ(:,k);
               
        for p=1:n
            delta(k+1,p)=delta(k,p);    
            V(k+1,p)=V(k,p);
        end
        x=0;
        for p=1:n
            if bara(p)==1 b=1;
            else
                x=x+1;
                delta(k+1,p)=delta(k,p)+dx(x,k);
            end
        end
        
        for p=1:n
            if bara(p)==1 b=1;
            else if bara(p)==2 b=1;
                else
                    x=x+1;
                    V(k+1,p)=V(k,p)+V(k,p)*dx(x,k);
                end
            end
        end
        
        if k==100
            dongu=0;
        else k=k+1;
        end       
    else
        dongu=0;
    end   
end

Pyuk(n,n)=0;
Qyuk(n,n)=0;

%Güç akışı hesabı
for p=1:n
    for q=1:n
        if p==q b=1;
        else
            if Ybara(p,q)==0 b=1;
            else                         
                Pyuk(p,q)=-(V(k,p)^2)*G(p,q)+abs(V(k,p)*V(k,q)*Ybara(p,q))*cos(teta(p,q)+delta(k,q)-delta(k,p))+(V(k,p)^2)*real(ypq2(p,q));                
                Pyuk(p,q)=Pyuk(p,q)*Sbaz;                          
                Qyuk(p,q)=-((V(k,p)^2)*(-B(p,q))+abs(V(k,p)*V(k,q)*Ybara(p,q))*sin(teta(p,q)+delta(k,q)-delta(k,p)))-(V(k,p)^2)*imag(ypq2(p,q));                
                Qyuk(p,q)=Qyuk(p,q)*Sbaz;
                if bara(p)==1
                    P(k,p)=P(k,p)+Pyuk(p,q)/Sbaz;
                    Q(k,p)=Q(k,p)+Qyuk(p,q)/Sbaz;
                end
                if bara(p)==2                    
                    Q(k,p)=Q(k,p)+Qyuk(p,q)/Sbaz;
                end
            end
        end
    end
end

%Kayıp hesabı
kay=0;
for p=1:n
    for q=1:n
        if Pyuk(p,q)==0 b=1;
        else
            kay=kay+abs(Pyuk(p,q)+Pyuk(q,p));
            kayip(p,q)=abs(Pyuk(p,q)+Pyuk(q,p));
        end
    end
end
kay=kay/2;

%Pyuk
%Qyuk
Pson=Sbaz*P(size(P,1),:);
Qson=Sbaz*Q(size(Q,1),:);
Vson=V(size(V,1),:);
delta=delta*180/pi;
aci_son=delta(size(delta,1),:);
%k
%fprintf('%g\n',Pson(17));
%fprintf('%g\n',Qson(17));
%dosya_yaz;
