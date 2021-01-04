function [angle] = vector2angle(v1,v2)
%VECTOR2ANGLE Berechnung des Schnittwinkels von 2 Vektoren
%   Die Funktion bekommt die zwei Vektoren 'v1' und 'v2' übergeben und
%   berechnet daraus den Schnittwinkel und gibt ihn in 'angle' zurück.
%   Falls einer der Vektoren 2 Dimensional ist wird er in einen 3D Vektor
%   umgeschrieben.

if (size(v1,2) == 2)
    u1 = [v1(1) v1(2) 0];
end
    
if (size(v2,2) == 2)
    u2 = [v2(1) v2(2) 0];
end
    
angle = atan2d(norm(cross(u1,u2)), dot(u1,u2));

end

