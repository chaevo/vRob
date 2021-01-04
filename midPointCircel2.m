function [mid2] = midPointCircel2 (x,z,a)
% MIDPOINTCIRCEL2 Funktion die ausgehend von der Distanz der
% Zielkoordinate vom Ursprung die Position der MItte des zweiten Kreises
% festlegt.

    x4= sind(a)*129.9;
    y4=cosd(a)*-129.9;

mid2= [x,z] - [x4,y4];

 
end
