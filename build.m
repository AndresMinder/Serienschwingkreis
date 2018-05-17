% Zum Sache probiere:
clear all; close all; clc

syms t ie(t) x
firstInitialValue = 0;  % Anfangsbedingungen sind = 0!
secondInitialValue = 0;

ue(t) = 2*t+10e-3+0.1/(20e-6)*int(x,x,0,t);
% ue(t) = sin(10*t);


R = 20;
L = 0.1;
C = 20e-6;

figure(1)
fplot(ue(t));
grid on;
title 'Ue(t)'

equ = diff(ue(t),t) == R*diff(ie(t),t) + L*diff(ie(t),t,2) + 1/C*ie(t);
Die(t) = diff(ie(t),t);
cond = [ie(0) == firstInitialValue, Die(0) == secondInitialValue];

ie(t) = dsolve(equ, cond);

figure(2)
fplot(ie(t));
grid on;
title 'ie(t)'

uR(t) = ie(t)*R;
uL(t) = L*diff(ie(t),t);
uC(t) = 1/C*int(ie(t),t,0,10);

% figure(3)
% fplot(uR(t))
% grid on;
% title 'UR(t)'
% figure(4)
% fplot(uL(t))
% grid on;
% title 'UL(t)'
% figure(5)
% fplot(uC(t))
% grid on;
% title 'UC(t)'


