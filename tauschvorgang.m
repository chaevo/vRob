function tauschvorgang
%Positionsdaten
scanPos1 = [250,-60,65,90];
scanPos2 = [250,0,65,90];
scanPos3 = [250,60,65,90];
scanPos4 = [310,-60,65,90];
scanPos5 = [310,0,65,90];
scanPos6 = [310,60,65,90];
scanPos7 = [370,-60,65,90];
scanPos8 = [370,0,65,90];
scanPos9 = [370,60,65,90];
gripPos1 = [250,-60,12];
gripPos2 = [250,0,12];
gripPos3 = [250,60,12];
gripPos4 = [310,-60,12];
gripPos5 = [310,0,12];
gripPos6 = [310,60,12];
gripPos7 = [370,-60,12];
gripPos8 = [370,0,12];
gripPos9 = [370,60,12];
gripPosH1 = [250,-60,80];
gripPosH2 = [250,0,80];
gripPosH3 = [250,60,80];
gripPosH4 = [310,-60,80];
gripPosH5 = [310,0,80];
gripPosH6 = [310,60,80];
gripPosH7 = [370,-60,80];
gripPosH8 = [370,0,80];
gripPosH9 = [370,60,80];
gripPosHV= [gripPosH1;gripPosH2;gripPosH3;gripPosH4;gripPosH5;gripPosH6;gripPosH7;gripPosH8;gripPosH9];
gripPosV = [gripPos1;gripPos2;gripPos3;gripPos4;gripPos5;gripPos6;gripPos7;gripPos8;gripPos9];
scanPosV = [scanPos1;scanPos2;scanPos3;scanPos4;scanPos5;scanPos6;scanPos7;scanPos8;scanPos9];
zwischenPos = [160,0,12];
zwischenPosH = [160,0,80];
zwischenScanPos = [203.5,0,65,90];
A=[0,0;1,0;2,0;0,1;0,1;2,1] %später ersetzen mit Scan und eingabe A
%Farbe -1 auch implementieren
%Semikolon einfügen
%anständige Kommentare
%Scanposition direkt über würfel oder versetzt?
%eventuell vor und nach Greifen erstmal ein stück hoch
%Wartefunktion vor nächster Bewegung
%Würfel immer zurückgebracht?
%moveAngles: rob.moveAngles, richtige Eingabevariablen
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
            moveAngles(point2angle([gripPosHV(zwischenV(b),:),0]))
            moveAngles(point2angle([gripPosV(zwischenV(b),:),0]))
            closeHand(obj)
            moveAngles(point2angle([gripPosHV(zwischenV(b),:),0]))
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([zwischenPos,0]))
            openHand(obj)
            %Kippt den Würfel auf der zwischenPos
            moveAngles(point2angle([zwischenPos,40]))
            closeHand(obj)
            moveAngles(point2angle([zwischenPosH,40]))
            moveAngles(point2angle([zwischenPosH,-50]))
            moveAngles(point2angle([zwischenPos,-50]))
            openHand(obj)
            %Ende Kippfunktion
            moveAngles(point2angle(zwischenScanPos)) %Scanpos auf zwischenPos
            zwcolor=rob.getSensorColor()%Funktioniert Sensorcolor?
            if zwcolor~=2
               %Dreht den Würfel über seine Hochachse
               moveAngles(point2angle([zwischenPos,0]))
               closeHand(obj)
               moveAngles(point2angle([zwischenPosH,0]))
               wristrot(90)%Richtige Funktion suchen
               moveAngles(point2angle([zwischenPos,0]))
               openHand(obj)
               moveAngles(point2angle([zwischenPosH,0]))
               wristrot(0)
               %Ende Drehung
               %Kippfunktion
               moveAngles(point2angle([zwischenPos,40]))
               closeHand(obj)
               moveAngles(point2angle([zwischenPosH,40]))
               moveAngles(point2angle([zwischenPosH,-50]))
               moveAngles(point2angle([zwischenPos,-50]))
               openHand(obj)
               %Ende Kippfunktion
            else
            end
            %Würfel zurückbringen
            moveAngles(point2angle([zwischenPos,0]))
            closeHand(obj)
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([gripPosHV(zwischenV(b),:),0]))
            moveAngles(point2angle([gripPosV(zwischenV(b),:),0]))
            openHand(obj)
            moveAngles(point2angle([gripPosHV(zwischenV(b),:),0]))
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
            moveAngles(point2angle([gripPosHV(zwischenV(b),:),0]))
            moveAngles(point2angle([gripPosV(zwischenV(b),:),0]))
            closeHand(obj)
            moveAngles(point2angle([gripPosHV(zwischenV(b),:),0]))
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([zwischenPos,0]))
            openHand(obj)
            %Kippt den Würfel auf der zwischenPos
            moveAngles(point2angle([zwischenPos,40]))
            closeHand(obj)
            moveAngles(point2angle([zwischenPosH,40]))
            moveAngles(point2angle([zwischenPosH,-50]))
            moveAngles(point2angle([zwischenPos,-50]))
            openHand(obj)
            %Ende Kippfunktion
            moveAngles(point2angle(zwischenScanPos)) %Scanpos auf zwischenPos
            zwcolor=rob.getSensorColor()%Funktioniert Sensorcolor?
            if zwcolor~=a
               %Dreht den Würfel über seine Hochachse
               moveAngles(point2angle([zwischenPos,0]))
               closeHand(obj)
               moveAngles(point2angle([zwischenPosH,0]))
               wristrot(90)%Richtige Funktion suchen
               moveAngles(point2angle([zwischenPos,0]))
               openHand(obj)
               moveAngles(point2angle([zwischenPosH,0]))
               wristrot(0)
               %Ende Drehung
               %Kippfunktion
               moveAngles(point2angle([zwischenPos,40]))
               closeHand(obj)
               moveAngles(point2angle([zwischenPosH,40]))
               moveAngles(point2angle([zwischenPosH,-50]))
               moveAngles(point2angle([zwischenPos,-50]))
               openHand(obj)
               %Ende Kippfunktion
            else
            end
            %Würfel zurückbringen
            moveAngles(point2angle([zwischenPos,0]))
            closeHand(obj)
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([gripPosHV(zwischenV(b),:),0]))
            moveAngles(point2angle([gripPosV(zwischenV(b),:),0]))
            openHand(obj)
            moveAngles(point2angle([gripPosHV(zwischenV(b),:),0]))
            A(zwischenV(b),1)= a
        end
   end
