function [angleV] = point2angle(Input)
%Input:=[x;y;z;h2g]
x=Input(1)
y=Input(2)
z=Input(3)
h2g=Input(4)
v1 = [0; 122];
mid = midPointCircel2(dist2point(x,y),z,h2g);
s = schnittpunkt(mid);
 v2 = vektor2(s);
 v3 = vektor3(s,mid);
 v4 = vektor4(mid,h2g);
 
 angle1 = angle2point(x,y);
 
 angle5 = angle2point (x,y);
 
%  angle2 = rad2deg(subspace(v1,v2))
 
 if (v2(1)>= 0)
     angle2 = rad2deg(subspace(v1,v2));
 else
     angle2 = -rad2deg(subspace(v1,v2));
 end
 
 angle3 = rad2deg(subspace(v2,v3));
 
 % angle4 = rad2deg(subspace(v3,v4))
 
 if (v3(2) > h2g)
     angle4 = -rad2deg(subspace(v3,v4));
 else
     angle4 = rad2deg(subspace(v3,v4));
 end
 
angleV = [angle1 angle2 angle3 angle4 angle5];

end
