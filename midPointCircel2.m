function [mid2] = midPointCircel2 (x,z,a)


    x4= sind(a)*129.9
    y4=cosd(a)*-129.9

mid2= [x,z] - [x4,y4]

 
end
