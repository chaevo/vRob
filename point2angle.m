function [angle1,angle2,angle3,angle4] =point2angle(x,y,z,h2g)
v1 = [0 122]
mid= midPointCircel2(dist2point(x,y),z,h2g)
s = schnittpunkt(mid)
 v2 = vektor2(s)
 v3 = vektor3(s,mid)
 v4 = vektor4(mid,h2g)
 
 angle1 = angle2point(x,y)
 angle2 = vector2angle(v1,v2)
 angle3 = vector2angle(v2,v3)
 angle4 = vector2angle(v3,v4)
 

end
