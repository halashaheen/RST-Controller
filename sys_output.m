function [Yp Xp Xd]=sys_output(xp,xd,Ap,Bp,Cp,Dp,Apd,Bpd,Cpd,Dpd,u)
%#codegen
Yp = Cp*xp + Dp*u;
yd = Cpd*xd + Dpd*u;
Yp=Yp-0.25*yd;
Xp =Ap*xp + Bp*u;  
Xd =Apd*xd + Bpd*u; 
end
