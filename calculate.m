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
        % Berechnungen der Eingangsgroessen
        % Der Eingangsstrom wurde mittels der
        % Laplace-Transformierten der Differentialgleichung der Eingangs-
        % masche.
        % Dabei sind alle Anfangswerte gleich Null gesetzt.
        % =================================================================
        % de Teil klappt nit
        % 
        % equ = diff(ue, t) == L*diff(ie, t, 2) + R*diff(ie, t) + 1/C*ie;
        % Die(t) = diff(ie, t);
        % condition1 = ie(0) == sym('0');
        % condition2 = Die(0) == sym('0');
        % condition = [condition1, condition2];
        % 
        % ie(t) = dsolve(equ, condition);
        % % ie
        % =================================================================
        
        Ue(s) = laplace(inputValue);
        Ie(s) = (s*Ue(s)*1/L)/(s^2+R/L*s+1/(C*L));
        output(t) = ilaplace(Ie);
        
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