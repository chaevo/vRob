function [Farbe] = colorSort(r,g,b)
%COLORSORT Funktion zur Farbzuweisung
%   Die Funktion erkennt die vom Sensor erfasste Farbe und ordnet sie den
%   Werten 0=rot, 1=gruen, 2=blau und -1=andereFarbe/Fehler. Die Funktion
%   erwartet die Werte für r=rot, g=gruen und b=blau.Die Funktion wird
%   dreimal ausgeführt um Fehler bei der Auslesung zu vermindern.

%Definieren der Variablen
rot = r;
gruen = g;
blau = b;

%Definieren der Farben
farbeR = 0;
farbeG = 1;
farbeB = 2;

%Anlegen einer Matrix zum sortieren nach dem größten Wert
M = [rot,farbeR;gruen,farbeG;blau,farbeB];
Ms = sortrows(M);

%Auslesen des größten Farbwerts
if (Ms(3,1) - Ms(2,1)) > 50;
    Farbe = Ms(3,2);
else
    Farbe = -1;
end
end