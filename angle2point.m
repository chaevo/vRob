function [angle] = angle2point(x,y)
%ANGLE2POINT Die Funktion berechnet den Winkel der Koordinate vom Nullpunkt.
%   Die Funktion erhält als Übergabewerte die X- und Y- Koordinate und gibt
%   den Winkel vom Nullpunkt zu diesem Punkt in Grad aus.

angle = atand(y/x); %Berechnung des Winkels durch atan

end

