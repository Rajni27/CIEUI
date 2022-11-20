function [ diff ] = Difference( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
R = mean(mean(img(:,:,1)));
G = mean(mean(img(:,:,2)));
B = mean(mean(img(:,:,3)));

M = (R+G+B)/3;

diff = max(max(abs(R-M),abs(G-M)),abs(B-M));

end

