function [istFarben]= scanAll

scanPos1 = [292.2988,-70.1517,65]
scanPos2 = [293.5,0,65]
scanPos3 = [292.2988,70.1517,65]
scanPos4 = [352.7074,-68.2660,65]
scanPos5 = [353.5,0,65]
scanPos6 = [352.7074,68.2660,65]
scanPos7 = [412.9391,-66.9631,65]
scanPos8 = [413.5,0,65]
scanPos9 = [412.9391,66.9631,65]

istFarben=[ -1 0;-1 0; -1 0;-1 0;-1 0;-1 0;-1 0;-1 0;-1 0]

%Position 1
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos1),-1)
color1v = vRob.getSensorColor
color1 = colorSort(color1v)

istFarben(1,1) = color1

%Position 2
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos2),-1)
color2v = vRob.getSensorColor
color2 = colorSort(color2v)

istFarben(2,1) = color2

%Position 3
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos3),-1)
color3v = vRob.getSensorColor
color3 = colorSort(color3v)

istFarben(3,1) = color3

%Position 4
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos4),-1)
color4v = vRob.getSensorColor
color4 = colorSort(color4v)

istFarben(4,1) = color4

%Position 5
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos5),-1)
color5v = vRob.getSensorColor
color5 = colorSort(color5v)

istFarben(5,1) = color5

%Position 6
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos6),-1)
color6v = vRob.getSensorColor
color6 = colorSort(color1v)

istFarben(1,1) = color6

%Position 7
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos7),-1)
color7v = vRob.getSensorColor
color7 = colorSort(color7v)

istFarben(7,1) = color7

%Position 8
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos8),-1)
color8v = vRob.getSensorColor
color8 = colorSort(color8v)

istFarben(8,1) = color8

%Position 9
vRob.moveAngles([1,2,3,4,5],point2angle(scanPos9),-1)
color9v = vRob.getSensorColor
color9 = colorSort(color9v)

istFarben(9,1) = color9


end


