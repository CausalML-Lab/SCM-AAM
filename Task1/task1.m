function [V,y] = task1(I,Ival)
Xint = find(I==1);

V(1)= rand(1) >= 0.4;
Ux =rand(1) >= 0.89;
Uxy=rand(1) >= 0.49;
Uy = rand(1) >= 0.85;
V(Xint) = Ival(Xint);
V(2) = xor(xor(V(1),Ux),Uxy);
V(Xint) = Ival(Xint);
y = xor(xor(xor(V(2),Uy),Uxy),1);
V =binaryVectorToDecimal([V y]);


end