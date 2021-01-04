function [dist] = dist2point(x,y)
%DIST2POINT Diese Funktion gibt die Entfernung von einem Punkt zum Ursprung
%an
%   Die Funktion erhält die X- und Y- Koordinate des gewünschten Punktes
%   und gibt die Entfernung zu diesem aus.

a = atan(y/x); %Berechnung des Winkels zum Ursprung

if (y == 0) %Wenn der Punkt auf der X-Achse liegt wird der X-Wert ausgegeben
        dist = x;
     else  %Ansonsten wird der mithilfe des Sinus des Winkels berechnet
        dist = y/sin(a);
       
end