end
for a=1:9
    b=1
    %Soll entspricht nicht Ist
    if A(a,1) ~= A(a,2)
        while (A(a,1)~=A(a+b,2)||A(a+b,1)~=A(a,2)) && (b<=9-a)
        b=b+1
        end
        %Zwei Fliegen mit einer Klatsche
        if A(a,1)==A(a+b,2) && A(a+b,1)==A(a,2)
            moveAngles(point2angle([gripPosHV(A(a,1)),0]))
            moveAngles(point2angle([gripPosV(A(a,1)),0]))
            closeHand(obj)
            moveAngles(point2angle([gripPosHV(A(a,1)),0]))
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([zwischenPos,0]))
            openHand(obj)
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([gripPosHV(A(a+b,1)),0]))
            moveAngles(point2angle([gripPosV(A(a+b,1)),0]))
            closeHand(obj)
            moveAngles(point2angle([gripPosHV(A(a+b,1)),0]))
            moveAngles(point2angle([gripPosHV(A(a,1)),0]))
            moveAngles(point2angle([gripPosV(A(a,1)),0]))
            openHand(obj)
            moveAngles(point2angle([gripPosHV(A(a,1)),0]))
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([zwischenPos,0]))
            closeHand(obj)
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([gripPosHV(A(a+b,1)),0]))
            moveAngles(point2angle([gripPosV(A(a+b,1)),0]))
            openHand(obj)
            moveAngles(point2angle([gripPosHV(A(a+b,1)),0]))
            A(a,1) = A(a,2)
            A(a+b,1) = A(a+b,2)
        %Beliebiger Tauschpartner    
        else
            b=1
            while A(a,2) ~= A(a+b,1)
                b=b+1
            end
            moveAngles(point2angle([gripPosHV(A(a,1)),0]))
            moveAngles(point2angle([gripPosV(A(a,1)),0]))
            closeHand(obj)
            moveAngles(point2angle([gripPosHV(A(a,1)),0]))
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([zwischenPos,0]))
            openHand(obj)
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([gripPosHV(A(a+b,1)),0]))
            moveAngles(point2angle([gripPosV(A(a+b,1)),0]))
            closeHand(obj)
            moveAngles(point2angle([gripPosHV(A(a+b,1)),0]))
            moveAngles(point2angle([gripPosHV(A(a,1)),0]))
            moveAngles(point2angle([gripPosV(A(a,1)),0]))
            openHand(obj)
            moveAngles(point2angle([gripPosHV(A(a,1)),0]))
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([zwischenPos,0]))
            closeHand(obj)
            moveAngles(point2angle([zwischenPosH,0]))
            moveAngles(point2angle([gripPosHV(A(a+b,1)),0]))
            moveAngles(point2angle([gripPosV(A(a+b,1)),0]))
            openHand(obj)
            moveAngles(point2angle([gripPosHV(A(a+b,1)),0]))
            A(a+b,1) = A(a,1)
            A(a,1) = A(a,2)
        end
    else
    end
end
moveAngles(point2angle([180,0,50,0]))
'Der VRob ist fertig'
else
    'Es muss zuerst gescannt werden'
end
end