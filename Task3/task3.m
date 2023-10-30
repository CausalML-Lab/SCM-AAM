function [V,y] = task3(I,Ival)
Xint = find(I==1);

V(1)= rand(1) >= 0.51;
V(Xint) = Ival(Xint);



V(2) = rand(1) >= 0.15; 
V(Xint) = Ival(Xint);


U_v3 =  rand(1) >= 0.23;
U_v3y =  rand(1) >= 0.29;
V(3) = xor(or(V(1),U_v3),U_v3y);
V(Xint) = Ival(Xint);


U_v4 =  rand(1) >= 0.14;
V(4) = and(U_v4,V(2));
V(Xint) = Ival(Xint);


U_v5 =  rand(1) >= 0.10;
V(5) = or(xor(U_v5,V(3)),V(4));
V(Xint) = Ival(Xint);


U_v6 =  rand(1) >= 0.24;
V(6) = or(U_v6,V(4));
V(Xint) = Ival(Xint);







Uy =  rand(1) >= 0.14;
y =  xor(and(xor(xor(xor(V(5), V(6)),0), U_v3y), Uy),V(6));

V =binaryVectorToDecimal([V y]);


end