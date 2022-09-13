% Maintenance Monorail Analysis
clc;
clear all;

P = 669+22.8+29; %mass of motor + mass of trolley + mass of hoist chain
E = 29*10^6;
I = 68.9; %W10X15
l = 20*12;

delta_max = (P*l^3) / (48*E*I)
theta_max = (P*l^2)/(16*E*I)*180/pi
rise_over_run = delta_max/(l/2)