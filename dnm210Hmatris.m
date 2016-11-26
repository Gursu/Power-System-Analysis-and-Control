%Ibrahim Gursu Tekdemir, 2016
%H matrisinin üretilmesi
%H=[H1a,H1b;H2a,H2b;H3a,H3b;H4a,H4b;H5a,H5b]; yapýsýnda olacak.
H1a=[];%H1a: E ölçümlerinin delta (açý) deðerlerine göre türevleri
H1b=[];%H1b: E ölçümlerinin |V| (gerilim genliði) deðerlerine göre türevleri
H2a=[];%H2a: P ölçümlerinin delta (açý) deðerlerine göre türevleri
H2b=[];%H2b: P ölçümlerinin |V| (gerilim genliði) deðerlerine göre türevleri
H3a=[];%H3a: Q ölçümlerinin delta (açý) deðerlerine göre türevleri
H3b=[];%H3b: Q ölçümlerinin |V| (gerilim genliði) deðerlerine göre türevleri
H4a=[];%H4a: Pij ölçümlerinin delta (açý) deðerlerine göre türevleri
H4b=[];%H4b: Pij ölçümlerinin |V| (gerilim genliði) deðerlerine göre türevleri
H5a=[];%H5a: Qij ölçümlerinin delta (açý) deðerlerine göre türevleri
H5b=[];%H5b: Qij ölçümlerinin |V| (gerilim genliði) deðerlerine göre türevleri

zsay=0;
zif=[];

%H1a
for p=1:size(E,1)
    zsay=zsay+1;    
    k1=E(p,2);
    
    zif(zsay,1)=E(p,1)-V(k1);
    
    for q=2:N
        H1a(p,q)=0;        
    end
end
if size(H1a,1)>0
    H1a=H1a(:,2:N);
end

%H1b
for p=1:size(E,1)    
    k1=E(p,2);
    for q=1:N
        if q==k1
            H1b(p,q)=1;
        else
            H1b(p,q)=0;
        end
    end
end

%H2a
for p=1:size(P,1)
    zsay=zsay+1;
    k1=P(p,2);
    
    zif(zsay,1)=P(p,1)-abs(V(k1))*abs(V(k1))*G(k1,k1);
    for n=1:N
        if n~=k1
            zif(zsay,1)=zif(zsay,1)-abs(V(k1)*V(n)*Ybara(k1,n))*cos(teta(k1,n)+delta(n)-delta(k1));            
        end        
    end    
    
    for q=2:N
        if q==k1
            %i-i
            H2a(p,q)=0;
            for n=1:N
                if n~=k1 
                    H2a(p,q)=H2a(p,q)+abs(V(k1)*V(n)*Ybara(k1,n))*sin(teta(k1,n)+delta(n)-delta(k1));
                end
            end
        else
            %i-j
            H2a(p,q)=-abs(V(k1)*V(q)*Ybara(k1,q))*sin(teta(k1,q)+delta(q)-delta(k1));
        end        
    end
end
if size(H2a,1)>0
    H2a=H2a(:,2:N);
end

%H2b
for p=1:size(P,1)
    k1=P(p,2);
    for q=1:N
        if q==k1
            %i-i
            H2b(p,q)=2*abs(V(k1))*G(k1,k1);
            for n=1:N
                if n~=k1
                    H2b(p,q)=H2b(p,q)+abs(V(n)*Ybara(k1,n))*cos(teta(k1,n)+delta(n)-delta(k1));
                end                
            end
        else
            %i-j
            H2b(p,q)=abs(V(k1)*Ybara(k1,q))*cos(teta(k1,q)+delta(q)-delta(k1));
        end
    end
end

%H3a
for p=1:size(Q,1)
    zsay=zsay+1;    
    k1=Q(p,2);    
    
    zif(zsay,1)=Q(p,1)+abs(V(k1))*abs(V(k1))*B(k1,k1);
    for n=1:N
        if n~=k1
            zif(zsay,1)=zif(zsay,1)+abs(V(k1)*V(n)*Ybara(k1,n))*sin(teta(k1,n)+delta(n)-delta(k1));            
        end        
    end   
    
    for q=2:N
        if q==k1
            %i-i
            H3a(p,q)=0;
            for n=1:N
                if n~=k1 
                    H3a(p,q)=H3a(p,q)+abs(V(k1)*V(n)*Ybara(k1,n))*cos(teta(k1,n)+delta(n)-delta(k1));
                end
            end
        else
            %i-j
            H3a(p,q)=-abs(V(k1)*V(q)*Ybara(k1,q))*cos(teta(k1,q)+delta(q)-delta(k1));
        end        
    end
