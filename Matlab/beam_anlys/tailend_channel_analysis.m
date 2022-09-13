clear all;
clc;

syms a b c d w Rb Rc Rd E Ix

a = 173.1875;   %in
b = 10.875;     %in
c = 78.875;     %in
d = 126.875;    %in

E = 29*10^6             %lbf/in^2
Ix = 7.49               %in^4
allowable_stress = 9000 %lbf/in^2

grating_area = 276 * 174.1875;                                      %in^2
grating_weight_per_sq_in = 8.87/144;                                %lbf/in^2
grating_weight = grating_area * grating_weight_per_sq_in;           %lbf
weight_fence = 477;                                                 %lbf
weight_handrails = 761.2;                                           %lbf
liveload = 40/144 * grating_area;                                   %lbf
W = grating_weight + weight_fence + weight_handrails + liveload;    %lbf
w = W/a;                                                            %lbf/in

eqn = ((w*(c - b))/(24*E*Ix))*((d - b)^3 - 2*(d - b)*(c - b)^2+(c - b)^3)...
    == ((Rc*(c-b))/(12*E*Ix))*(3*(d-b)^2/4-(c-b)^2);
Rc = solve(eqn, Rc);

eqn = 0 == ((c - b)*Rc+(d - b)*Rd-.5*a*w*(a - 2*b))/(b - d);
Rd = solve(eqn, Rd);

eqn = 0 == Rb + Rc + Rd - w*a;
Rb = solve(eqn, Rb);

% fprintf('[a b c d w Rb Rc Rd E Ix]\n')
% vpa([a b c d w Rb Rc Rd E Ix],6)

fprintf('[w Rb Rc Rd]\n')
w = double(w);
Rb = double(Rb);
Rc = double(Rc);
Rd = double(Rd);

[w Rb Rc Rd]
SFBM('Tail End Platform Channel',[a,b,d],{'CF',Rc,c},{'DF',-w,[0,a]});

Mmax = 109116; %lbf*in (copied over from Bending Moment Diagram)

n = 8       %number of channels

sigma_max = - (Mmax * 2.5)/(Ix*n)

max_deflection = (w*(a-d)^4)/(8*E*Ix*n) %this occurs at the cantilever end