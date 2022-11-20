function [UICM] = UW_Performance(img)
[m,n,~] = size(img);
% img = im2double(im);
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
RG = double(R)-double(G);
YB = double((R+G)/2) - double(B);
k =m*n;
talphal = 0.1;
talphah = 0.1;
TalphaL = ceil(k * talphal);
TalphaH = floor(k* talphah);
alpha_meanRG = 0;
alphaRG= reshape(RG,[k,1]);
alphaRG = sort(alphaRG);
for i = (1+TalphaL):(k-TalphaH)
    alpha_meanRG = alpha_meanRG + double(alphaRG(i));
end
alpha_meanRG = alpha_meanRG/(k-talphal-talphah);
alpha_varianceRG = 0;
for i = 1:n
   alpha_varianceRG = alpha_varianceRG + double(RG(i)-alpha_meanRG)^2;
end
alpha_varianceRG = alpha_varianceRG/n;
alpha_meanYB = 0;
alphaYB= reshape(YB,[k,1]);
alphaYB = sort(alphaYB);
for i = (1+TalphaL):(k-TalphaH)
    alpha_meanYB = alpha_meanYB + double(alphaYB(i));
end
alpha_meanYB = alpha_meanYB/(k-talphal-talphah);

alpha_varianceYB = 0 ;
for i =1:n
    alpha_varianceYB = alpha_varianceYB + double(YB(i)-alpha_meanYB)^2;
end
alpha_varianceYB = alpha_varianceYB/n;
UICM = -0.0268 * sqrt(alpha_meanRG^2+alpha_meanYB^2) + 0.1586 * sqrt(alpha_varianceYB+alpha_varianceRG);
end