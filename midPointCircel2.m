function [mid2] = midPointCircel2 (dist,z,h2g)
% MIDPOINTCIRCEL2 Funktion die ausgehend von der Distanz der
% Zielkoordinate vom Ursprung die Position der MItte des zweiten Kreises
% festlegt.
% a ist der hand2ground Winkel

    x4= sind(h2g)*129.9
    y4=cosd(h2g)*-129.9

mid2= [dist; z] - [x4; y4];

 
end
