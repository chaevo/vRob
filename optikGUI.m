function plot() 
%% erstellt ein 3*3 raster der würfeln die durch sortiert werden sollen
%% Farben müssen je nach scanner vergeben werden (noch nicht gemacht)

X1=[0 0 0.25 0.25]
Y1=[0.25 0 0 0.25]
patch(X1,Y1,'b')
hold on;

X2=[0.5 0.5 0.75 0.75]
Y2=[0.25 0 0 0.25]
patch(X2,Y2,'r')
hold on;

X3=[1 1 1.25 1.25]
Y3=[0.25 0 0 0.25]
patch(X3,Y3,'g')
hold on;

X4=[0 0 0.25 0.25]
Y4=[0.75 0.5 0.5 0.75]
patch(X4,Y4,'b')
hold on;

X5=[0.5 0.5 0.75 0.75]
Y5=[0.75 0.5 0.5 0.75]
patch(X5,Y5,'r')
hold on;

X6=[1 1 1.25 1.25]
Y6=[0.75 0.5 0.5 0.75]
patch(X6,Y6,'g')
hold on;

X7=[0 0 0.25 0.25]
Y7=[1.25 1 1 1.25]
patch(X7,Y7,'b')
hold on;

X8=[0.5 0.5 0.75 0.75]
Y8=[1.25 1 1 1.25]
patch(X8,Y8,'r')
hold on;

X9=[1 1 1.25 1.25]
Y9=[1.25 1 1 1.25]
patch(X9,Y9,'g')
hold on;

end