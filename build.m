% Zum Sache probiere:
clear all; close all; clc
% =========================================================================

% Festlegungen
syms s t tau ue(t) ie(t)

% Vom User zu bestimmende Grössen
ue(t) = 10;
range = [0, 0.1];
R = 20;
L = 0.1;
C = 20e-6;

% Berechnungen der Eingangsgrössen
% Der Eingangsstrom wurde mittels der
% Laplace-Transformierten der Differentialgleichung der Eingangsmasche.
% Dabei sind alle Anfangswerte gleich Null gesetzt.
Ue(s) = laplace(ue);
Ie(s) = (s*Ue(s)*1/L)/(s^2+R/L*s+1/(C*L));
ie(t) = ilaplace(Ie);

% Plot der Eingangsgrössen
figure(1)
subplot(2,1,1)
fplot(ie, range)
title('Eingangsstrom ie(t)')
ylabel('ie(t) [A]')
xlabel('t [s]')
grid on

subplot(2,1,2)
fplot(ue, range)
title('Eingangsspannung ue(t)')
ylabel('ue(t) [V]')
xlabel('t [s]')
grid on

% Berechnungen der Spannungen aller passiver Bauelemente
uR(t) = R*ie;
uL(t) = L*diff(ie,t);
uC(t) = 1/C * int(ie(tau), tau, 0, t);

% Ploten der Spannungen aller passiver Bauelemente
figure(2)
subplot(2,2,1)
fplot(uR, range)
title('Widerstandsspannung uR(t)')
ylabel('uR(t) [V]')
xlabel('t [s]')
grid on

subplot(2,2,2)
fplot(uL, range)
title('Induktivitätsspannung uL(t)')
ylabel('uL(t) [V]')
xlabel('t [s]')
grid on

subplot(2,2,[3 4])
fplot(uC, range)
title('Kapazitätsspannung uC(t)')
ylabel('uC(t) [V]')
xlabel('t [s]')
grid on





















