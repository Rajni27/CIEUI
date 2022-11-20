function [ hs ] = HistoSpread( img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n,o]=size(img);
hist = zeros(256,o);
for j = 1:o
    for i = 1:256
        ind = find(img(:,:,j)==(i-1));
        
        if isempty(ind)
            hist(i,j) = 0;
        else
            s=size(ind);
            hist(i,j) = s(1);
        end
        if i>1
            hist(i,j) = hist(i,j)+hist(i-1,j);
        end
    end

    hist(:,j) = (hist(:,j)*100)/(m*n);

    x1 = abs(hist(:,j)-25);
    [x,in] = min(x1);
    x2 = abs(hist(:,j)-75);
    [x,ind] = min(x2);
    IQR(j) = abs(in - ind);
    R(j) = max(max(img(:,:,j)))- min(min(img(:,:,j)));
end
hs = sum(IQR)/sum(R);
end

