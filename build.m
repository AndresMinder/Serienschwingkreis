% Zum Sache probiere:
clear all; close all; clc
% =========================================================================

% Festlegungen
syms s t ue(t) ie(t)

% Vom User zu bestimmende Groessen
ue(t) = 10*heaviside(t-1e-30);
range = [0, 0.1];
R = 20;
L = 0.1;
C = 20e-6;


% Berechnungen
ie(t) = calculate('current',ue);
uR(t) = calculate('resistance',ie);
uL(t) = calculate('inductor',ie);
uC(t) = calculate('capacitor',ie);

% Ploten aller Grössen
fplotValues(ie,ue,uR,uL,uC,range);