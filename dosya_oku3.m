function [Ybara,ypq2]=dosya_oku3(konum)
dosya_oku2;

Z=R+X*i; 
ypq2=0.5i*B;

yontem=0;%tr matrisinin Y bara matrisine nas�l eklemlenece�ini bildiren parametre. E�er kademe de�i�tirici trafo yoksa yontem=0; kullan�lmal�.

%Ybara matrisini olu�turmak i�in 1.d�ng�
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

%Ybara matrisini olu�turmak i�in 2.d�ng�
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
    %1.Y�NTEM (t)
    for p=1:size(tr,1)
        Y(tr(p,2),tr(p,2))=Y(tr(p,2),tr(p,2))+(abs(tr(p,1))^2)*tr(p,4);
        Y(tr(p,2),tr(p,3))=Y(tr(p,2),tr(p,3))-(real(tr(p,1))-imag(tr(p,1))*i)*tr(p,4);
        Y(tr(p,3),tr(p,2))=Y(tr(p,3),tr(p,2))-(tr(p,1))*tr(p,4);
        Y(tr(p,3),tr(p,3))=Y(tr(p,3),tr(p,3))+tr(p,4);
    end
else
    if yontem~=0
        %2.Y�NTEM (a)
        for p=1:size(tr,1)
            Y(tr(p,2),tr(p,2))=Y(tr(p,2),tr(p,2))+tr(p,4);
            Y(tr(p,2),tr(p,3))=Y(tr(p,2),tr(p,3))-tr(p,4)/(tr(p,1));
            Y(tr(p,3),tr(p,2))=Y(tr(p,3),tr(p,2))-tr(p,4)/(real(tr(p,1))-imag(tr(p,1))*i);
            Y(tr(p,3),tr(p,3))=Y(tr(p,3),tr(p,3))+tr(p,4)/(abs(tr(p,1))^2);
        end
    end
end

%Kapasit�r eklentisi olursa eklenecek...

Ybara=Y;
end