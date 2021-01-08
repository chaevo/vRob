function [schnitt] = schnittpunkt (A,B,a,b)

c = sqrt((B(1)-A(1))^2+(B(2)-A(2))^2);



x= (a^2+c^2-b^2)/(2*c);

 

y= sqrt(a^2-x^2);



<<<<<<< HEAD
Q1x = A(1) + x*((B(1)-A(1))/c)
% -y*((B(1)-A(1))/c)
Q1y = A(2)+ y*((B(2)-A(2))/c)
=======
Q1x = A(1) + x*((B(1)-A(1))/c)-y*((B(2)-A(2))/c)
Q1y = A(2) + x*((B(2)-A(2))/c)+y*((B(1)-A(1))/c)
>>>>>>> d804b3a91e2cbc8d1eea0565deac51d1d3accc6d

% + x*((B(2)-A(2))/c)+
 Q2x = A(1) + x*((B(1)-A(1))/c)+y*((B(1)-A(1))/c)
 Q2y = A(2) + x*((B(2)-A(2))/c)-y*((B(2)-A(2))/c)

<<<<<<< HEAD
=======
Q2x = A(1) + x*(B(1)-A(1)/c)+y*(B(2)-A(2)/c)
Q2y = A(2) + x*(B(2)-A(2)/c)-y*(B(1)-A(1)/c)
>>>>>>> d804b3a91e2cbc8d1eea0565deac51d1d3accc6d

if (Q1y > Q2y)
    schnitt = [Q1x Q1y]
else
    schnitt = [Q2x Q2y]
end
    


end
