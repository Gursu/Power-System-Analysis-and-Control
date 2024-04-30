function kay = guc1(x, y)
% function kay = guc1(x, y)
% x: Bara-2'ye bağlı generatörün aktif güç çıkışı (pu)
% y: Bara-2'ye bağlı generatörün çıkış gerilimi genliği (pu)

konum='IEEE14bara.txt';
dosya_oku2;

% Optimizasyon problemindeki kontrol parametrelerinin tanımlanması
Psch(2) = x - 0.217;
V(2) = y;

gucaksIEEE14;

end