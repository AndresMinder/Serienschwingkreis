% *************************************************************************
% Projekt      : Serienschwingkreis
% Autor        : Nando Spiegel, Andres Minder
% Dateiname    : Main.m
% Beginndatum  : 15.04.2018
% Enddatum     : -
% Version      : 1.0
% *************************************************************************
% Das main.m file dient als Startsequenz des ganzen Projektes 
% "Serienschwingkreis". Es startet in einer Funktion das Graphical User
% Interface, in welchem dann vom User selbst Bearbeitungen vorgenommen
% werden können, wie z.B. das Eintragen von den Werten der passiven
% Netzwerkelementen und auch der Eingangsspannung u(t).
% *************************************************************************
% 
% global variables: -
% 
% *************************************************************************
% 
% used functions:   varargout = hauptmenue(varargin);
% 
% input files:      -
% 
% output files:     -
% 
% *************************************************************************

% setup
clear all; close all; clc
syms s t ue(t) ie(t)

% Vom User zu bestimmende Groessen
ue(t) = 10*heaviside(t-1e-30);
range = [0, 0.1];
R = 20;
L = 0.1;
C = 20e-6;

% Berechnungen
ie(t) = simplify(calculate('current',ue));
uR(t) = (calculate('resistance',ie));
uL(t) = (calculate('inductor',ie));
uC(t) = (calculate('capacitor',ie));

% Ploten aller Grössen
fplotValues(ie,ue,uR,uL,uC,range);
