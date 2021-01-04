function [dist] = dist2point(x,y)
%DIST2POINT Diese Funktion gibt die Entfernung von einem Punkt zum Ursprung
%an
%   Die Funktion erhält die X- und Y- Koordinate des gewünschten Punktes
%   und gibt die Entfernung zu diesem aus.

a = atan(y/x);

if (y == 0) 
        dist = x;
     else 
        dist = y/sin(a);
       
end

