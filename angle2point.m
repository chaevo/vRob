function [angle] = angle2point(x,y)
%angle2point Die Funktion berechnet den Winkel der Koordinate vom Nullpunkt.
%   Die Funktion erhält als Übergabewerte die X- und Y- Koordinate und gibt
%   den Winkel vom Nullpunkt zu diesem Punkt in Grad aus.

angle = atand(y/x);

end

