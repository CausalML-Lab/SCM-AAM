function [y,Z] =take_action(a)
z = a-1;

u1 = double(rand()>=0.40);
u2 = double(rand()>=0.20);

u3 = double(rand()>=0.80);

u3;
if (z==2) z =u1; end
z;
x = xor(z,u2);
y = xor(x,u1*u3) | u3 ;

Z =  binaryVectorToDecimal(([z x y ])) + 1;

end