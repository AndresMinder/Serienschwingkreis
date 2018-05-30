% *************************************************************************
% Projekt      : Serienschwingkreis
% Autor        : Nando Spiegel, Andres Minder
% Dateiname    : fplotValues.m
% Beginndatum  : 30.05.04.2018
% Enddatum     : -
% Version      : 1.1
% *************************************************************************
% Plotet alle Grössen in zwei verschiedenen Fenstern und beschriftet sie. 
% Aufgeteilt in die Eingangsgrössen ie(t) und ue(t) des Serienschwing-
% kreises.
% *************************************************************************
% 
% input variables:  - inputCurrent       : datatype "1x1 symfun"
%                   - inputVoltage       : datatype "1x1 symfun"
%                   - resistanceVoltage  : datatype "1x1 symfun"
%                   - inductanceVoltage  : datatype "1x1 symfun"
%                   - capacitanceVoltage : datatype "1x1 symfun"
%                   - plotRange          : datatype "1x2 double"

% output variables: - 
% *************************************************************************
%
% used functions:   - figure()
%                   - subplot()
%                   - fplot()
%                   - title()
%                   - ylabel()
%                   - xlabel()
% 
% input files:      -
% 
% output files:     -
% 
% *************************************************************************

function [] = fplotValues(inputCurrent ,inputVoltage, resistanceVoltage, inductanceVoltage, capacitanceVoltage, plotRange)

figure(1)
subplot(2,1,1)
fplot(inputCurrent, plotRange)
title('Eingangsstrom ie(t)')
ylabel('ie(t) [A]')
xlabel('t [s]')
grid on

subplot(2,1,2)
fplot(inputVoltage, plotRange)
title('Eingangsspannung ue(t)')
ylabel('ue(t) [V]')
xlabel('t [s]')
grid on

figure(2)
subplot(2,2,1)
fplot(resistanceVoltage, plotRange)
title('Widerstandsspannung uR(t)')
ylabel('uR(t) [V]')
xlabel('t [s]')
grid on

subplot(2,2,2)
fplot(inductanceVoltage, plotRange)
title('Induktivitätsspannung uL(t)')
ylabel('uL(t) [V]')
xlabel('t [s]')
grid on

subplot(2,2,[3 4])
fplot(capacitanceVoltage, plotRange)
title('Kapazitätsspannung uC(t)')
ylabel('uC(t) [V]')
xlabel('t [s]')
grid on
end