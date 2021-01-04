function [schnitt] = schnittpunkt (A,B,a,b)
c = sqrt((B(1)-A(1))^2+(B(2)-A(2))^2)

% c= round(c)

x= (a^2+c^2-b^2)/2*c

y= sqrt(a^2-x^2)
Q1x = A(1) + x*(B(1)-A(1)/c)-y*(B(1)-A(1))/c
Q1y = A(1) + x*(B(2)-A(2)/c)+y*(B(2)-A(2))/c
Q2x = A(1) + x*(B(1)-A(1)/c)+y*(B(1)-A(1))/c
Q2y = A(1) + x*(B(2)-A(2)/c)-y*(B(2)-A(2))/c
end
