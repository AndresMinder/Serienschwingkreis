% Zum Sache probiere:
clear all; close all; clc
% =========================================================================

% Festlegungen
syms s t ue(t) ie(t)

R = 20;
L = 0.1;
C = 20e-6;

% Vom User zu bestimmende Groessen
ue(t) = 100;
range = [0, 0.1];

ie(t) = calculate('current',ue);

% Berechnungen der Spannungen aller passiver Bauelemente
uR = calculate('resistance',ie);
uL = calculate('inductor',ie);
uC = calculate('capacitor',ie);

% Plot aller Grössen
fplotValues(ie,ue,uR,uL,uC,range);