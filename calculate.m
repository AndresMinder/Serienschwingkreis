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
% 
% 'current':    Benötigt die Eingangsspannung ue(t) und die Dimensionen des
%               RLC-Netzwerkes.
% 'resistance': Benötigt den Eingangsstrom ie(t) und die Dimension des
%               Widerstandes R.
% 'inductor':   Benötigt den Eingangsstrom ie(t) und die Dimension der
%               Induktivität L.
% 'capacitor':  Benötigt den Eingangsstrom ie(t) und die Dimension der
%               Kapazität C.
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

function output = calculate(component, varargin)

syms t tau output(t)


switch (component)
    case 'current'
        inputValue = varargin{1} * heaviside(t-1e-30);
        R = varargin{2};
        L = varargin{3};
        C = varargin{4};
        
        equ = diff(inputValue, t) == L*diff(output, t, 2) + R*diff(output, t) + 1/C*output;
        Doutput(t) = diff(output, t);
        condition1 = output(0) == sym('0');
        condition2 = Doutput(0) == sym('0');
        condition = [condition1, condition2];
        
        output(t) = dsolve(equ, condition);
        
    case 'resistance'
        inputValue = varargin{1};
        R = varargin{2};
        output(t) = R*inputValue;
        
    case 'inductor'
        inputValue = varargin{1};
        L = varargin{2};
        output(t) = L*diff(inputValue,t);
        
    case 'capacitor'
        inputValue = varargin{1};
        C = varargin{2};
        output(t) = 1/C * int(inputValue(tau), tau, 0, t);
        
    otherwise
        % do nothing;
end
end