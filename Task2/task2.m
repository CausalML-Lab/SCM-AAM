function [V,y] = task3(I,Ival)
Xint = find(I==1);

V(1)= rand(1) >= 0.55;
V(Xint) = Ival(Xint);



Uz =  rand(1) >= 0.95;
Uyz =  rand(1) >= 0.46;
V(2) = xor(Uyz,Uz);
V(Xint) = Ival(Xint);


Uw =  rand(1) >= 0.93;
Uwx =  rand(1) >= 0.49;
V(3) = xor(xor(V(1),Uw),Uwx);
V(Xint) = Ival(Xint);


Ux =  rand(1) >= 0.94;
V(4) = xor(xor(xor(1,V(2)),Ux),Uwx);
V(Xint) = Ival(Xint);


Uy =  rand(1) >= 0.94;
y = xor(xor(xor(V(3),V(4)),Uy),Uyz);
V =binaryVectorToDecimal([V y]);


end