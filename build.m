% Zum Sache probiere:
clear all; close all; clc

syms t ie(t)
firstInitialValue = 0;
secondInitialValue = 0;

ue(t) = sin(2*pi*0.5*t);

R = 1e3;
L = 1e-3;
C = 1e-6;

fplot(ue(t));
grid on;
hold on;

equ = diff(ue(t),t) == R*diff(ie(t),t) + L*diff(ie(t),t,2) + 1/C*ie(t);
Die(t) = diff(ie(t),t);
cond = [ie(0) == firstInitialValue, Die(0) == secondInitialValue];

ie(t) = dsolve(equ, cond);

fplot(ie(t));

