% *************************************************************************
% Projekt      : Serienschwingkreis
% Autor        : Nando Spiegel, Andres Minder
% Dateiname    : calculate.m
% Beginndatum  : 30.05.04.2018
% Enddatum     : -
% Version      : 1.2
% *************************************************************************
% Anhand des Eingabeparameters "component" kann definiert werden, welche
% Berechnung gemacht werden soll. "inputValue" entspricht dabei dem für die
% Berechnung notwendige Grösse.
% *************************************************************************
% 
% input variables:  - inputValue(t) : datatype "1x1 symfun"
%                   - component     : datatype 'string'
%                   
% 
% output variables: - output(t) : datatype "1x1 symfun"
% *************************************************************************
%
% used functions:   - switch()
%                   - diff()
%                   - int()
%                   - laplace()
%                   - ilaplace()
%                   - dsolve()
% 
% input files:      -
% 
% output files:     -
% 
% *************************************************************************

function output = calculate(component, inputValue)

syms s t tau output(t)

R = 20;
L = 0.1;
C = 20e-6;

switch (component)
    case 'current'        
        equ = diff(inputValue, t) == L*diff(output, t, 2) + R*diff(output, t) + 1/C*output;
        Doutput(t) = diff(output, t);
        condition1 = output(0) == sym('0');
        condition2 = Doutput(0) == sym('0');
        condition = [condition1, condition2];
        
        output(t) = dsolve(equ, condition);
        
    case 'resistance'
        output(t) = R*inputValue;
        
    case 'inductor'
        output(t) = L*diff(inputValue,t);
        
    case 'capacitor'
        output(t) = 1/C * int(inputValue(tau), tau, 0, t);
        
    otherwise
        % do nothing;
end
end