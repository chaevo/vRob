function [angleV] = point2angle(x,y,z,h2g)
v1 = [0; 122];
mid = midPointCircel2(dist2point(x,y),z,h2g);
s = schnittpunkt(mid);
 v2 = vektor2(s);
 v3 = vektor3(s,mid);
 v4 = vektor4(mid,h2g);
 
 angle1 = rad2deg(subspace(x,y));
 
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
 
angleV = [angle1 angle2 angle3 angle4];

end
