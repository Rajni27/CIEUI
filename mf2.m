function [ r g b ] = mf2( x,y,z,sigma)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 lx=exp(-(double(x) )^2/(2*sigma^2));
 hx= exp(-(double(x) - 255)^2/(2*sigma^2));
% lx=gaussmf(x,[50,0]);
% hx=gaussmf(x,[50,255]);
 ly=exp(-(double(y))^2/(2*sigma^2));
 hy= exp(-(double(y) - 255)^2/(2*sigma^2));
% ly=gaussmf(y,[50,0]);
% hy=gaussmf(y,[50,255]);
 lz=exp(-(double(z) )^2/(2*sigma^2));
 hz= exp(-(double(z) - 255)^2/(2*sigma^2));
% lz=gaussmf(z,[50,0]);
% hz=gaussmf(z,[50,255]);


if(lx>=hx)
    r=1;
else
    r=2;
end
if(ly>=hy)
    g=1;
else
    g=2;
end
if(lz>=hz)
    b=1;
else
    b=2;
end

end

