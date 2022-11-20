%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA121
% Project Title: Multi-Objective Particle Swarm Optimization (MOPSO)
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%
tic;
mopso;
for i = 1:numel(rep)
    x(i,:) = rep(i).Position;
    [per,img3] = Live(x(i,:),img);
    UICM(i) = UW_Performance(img3);
    str = sprintf('i = %d, UICM = %f,entropy = %f,UI= %f,HS=%f',i,UICM(i),per(1),per(4),per(3));
    figure,imshow(img3),title(str);
end
figure,imshow(img),title('original image');
toc;
