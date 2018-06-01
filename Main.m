% *************************************************************************
% Projekt      : Serienschwingkreis
% Autor        : Nando Spiegel, Andres Minder
% Dateiname    : Main.m
% Beginndatum  : 15.04.2018
% Enddatum     : -
% Version      : 1.3
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

while 1
    values = Hauptmenu();
    % Überprüfung ob das Fenster einfach nur geschlossen wurde
    try
        if values == 0
            break;
        end
    catch
        ue(t) = values.InputVoltage;
        ie(t) = simplify(calculate('current',values.InputVoltage, values.Resistance, values.Inductor, values.Capacitor));
        uR(t) = calculate('resistance',ie, values.Resistance);
        uL(t) = calculate('inductor',ie, values.Inductor);
        uC(t) = calculate('capacitor',ie, values.Capacitor);
        
        fplotValues(ie,ue,uR,uL,uC,[0 0.1]);
    end
    
    answer = questdlg('Möchten Sie noch eine weitere Funktion Ploten?', 'Frage', 'Ja', 'Nein', 'Ja');
    switch answer
        case 'Ja'
            continue;
        case 'Nein'
            break;
        otherwise
            % do nothing;
    end
end
