function tauschvorgang(vRob)
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
A=[0,0;0,1;0,2;1,2;2,0;0,1;0,1;2,2;2,0] %später ersetzen mit Scan und eingabe A
%Farbe -1 auch implementieren
%Semikolon einfügen
%anständige Kommentare
%Scanposition direkt über würfel oder versetzt?
%eventuell vor und nach Greifen erstmal ein stück hoch
%Wartefunktion vor nächster Bewegung
%Würfel immer zurückgebracht?
%moveAngles: rob.moveAngles, richtige Eingabevariablen
%Jeden Fall des Codes durchgehen und prüfen
if length(A(1,:))==2
for a=0:1 %1. Hauptschleife für die Anzahl gegebener Farben
   while length(find(A(:,1)==a))~=length(find(A(:,2)==a))
       %Welche Spalte größer:
        %Mehr Ist Farben
        if length(find(A(:,1)==a)) > length(find(A(:,2)==a))
            b=1
            zwischenV = find(A(:,1)==a)
            while A(zwischenV(b),1) == A(zwischenV(b),2)
                b=b+1
            end
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(zwischenV(b),:),0]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
            vRob.waitFor
            vRob.openHand
            %Kippt den Würfel auf der zwischenPos
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,40]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,40]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,-50]),-1)
            vRob.waitFor
            vRob.openHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1)
            vRob.waitFor
            %Ende Kippfunktion
            vRob.moveAngles([1,2,3,4,5],point2angle(zwischenScanPos),-1) %Scanpos auf zwischenPos
            vRob.waitFor
            zwcolor=colorSort(getSensorColor(vRob))%Funktioniert Sensorcolor?
            if zwcolor~=2
               %Dreht den Würfel über seine Hochachse
               vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1)
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
               vRob.waitFor
               vRob.closeHand
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
               vRob.moveAngles(5,90,-1)
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
               vRob.moveAngles(5,90,-1)
               vRob.waitFor
               vRob.openHand
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
               vRob.moveAngles(5,0,-1)
               %Ende Drehung
               %Kippfunktion
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,40]),-1)
               vRob.waitFor
               vRob.closeHand
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,40]),-1)
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,-50]),-1)
               vRob.waitFor
               vRob.openHand
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1)
               vRob.waitFor
               %Ende Kippfunktion
            else
            end
            %Würfel zurückbringen
            vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(zwischenV(b),:),0]),-1)
            vRob.waitFor
            vRob.openHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1)
            vRob.waitFor
            A(zwischenV(b),1)=2
        %Mehr Soll Farben    
        else
            %Blau ist > 0
            if length(find(A(:,1)==2)) > 0
               b=1
               zwischenV = find(A(:,1)==2)
               while A(zwischenV(b),1) == A(zwischenV(b),2) && b < length(zwischenV)
                   b=b+1
               end
               if A(zwischenV(b),1) == A(zwischenV(b),2)
                  b=1
                  zwischenV = find(A(:,1)==1)
                  while A(zwischenV(b),1) == A(zwischenV(b),2)
                      b=b+1
                  end
               else
               end
            %Blau ist nicht > 0
            else
                b=1
                zwischenV = find(A(:,1)==1)
                while A(zwischenV(b),1) == A(zwischenV(b),2)
                    b=b+1
                end
            end
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(zwischenV(b),:),0]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
            vRob.waitFor
            vRob.openHand
            %Kippt den Würfel auf der zwischenPos
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,40]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,40]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,-50]),-1)
            vRob.waitFor
            vRob.openHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1)
            vRob.waitFor
            %Ende Kippfunktion
            vRob.moveAngles([1,2,3,4,5],point2angle(zwischenScanPos),-1) %Scanpos auf zwischenPos
            vRob.waitFor
            zwcolor=colorSort(getSensorColor(vRob))%Funktioniert Sensorcolor?
            if zwcolor~=a
               %Dreht den Würfel über seine Hochachse
               vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1)
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
               vRob.waitFor
               vRob.closeHand
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
               vRob.moveAngles(5,90,-1)
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
               vRob.moveAngles(5,90,-1)
               vRob.waitFor
               vRob.openHand
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
               vRob.moveAngles(5,0,-1)
               %Ende Drehung
               %Kippfunktion
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,40]),-1)
               vRob.waitFor
               vRob.closeHand
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,40]),-1)
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,-50]),-1)
               vRob.waitFor
               vRob.openHand
               vRob.waitFor
               vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1)
               vRob.waitFor
               %Ende Kippfunktion
            else
            end
            %Würfel zurückbringen
            vRob.moveAngles([1,2,3,4,5],point2angle([160,0,80,0,-50]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(zwischenV(b),:),0]),-1)
            vRob.waitFor
            vRob.openHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(zwischenV(b),:),0]),-1)
            A(zwischenV(b),1)= a
        end
   end
end
for a=1:9
    b=1
    %Soll entspricht nicht Ist
    if A(a,1) ~= A(a,2)
        while (A(a,1)~=A(a+b,2)||A(a+b,1)~=A(a,2)) && (b<9-a)
        b=b+1
        end
        %Zwei Fliegen mit einer Klatsche
        if A(a,1)==A(a+b,2) && A(a+b,1)==A(a,2)
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a,:),0]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
            vRob.waitFor
            vRob.openHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a+b,:),0]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a,:),0]),-1)
            vRob.waitFor
            vRob.openHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a+b,:),0]),-1)
            vRob.waitFor
            vRob.openHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1)
            vRob.waitFor
            A(a,1) = A(a,2)
            A(a+b,1) = A(a+b,2)
        %Beliebiger Tauschpartner    
        else
            b=1
            while A(a,2) ~= A(a+b,1)
                b=b+1
            end
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a,:),0]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
            vRob.waitFor
            vRob.openHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a+b,:),0]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a,:),0]),-1)
            vRob.waitFor
            vRob.openHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPos,0]),-1)
            vRob.waitFor
            vRob.closeHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([zwischenPosH,0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1)
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosV(a+b,:),0]),-1)
            vRob.waitFor
            vRob.openHand
            vRob.waitFor
            vRob.moveAngles([1,2,3,4,5],point2angle([gripPosHV(a+b,:),0]),-1)
            vRob.waitFor
            A(a+b,1) = A(a,1)
            A(a,1) = A(a,2)
        end
    else
    end
end
vRob.moveAngles([1,2,3,4,5],point2angle([180,0,50,0]),-1)
vRob.waitFor
'Der VRob ist fertig'
else
    'Es muss zuerst gescannt werden'
end
end