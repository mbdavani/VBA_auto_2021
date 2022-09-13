clear all;
clc;

syms a b c d e f g h j k l Rd Rj w n t

n = 8;
t = 1.75;
channel_weight = 98.7;
W = 7097.9; 
w = W/(n*t);

a = 276;
b = 0;
c = 33.125;
d = 41;
e = 73.125;
f = 113.125;
g = 153.125;
h = 193.125;
j = 227;
k = 233.375;
l = 274.25;

SFBM('Horizontal Beam d',[a,d,j],{'DF',-w,[b,b+t]},{'DF',-w,[c,c+t]},...
    {'DF',-w,[e,e+t]},{'DF',-w,[f,f+t]},{'DF',-w,[g,g+t]},...
    {'DF',-w,[h,h+t]},{'DF',-w,[k,k+t]},{'DF',-w,[l,l+t]})

% From FBD

Mmax_d = 49874.9

E = 29*10^6;                %lbf/in^2
Ix_over_depth = 3.9;        %in^3   W6X9#=2.8   W8x10# = 3.9
allowable_stress = 9000;    %lbf/in^2
sigma_max = - (Mmax_d)/(2*Ix_over_depth)