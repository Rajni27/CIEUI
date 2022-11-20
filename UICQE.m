function [metric] = UICQE(img)
colorTransform = makecform('srgb2lab');
lab = applycform(img, colorTransform);
lab = im2double(lab);

cp = sqrt(lab(:,:,2).^2 + lab(:,:,3).^2); 
sp = cp./(0.0001 + lab(:,:,1));

means = mean(mean(sp));%% mean of saturation
meanc = mean(mean(cp));
[m,n] = size(cp);
sigmac = 0;
for i = 1:m
    for j = 1:n
        sigmac = sigmac + (cp(i,j)^2 - meanc^2);
    end
end

sigmac = sqrt(sigmac/(m*n)); %% standard deviation of chroma

%% contrast of luminance
array = reshape(lab(:,:,1),m*n,1);
sorted = sort(array);
l = ceil(.1*m*n);
firstn = sorted(1:l);
lastn = sorted(((m*n)-l+1):(m*n));
diff = lastn-firstn;
conl = mean(diff);
c1= 0.468;
c2= 0.2745;
c3=0.2576;
metric = (c1*sigmac)+(c2*conl)+(c3*means);
end