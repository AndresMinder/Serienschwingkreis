function output = calculate(component, varargin)
syms t tau output(t)
switch (component)
    case 'current'
        try
            double(varargin{1});
            inputValue = varargin{1} * heaviside(t-1e-30);
        catch
            inputValue = varargin{1};
        end
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
    case 'range'
        
    otherwise
        % do nothing;
end
end