end
if size(H3a,1)>0
    H3a=H3a(:,2:N);
end

%H3b
for p=1:size(Q,1)
    k1=Q(p,2);
    for q=1:N
        if q==k1
            %i-i
            H3b(p,q)=-2*abs(V(k1))*B(k1,k1);
            for n=1:N
                if n~=k1
                    H3b(p,q)=H3b(p,q)-abs(V(n)*Ybara(k1,n))*sin(teta(k1,n)+delta(n)-delta(k1));
                end                
            end
        else
            %i-j
            H3b(p,q)=-abs(V(k1)*Ybara(k1,q))*sin(teta(k1,q)+delta(q)-delta(k1));
        end
    end
end

%H4a
for p=1:size(Pij,1)
    zsay=zsay+1;    
    k1=Pij(p,2);
    k2=Pij(p,3);
    
    zif(zsay,1)=Pij(p,1)-(-abs(V(k1))*abs(V(k1))*G(k1,k2)+abs(V(k1)*V(k2)*Ybara(k1,k2))*cos(teta(k1,k2)+delta(k2)-delta(k1)));   
    
    for q=2:N
        if q==k1
            %i-i
            H4a(p,q)=abs(V(k1)*V(k2)*Ybara(k1,k2))*sin(teta(k1,k2)+delta(k2)-delta(k1));
        else if q==k2
                %i-j
                H4a(p,q)=-abs(V(k1)*V(k2)*Ybara(k1,k2))*sin(teta(k1,k2)+delta(k2)-delta(k1));
            else
                H4a(p,q)=0;
            end
        end        
    end
end
if size(H4a,1)>0
    H4a=H4a(:,2:N);
end
    
%H4b
for p=1:size(Pij,1)
    k1=Pij(p,2);
    k2=Pij(p,3);
    for q=1:N
        if q==k1
            %i-i
            H4b(p,q)=-2*abs(V(k1))*G(k1,k2)+abs(V(k2)*Ybara(k1,k2))*cos(teta(k1,k2)+delta(k2)-delta(k1));
        else if q==k2
                %i-j
                H4b(p,q)=abs(V(k1)*Ybara(k1,k2))*cos(teta(k1,k2)+delta(k2)-delta(k1));
            else
                H4b(p,q)=0;
            end
        end        
    end
end

%H5a
for p=1:size(Qij,1)
    zsay=zsay+1;    
    k1=Qij(p,2);
    k2=Qij(p,3);
    
    zif(zsay,1)=Qij(p,1)-(-abs(V(k1))*abs(V(k1))*(Bkacak(k1,k2)/2-B(k1,k2))-abs(V(k1)*V(k2)*Ybara(k1,k2))*sin(teta(k1,k2)+delta(k2)-delta(k1)));   
    
    for q=2:N
        if q==k1
            %i-i
            H5a(p,q)=abs(V(k1)*V(k2)*Ybara(k1,k2))*cos(teta(k1,k2)+delta(k2)-delta(k1));
        else if q==k2
                %i-j
                H5a(p,q)=-abs(V(k1)*V(k2)*Ybara(k1,k2))*cos(teta(k1,k2)+delta(k2)-delta(k1));
            else
                H5a(p,q)=0;                
            end
        end        
    end
end
if size(H5a,1)>0
    H5a=H5a(:,2:N);
end
    
%H5b
for p=1:size(Qij,1)
    k1=Qij(p,2);
    k2=Qij(p,3);
    for q=1:N
        if q==k1
            %i-i
            H5b(p,q)=-2*abs(V(k1))*(Bkacak(k1,k2)/2-B(k1,k2))-abs(V(k2)*Ybara(k1,k2))*sin(teta(k1,k2)+delta(k2)-delta(k1));
        else if q==k2
                %i-j
                H5b(p,q)=-abs(V(k1)*Ybara(k1,k2))*sin(teta(k1,k2)+delta(k2)-delta(k1));
            else
                H5b(p,q)=0;
            end
        end        
    end
end

H=[H1a,H1b;H2a,H2b;H3a,H3b;H4a,H4b;H5a,H5b];
