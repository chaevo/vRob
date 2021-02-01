function [istFarben]= scanAll (vRob)
%SCANALL Funktion zum scannen aller Würfel
% Diese Funktion fährt alle Würfel an und scannt sie drei mal. Die Werte
% werden miteinander verglichen.Wenn sie gleich sind werden die Werte als
% Matrix weitergegeben.

% vRob = VirtualRobot('random')

%Variablen definieren
scanPos1 = [292.2988,-70.1517,65,90]
scanPos2 = [293.5,0,65,90]
scanPos3 = [292.2988,70.1517,65,90]
scanPos4 = [352.7074,-68.2660,65,90]
scanPos5 = [353.5,0,65,90]
scanPos6 = [352.7074,68.2660,65,90]
scanPos7 = [412.9391,-66.9631,65,90]
scanPos8 = [413.5,0,65,90]
scanPos9 = [412.9391,66.9631,65,90]

istFarben=[ -1 0;-1 0; -1 0;-1 0;-1 0;-1 0;-1 0;-1 0;-1 0]

%Position 1
a=0
while a==0
%Bewegung zum Punkt
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos1),-1)
vRob.moveAngles([5],[0],-1)
vRob.waitFor()

%Scannen 3 mal
color1v = vRob.getSensorColor
color11 = colorSort(color1v)
color1v = vRob.getSensorColor
color12 = colorSort(color1v)
color1v = vRob.getSensorColor
color13 = colorSort(color1v)

color1v = [color11,color12,color13]

%Vergleich der Werte
a = ~any(diff(color1v))

istFarben(1,1) = color11
end


%Position 2
b=0
while b==0
    %Bewegung zum Punkt
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos2),-1)
vRob.moveAngles([5],[0],-1)
vRob.waitFor()

%Scannen 3 mal
color2v = vRob.getSensorColor
color21 = colorSort(color2v)
color2v = vRob.getSensorColor
color22 = colorSort(color2v)
color2v = vRob.getSensorColor
color23 = colorSort(color2v)

color2v = [color21,color22,color23]

%Vergleich der Werte
b = ~any(diff(color2v))

istFarben(2,1) = color21
end

%Position 3
c=0
while c==0
    %Bewegung zum Punkt

vRob.moveAngles([1,2,3,4,5],point2angle(scanPos3),-1)
vRob.moveAngles([5],[0],-1)
vRob.waitFor()

%Scannen 3 mal
color3v = vRob.getSensorColor
color31 = colorSort(color3v)
color3v = vRob.getSensorColor
color32 = colorSort(color3v)
color3v = vRob.getSensorColor
color33 = colorSort(color3v)

color3v = [color31,color32,color33]

%Vergleich der Werte
c = ~any(diff(color3v))

istFarben(3,1) = color31
end

%Position 4
d=0
while d==0
    %Bewegung zum Punkt
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos4),-1)
vRob.moveAngles([5],[0],-1)
vRob.waitFor()

%Scannen 3 mal
color4v = vRob.getSensorColor
color41 = colorSort(color4v)
color4v = vRob.getSensorColor
color42 = colorSort(color4v)
color4v = vRob.getSensorColor
color43 = colorSort(color4v)

color4v = [color41,color42,color43]

%Vergleich der Werte
d = ~any(diff(color4v))

istFarben(4,1) = color41
end

%Position 5
e=0
while e==0
    %Bewegung zum Punkt
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos5),-1)
vRob.moveAngles([5],[0],-1)
vRob.waitFor()

%Scannen 3 mal
color5v = vRob.getSensorColor
color51 = colorSort(color5v)
color5v = vRob.getSensorColor
color52 = colorSort(color5v)
color5v = vRob.getSensorColor
color53 = colorSort(color5v)

color5v = [color51,color52,color53]

%Vergleich der Werte
e = ~any(diff(color5v))

istFarben(5,1) = color51
end

%Position 6
f=0
while f==0
    %Bewegung zum Punkt
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos6),-1)
vRob.moveAngles([5],[0],-1)
vRob.waitFor()

%Scannen 3 mal
color6v = vRob.getSensorColor
color61 = colorSort(color6v)
color6v = vRob.getSensorColor
color62 = colorSort(color6v)
color6v = vRob.getSensorColor
color63 = colorSort(color6v)

color6v = [color61,color62,color63]

%Vergleich der Werte
f = ~any(diff(color6v))

istFarben(6,1) = color61
end


%Position 7
g=0
while g==0
    %Bewegung zum Punkt
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos7),-1)
vRob.moveAngles([5],[0],-1)
vRob.waitFor()

%Scannen 3 mal
color7v = vRob.getSensorColor
color71 = colorSort(color7v)
color7v = vRob.getSensorColor
color72 = colorSort(color7v)
color7v = vRob.getSensorColor
color73 = colorSort(color7v)

color7v = [color71,color72,color73]

%Vergleich der Werte
g = ~any(diff(color7v))

istFarben(7,1) = color71

end

%Position 8
h=0
while h==0
%Bewegung zum Punkt
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos8),-1)
vRob.moveAngles([5],[0],-1)
vRob.waitFor()

%Scannen 3 mal
color8v = vRob.getSensorColor
color81 = colorSort(color8v)
color8v = vRob.getSensorColor
color82 = colorSort(color8v)
color8v = vRob.getSensorColor
color83 = colorSort(color8v)

color8v = [color81,color82,color83]

%Vergleich der Werte
h = ~any(diff(color8v))

istFarben(8,1) = color81
end

%Position 9
i=0
while i==0
    %Bewegung zum Punkt
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos9),-1)
vRob.moveAngles([5],[0],-1)
vRob.waitFor()

%Scannen 3 mal
color9v = vRob.getSensorColor
color91 = colorSort(color9v)
color9v = vRob.getSensorColor
color92 = colorSort(color9v)
color9v = vRob.getSensorColor
color93 = colorSort(color9v)

color9v = [color91,color92,color93]

%Vergleich der Werte
i = ~any(diff(color9v))

istFarben(9,1) = color91
end

vRob.moveAngles([1,2,3,4,5],point2angle([180,0,50,0]),-1)
end


