function tauschvorgang(A,vRob)
%Der Tauschvorgang ist der Bestandteil des Programms, der die Aufgabe, das
%gewünschte Bild herzustellen, ausführt. Hierzu geht er mit der gegebenen 
%Matrix A, welche die Soll- und Ist-Werte enthält, wie folgt vor: Zuerst 
%dreht der Roboter alle Würfel so, dass es genügend Tauschpartner für jede 
%gewünschte Farbe gibt. Daraufhin tauscht er jeden Würfel so, dass das 
%gewünschte Bild entsteht.

%Positionsdaten
scanPos1 = [292.2988,-70.1517,65];
scanPos2 = [293.5,0,65];
scanPos3 = [292.2988,70.1517,65];
scanPos4 = [352.7074,-68.2660,65];
scanPos5 = [353.5,0,65];
scanPos6 = [352.7074,68.2660,65];
scanPos7 = [412.9391,-66.9631,65];
scanPos8 = [413.5,0,65];
scanPos9 = [412.9391,66.9631,65];
gripPos1 = [250,-60,12];
gripPos2 = [250,0,12];
gripPos3 = [250,60,12];
gripPos4 = [310,-60,12];
gripPos5 = [310,0,12];
gripPos6 = [310,60,12];
gripPos7 = [370,-60,12];
gripPos8 = [370,0,12];
gripPos9 = [370,60,12];
gripPosH1 = [250,-60,50];
gripPosH2 = [250,0,50];
gripPosH3 = [250,60,50];
gripPosH4 = [310,-60,50];
gripPosH5 = [310,0,50];
gripPosH6 = [310,60,50];
gripPosH7 = [370,-60,50];
gripPosH8 = [370,0,50];
gripPosH9 = [370,60,50];
gripPosHV= [gripPosH1;gripPosH2;gripPosH3;gripPosH4;gripPosH5;gripPosH6;gripPosH7;gripPosH8;gripPosH9];
gripPosV = [gripPos1;gripPos2;gripPos3;gripPos4;gripPos5;gripPos6;gripPos7;gripPos8;gripPos9];
scanPosV = [scanPos1;scanPos2;scanPos3;scanPos4;scanPos5;scanPos6;scanPos7;scanPos8;scanPos9];
zwischenPos = [160,0,12];
zwischenPosH = [160,0,50];
zwischenScanPos = [203.5,0,65,90];

%Farbe -1 auch implementieren
%anständige Kommentare
%Jeden Fall des Codes durchgehen und prüfen

%Hier wird geprüft, ob bereits gescannt wurde.
if (A(1,1)~=-1)
    
