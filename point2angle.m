function [angleV] = point2angle(Input)
%POINT2ANGLE
%Funktion, die Positionsangaben in Vektoren und diese dann in
%Winkel umrechnet. Eingegeben werden die x,y,z Werte und der hand2ground
%Winkel. Heraus kommt ein Vektor mit 5 Winkel.(1 base rotation,
%2 shoulder,3 elbow,4 wrist,5 wrist rotation)

%Input:=[x;y;z;h2g]
x=Input(1)
y=Input(2)
z=Input(3)
h2g = Input(4)
%Ausrechnen der genauen Vektoren
v1 = [0; 122];
mid = midPointCircel2(dist2point(x,y),z,h2g);
s = schnittpunkt(mid);
 v2 = vektor2(s);
 v3 = vektor3(s,mid);
 v4 = vektor4(mid,h2g);
 
 %Ausrechnen der Winkel der baseRot und wristRot
 angle1 = angle2point(x,y);
 
 angle5 = angle2point (x,y);
 
 %shoulder Winkel
 if (v2(1)>= 0)
     angle2 = rad2deg(subspace(v1,v2));
 else
     angle2 = -rad2deg(subspace(v1,v2));
 end
 
 %elbow Winkel
 angle3 =rad2deg( atan2(v2(2),v2(1))-atan2(v3(2),v3(1)))
 
%wrist Winkel
 angle4 = rad2deg(atan2(v3(2),v3(1))-atan2(v4(2),v4(1)))
 
 %Zusammenfassen in einem Vektor
angleV = [angle1 angle2 angle3 angle4 angle5];

end
