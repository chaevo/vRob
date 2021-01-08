function [schnitt] = schnittpunkt (A,B,a,b)
% SCHNITTPUNKT Berechnung des Schnittpunkts zweier Kreise mit Eingabe von
% Radius eines Kreises a,b und den Mittelpunkt A,B
% Der Schnittpunkt mit dem größeren y wird ausgegeben.


c = sqrt((B(1)-A(1))^2+(B(2)-A(2))^2);


x= (a^2+c^2-b^2)/(2*c);


y= sqrt(a^2-x^2);

% Berechnung Schnittunkt 1
Q1x = A(1) + x*((B(1)-A(1))/c)-y*((B(2)-A(2))/c);
Q1y = A(2) + x*((B(2)-A(2))/c)+y*((B(1)-A(1))/c);

% Berechnung Schnittunkt 2
Q2x = A(1) + x*((B(1)-A(1))/c)+y*((B(2)-A(2))/c);
Q2y = A(2) + x*((B(2)-A(2))/c)-y*((B(1)-A(1))/c);

% Vergleich der Punkte

if (Q1y > Q2y)
    schnitt = [Q1x Q1y];
else
    schnitt = [Q2x Q2y];
end
    


end