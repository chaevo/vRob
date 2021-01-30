function tauschvorgang
%Positionsdaten
scanPos1 = [250,-60,65]
scanPos2 = [250,0,65]
scanPos3 = [250,60,65]
scanPos4 = [310,-60,65]
scanPos5 = [310,0,65]
scanPos6 = [310,60,65]
scanPos7 = [370,-60,65]
scanPos8 = [370,0,65]
scanPos9 = [370,60,65]
gripPos1 = [250,-60,12]
gripPos2 = [250,0,12]
gripPos3 = [250,60,12]
gripPos4 = [310,-60,12]
gripPos5 = [310,0,12]
gripPos6 = [310,60,12]
gripPos7 = [370,-60,12]
gripPos8 = [370,0,12]
gripPos9 = [370,60,12]
gripPosV = [gripPos1;gripPos2;gripPos3;gripPos4;gripPos5;gripPos6;gripPos7;gripPos8;gripPos9]
scanPosV = [scanPos1;scanPos2;scanPos3;scanPos4;scanPos5;scanPos6;scanPos7;scanPos8;scanPos9]
zwischenPos = [160,0,12]
A=[0,0;1,0;2,0;0,1;0,1;2,1] %später ersetzen mit Scan und eingabe A
%Farbe -1 auch implementieren
%Semikolon einfügen
%anständige Kommentare
%eventuell vor und nach Greifen erstmal ein stück hoch
%Wartefunktion vor nächster Bewegung
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
            point2angle([gripPosV(zwischenV(b),:),0])
            closeHand(obj)
            point2angle([zwischenPos,0])
            openHand(obj)
            %Kippt den Würfel auf der zwischenPos
            point2angle([160,0,12,40])
            closeHand(obj)
            point2angle([160,0,24,40])
            point2angle([160,0,24,-50])
            point2angle([160,0,12,-50])
            openHand(obj)
            %Ende Kippfunktion
            point2angle([160,0,65,90]) %Scanpos auf zwischenPos
            zwcolor=rob.getSensorColor()%Funktioniert Sensorcolor?
            if zwcolor~=2
               %Dreht den Würfel über seine Hochachse
               point2angle([zwischenPos,0])
               closeHand(obj)
               point2angle([160,0,24,0])
               wristrot(90)%Richtige Funktion suchen
               point2angle([zwischenPos,0])
               openHand(obj)
               wristrot(0)
               %Ende Drehung
               %Kippfunktion
               point2angle([160,0,12,40])
               closeHand(obj)
               point2angle([160,0,24,40])
               point2angle([160,0,24,-50])
               point2angle([160,0,12,-50])
               openHand(obj)
               %Ende Kippfunktion
            else
            A(zwischenV(b),1)=2
            end
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
            point2angle([gripPosV(zwischenV(b),:),0])
            closeHand(obj)
            point2angle([zwischenPos,0])
            openHand(obj)
            %Kippt den Würfel auf der zwischenPos
            point2angle([160,0,12,40])
            closeHand(obj)
            point2angle([160,0,24,40])
            point2angle([160,0,24,-50])
            point2angle([160,0,12,-50])
            openHand(obj)
            %Ende Kippfunktion
            point2angle([160,0,65,90]) %Scanpos auf zwischenPos
            zwcolor=rob.getSensorColor()%Funktioniert Sensorcolor?
            if zwcolor~=a
               %Dreht den Würfel über seine Hochachse
               point2angle([zwischenPos,0])
               closeHand(obj)
               point2angle([160,0,24,0])
               wristrot(90)%Richtige Funktion suchen
               point2angle([zwischenPos,0])
               openHand(obj)
               wristrot(0)
               %Ende Drehung
               %Kippfunktion
               point2angle([160,0,12,40])
               closeHand(obj)
               point2angle([160,0,24,40])
               point2angle([160,0,24,-50])
               point2angle([160,0,12,-50])
               openHand(obj)
               %Ende Kippfunktion
            else
            end
            A(zwischenV(b),1)= a
    end
   end
end
end