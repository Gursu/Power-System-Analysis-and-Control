function m2pca_cizim(R,G,B,kesme)
%function m2pca_cizim(R,G,B,kesme)
%
%R: Principle Component - 1 (PC1)
%G: Principle Component - 2 (PC2)
%B: Principle Component - 3 (PC3)
%
%kesme: number of rows (number of columns will be determined by the function according to 'kesme' and the length of data)

uzunluk=length(R);

Rbaz=min(R);
Gbaz=min(G);
Bbaz=min(B);

Rgen=max(R)-min(R);
Ggen=max(G)-min(G);
Bgen=max(B)-min(B);

R=round(255*(R-Rbaz)/Rgen);
G=round(255*(G-Gbaz)/Ggen);
B=round(255*(B-Bbaz)/Bgen);

[dosya,ileti]=fopen('PCA_cizim.html','w');

fprintf(dosya,'<html>\n');
fprintf(dosya,'<head>\n');
fprintf(dosya,'<title>PCA Çizim</title>\n');
fprintf(dosya,'<script>\n');
fprintf(dosya,'function basla()\n');
fprintf(dosya,'{\n');
fprintf(dosya,'	canvas=document.getElementById("test");\n');
fprintf(dosya,'	ctx=canvas.getContext("2d");\n');
fprintf(dosya,'	\n');

sayac=0;
for p=1:kesme
	for q=1:round(uzunluk/kesme)
		sayac=sayac+1;		
		%Daire
		fprintf(dosya,'	ctx.beginPath();\n');
		fprintf(dosya,'	ctx.fillStyle="rgb(%g,%g,%g)";\n',R(sayac),G(sayac),B(sayac));
		ekX=80+(q-1)*60;
		ekY=80+(p-1)*60;
		fprintf(dosya,'	ctx.arc(%g,%g,25,0,2*Math.PI,true);\n',ekX,ekY);
		fprintf(dosya,'	ctx.fill();\n');
		fprintf(dosya,'	ctx.closePath();\n');
	end
end

fprintf(dosya,'}\n');
fprintf(dosya,'</script>\n');
fprintf(dosya,'</head>\n');
fprintf(dosya,'<body onload="basla();">\n');
fprintf(dosya,'<canvas id="test" width="%g" height="%g"></canvas>\n',80*2+60*(round(uzunluk/kesme)-1),80*2+60*(kesme-1));
fprintf(dosya,'</body>\n');
fprintf(dosya,'</html>\n');

fclose(dosya);

%Daire
%fprintf(dosya,'	ctx.beginPath();\n');
%fprintf(dosya,'	ctx.fillStyle="rgb(255,155,100)";\n');
%fprintf(dosya,'	ctx.arc(140,80,25,0,2*Math.PI,true);\n');
%fprintf(dosya,'	ctx.fill();\n');
%fprintf(dosya,'	ctx.closePath();\n');

%Daire
%fprintf(dosya,'	ctx.beginPath();\n');
%fprintf(dosya,'	ctx.fillStyle="rgb(255,155,100)";\n');
%fprintf(dosya,'	ctx.arc(80,140,25,0,2*Math.PI,true);\n');
%fprintf(dosya,'	ctx.fill();\n');
%fprintf(dosya,'	ctx.closePath();\n');

%Daire
%fprintf(dosya,'	ctx.beginPath();\n');
%fprintf(dosya,'	ctx.fillStyle="rgb(255,155,100)";\n');
%fprintf(dosya,'	ctx.arc(140,140,25,0,2*Math.PI,true);\n');
%fprintf(dosya,'	ctx.fill();\n');
%fprintf(dosya,'	ctx.closePath();\n');

end
