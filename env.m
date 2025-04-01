function [T0,p0,Tt0,pt0,c0] = env(H,Ma)
R = 287;
if H <= 11
    T0 = 288.15-6.5*H;
    p0 = 101.325*(1 - H/44.308)^5.2553;
else
    T0 = 216.7;
    p0 = 22.7*exp((11-H)/6.338);
end
k0 = 1.4;
a0 = sqrt(k0*R*T0);
c0 = a0*Ma;
pt0 = p0*(1 + (k0-1)/2*Ma^2)^(k0/(k0-1));
Tt0 = T0*(1 + (k0-1)/2*Ma^2);
end