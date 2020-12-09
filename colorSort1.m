function [Farbe] = colorSort(r,g,b)
%COLORSORT Summary of this function goes here
%   Detailed explanation goes here
rot=r
gruen=g
blau=b
Farber=0
Farbeg=1
Farberb=2
M=[rot,Farber;gruen,Farbeg;blau,Farberb]
Ms=sortrows(M)
if (Ms(3,1)-Ms(2,1))>100
    Farbe=Ms(3,2)
else
    Farbe= -1
end
end