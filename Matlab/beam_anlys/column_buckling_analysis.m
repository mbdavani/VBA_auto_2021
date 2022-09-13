clear all;
clc;

syms F E I k L n

n = 4;
E = 29*10^6;
I = 30.8;
k = (1 / n)^0.5;
L = 305.85;

F = pi^2 * E * I /(k * L)^2