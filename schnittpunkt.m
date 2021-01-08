function [V1,V2] = schnittpunkt (A,B,a,b)

c = sqrt((B(1)-A(1))^2+(B(2)-A(2))^2);



x= (a^2+c^2-b^2)/(2*c);

 

y= sqrt(a^2-x^2);



Q1x = A(1) + x*(B(1)-A(1)/c)-y*(B(1)-A(1)/c)
Q1y = A(1) + x*(B(2)-A(2)/c)+y*(B(2)-A(2)/c)

<<<<<<< HEAD
Q2x = A(1) + x*(B(1)-A(1)/c)+y*(B(1)-A(1)/c)
Q2y = A(1) + x*(B(2)-A(2)/c)-y*(B(2)-A(2)/c)



%  u1 = [Q1x Q1y]
%  u2 = [266 141]
%  u3 =[0 122]
%  
%  V1 = u1-u3
%  V2 = u2- u1
=======
 u1 = [Q1x Q1y];
 u2 = [266 141];
 u3 =[0 122];
 
 V1 = real(u1-u3);
 V2 = real(u2- u1);
>>>>>>> 752b2b9f2dcf340a00eaea495bb9d6ad4e54b3bc


end
