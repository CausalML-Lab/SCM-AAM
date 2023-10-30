function [q] = optimsolve(mhat,t,ct)
f = @(m) -1*m;
options = optimoptions('fmincon','Display', 'off');
q =  fmincon(f,0.5,[],[],[],[],[0],[1],@(m) constraint_nl(m,mhat,t,ct),options);

end