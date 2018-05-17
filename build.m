% Zum Sache probiere:
clear all; close all; clc

syms t ie(t) x tau

range = [0,1e-2];
firstInitialValue = 0;  % Anfangsbedingungen sind = 0!
secondInitialValue = 0;

R = 20;
L = 0.1;
C = 20e-6;

% ue(t) = R*100*t + 100*L + 100/C*int(x,x,0,t);
ue(t) = sym('5');


figure(1)
fplot(ue(t));
grid on;
title 'Ue(t)'

equ = diff(ue(t),t) == R*diff(ie(t),t) + L*diff(ie(t),t,2) + 1/C*ie(t);
Die(t) = diff(ie(t),t);
cond = [ie(0) == firstInitialValue, Die(0) == secondInitialValue];

% ie(t) = dsolve('Due = Die * R + L * D2ie + 1/C * ie','ie(0)=0','Die(0)=0','t');

figure(2)
fplot(@(t)ie(t), range, 'g')
grid on;
title 'ie(t)'

uR(t) = ie(t)*R;
uL(t) = L*diff(ie(t),t);
uC(t) = 1/C*int(ie(tau),tau,0,t);

figure(3)
fplot(@(t)uR(t),range)
grid on;
title 'UR(t)'
figure(4)
fplot(@(t)uL(t),range)
grid on;
title 'UL(t)'
figure(5)
fplot(@(t)uC(t),range)
grid on;
title 'UC(t)'


