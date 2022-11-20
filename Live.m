function [z,img3] =Live(c,img)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[m, n , ~]=size(img);
red=img(:,:,1);
green=img(:,:,2);
blue=img(:,:,3);
R=mean(mean(red));
G=mean(mean(green));
B=mean(mean(blue));


rule=zeros(6,1);
for i=1:m
    for j=1:n
        [r, g, b]=mf2(red(i,j),green(i,j),blue(i,j),35);
        if( r== 1 && g==1 && b==2)
            rule(1)=rule(1)+1;
        end
        if( r== 1 && g==2 && b==1)
            rule(2)=rule(2)+1;
        end
        if( r== 2 && g==1 && b==1)
            rule(3)=rule(3)+1;
        end
        if( r== 1 && g==2 && b==2)
            rule(4)=rule(4)+1;
        end
        if( r== 2 && g==1 && b==2)
            rule(5)=rule(5)+1;
        end
        if( r== 2 && g==2 && b==1)
            rule(6)=rule(6)+1;
        end
    end
end

[~,I]=max(rule);

if I==1
      base=B;
      ralpha=base/R;
      galpha=base/G;
      balpha=base/B;  
end

if I==2
      base=G;
      ralpha=base/R;
      galpha=base/G;
      balpha=base/B;
end

if I==3
      base=R;
      ralpha=base/R;
      galpha=base/G;
      balpha=base/B;
end

if I==4
    base=(G+B)/2;
      ralpha=base/R;
      galpha=base/G;
      balpha=base/B;
end

if I==5
    base=(R+B)/2;
      ralpha=base/R;
      galpha=base/G;
      balpha=base/B;
end

if I==6
    base=(R+G)/2;
      ralpha=base/R;
      galpha=base/G;
      balpha=base/B;
end

img3(:,:,1)=(ralpha^c(1))*red(:,:);
img3(:,:,2)=(galpha^c(2))*green(:,:);
img3(:,:,3)=(balpha^c(3))*blue(:,:);

per = Entropy(img3);
HS = HistoSpread(img3);
diff = Difference(img3);
UI = UICQE(im2uint8(img3));
z = [per
    diff
    HS
    UI];
end