%1. Hauptschleife für die Überprüfung der nötigen Anzahl für
%Tauschoperationen.
for a=0:1
   %gibt es ungenügend Tauschpartner?
   while length(find(A(:,1)==a))~=length(find(A(:,2)==a));
        %gibt es zu viel oder zu wenig Tauschpartner?:
        %Mehr Ist Farben
        if length(find(A(:,1)==a)) > length(find(A(:,2)==a));
            b=1;
            zwischenV = find(A(:,1)==a);
            %Finde richtigen Drehwürfel
            while A(zwischenV(b),1) == A(zwischenV(b),2);
                b=b+1;
            end
            %Bewege Drehwürfel auf Zwischenposition und drehe in auf
            %gewünschte Farbe
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(zwischenV(b),:),0]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
            vRob.waitFor;
            vRob.openHand;
            %Kippt den Würfel auf der zwischenPos.
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,40]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,40]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,-50]),-1);
            vRob.waitFor;
            vRob.openHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1);
            vRob.waitFor;
            %Ende Kippfunktion
            vRob.moveAngles([1,2,3,4,5],point2angle(zwischenScanPos),-1);
            vRob.waitFor;
            zwcolor=colorSort(getSensorColor(vRob));
            %Wurde die falsche Farbe gedreht?
            if zwcolor~=2;
               %Dreht den Würfel über seine Hochachse
               vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1);
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
               vRob.waitFor;
               vRob.closeHand;
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
               vRob.moveAngles(5,90,-1);
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
               vRob.moveAngles(5,90,-1);
               vRob.waitFor;
               vRob.openHand;
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
               vRob.moveAngles(5,0,-1);
               %Ende Drehung
               %Kippfunktion
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,40]),-1);
               vRob.waitFor;
               vRob.closeHand;
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,40]),-1);
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,-50]),-1);
               vRob.waitFor;
               vRob.openHand;
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1);
               vRob.waitFor;
               %Ende Kippfunktion
            else
            end
            %Würfel zurückbringen
            vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(zwischenV(b),:),0]),-1);
            vRob.waitFor;
            vRob.openHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1);
            vRob.waitFor;
            A(zwischenV(b),1)=2;
        %Mehr Soll Farben    
        else
            %Es gibt blaue Würfel zum Drehen.
            if length(find(A(:,1)==2)) > 0;
               b=1;
               zwischenV = find(A(:,1)==2);
               while A(zwischenV(b),1) == A(zwischenV(b),2) && b < length(zwischenV);
                   b=b+1;
               end
               if A(zwischenV(b),1) == A(zwischenV(b),2);
                  b=1;
                  zwischenV = find(A(:,1)==1);
                  while A(zwischenV(b),1) == A(zwischenV(b),2);
                      b=b+1;
                  end
               else
               end
            %Es gibt keine blauen Würfel zum Drehen
            else
                b=1;
                zwischenV = find(A(:,1)==1);
                while A(zwischenV(b),1) == A(zwischenV(b),2);
                    b=b+1;
                end
            end
            %Dreht den Würfel auf gewünschte Farbe.
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(zwischenV(b),:),0]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
            vRob.waitFor;
            vRob.openHand;
            %Kippt den Würfel auf der zwischenPos
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,40]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,40]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,-50]),-1);
            vRob.waitFor;
            vRob.openHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1);
            vRob.waitFor;
            %Ende Kippfunktion
            vRob.moveAngles([1,2,3,4,5],point2angle(zwischenScanPos),-1);
            vRob.waitFor;
            zwcolor=colorSort(getSensorColor(vRob));
            %Wurde die falsche Farbe gedreht?
            if zwcolor~=a;
               %Dreht den Würfel über seine Hochachse
               vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1);
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
               vRob.waitFor;
               vRob.closeHand;
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
               vRob.moveAngles(5,90,-1);
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
               vRob.moveAngles(5,90,-1);
               vRob.waitFor;
               vRob.openHand;
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
               vRob.moveAngles(5,0,-1);
               %Ende Drehung
               %Kippfunktion
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,40]),-1);
               vRob.waitFor;
               vRob.closeHand;
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,40]),-1);
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,-50]),-1);
               vRob.waitFor;
               vRob.openHand;
               vRob.waitFor;
               vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1);
               vRob.waitFor;
               %Ende Kippfunktion
            else
            end
            %Würfel zurückbringen
            vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(zwischenV(b),:),0]),-1);
            vRob.waitFor;
            vRob.openHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1);
            A(zwischenV(b),1)= a;
        end
   end
end
%Drehoperationen beendet

%2. Hauptschleife Tauschoperationen. Es wird geprüft, ob bestimmte Würfel
%schon richtig liegen. Falls nein, wird ein Tauschpartner gesucht und
%getauscht.
for a=1:9;
    b=1;
    %Tauschen notwendig?
    if A(a,1) ~= A(a,2);
        %Suche Tauschpartner.
        while (A(a,1)~=A(a+b,2)||A(a+b,1)~=A(a,2)) && (b<9-a);
        b=b+1;
        end
        %Es können zwei Würfel auf einmal richtig platziert werden.
        if A(a,1)==A(a+b,2) && A(a+b,1)==A(a,2);
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a,:),0]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
            vRob.waitFor;
            vRob.openHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a+b,:),0]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a,:),0]),-1);
            vRob.waitFor;
            vRob.openHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a+b,:),0]),-1);
            vRob.waitFor;
            vRob.openHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1);
            vRob.waitFor;
            A(a,1) = A(a,2);
            A(a+b,1) = A(a+b,2);
        %Beliebiger Tauschpartner wird genommen.   
        else
            b=1;
            while A(a,2) ~= A(a+b,1);
                b=b+1;
            end
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a,:),0]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
            vRob.waitFor;
            vRob.openHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a+b,:),0]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a,:),0]),-1);
            vRob.waitFor;
            vRob.openHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1);
            vRob.waitFor;
            vRob.closeHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1);
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a+b,:),0]),-1);
            vRob.waitFor;
            vRob.openHand;
            vRob.waitFor;
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1);
            vRob.waitFor;
            A(a+b,1) = A(a,1);
            A(a,1) = A(a,2);
        end
    else
    end
end
%Bewege vRob in Ausgangsposition.
vRob.moveAngles([1,2,3,4,5],point2angle([180,0,50,0]),-1);
vRob.waitFor;
'Der VRob ist fertig'
else
    'Es muss zuerst gescannt werden'
end
end