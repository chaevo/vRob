function [A]= sollWerte1(A)

matrixA = A

switch matrixA(1,2)
    case -1
        matrixA(1,2) = matrixA(1,2) +1
        
    case 0
        matrixA(1,2) = matrixA(1,2) +1
        
    case 1
        matrixA(1,2) = matrixA(1,2) +1
        
    case 2
        matrixA(1,2) = matrixA(1,2) -2
        
    otherwise
        disp('Fehler')
        
end
 
A=matrixA

end
