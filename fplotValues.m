function [] = fplotValues(plotelement ,inputValue, plotRange, R, L, C)
switch plotelement
    case 'inputCurrent'
        figure
        fplot(inputValue, plotRange)
        title('Eingangsstrom ie(t)')
        ylabel('ie(t) [A]')
        xlabel('t [s]')
        lgd = legend(['ie(t); R=' num2str(R) '; L=' num2str(L) '; C=' num2str(C)]);
        title(lgd,'Values');
        grid on
    case 'inputVoltage'
        figure
        fplot(inputValue, plotRange)
        title('Eingangsspannung ue(t)')
        ylabel('ue(t) [V]')
        xlabel('t [s]')
        lgd = legend(['ue(t); R=' num2str(R) '; L=' num2str(L) '; C=' num2str(C)]);
        title(lgd,'Values');
        grid on
    case 'resistanceVoltage'
        figure
        fplot(inputValue, plotRange)
        title('Widerstandsspannung uR(t)')
        ylabel('uR(t) [V]')
        xlabel('t [s]')
        lgd = legend(['uR(t); R=' num2str(R) '; L=' num2str(L) '; C=' num2str(C)]);
        title(lgd,'Values');
        grid on
    case 'inductanceVoltage'
        figure
        fplot(inputValue, plotRange)
        title('Induktivitätsspannung uL(t)')
        ylabel('uL(t) [V]')
        xlabel('t [s]')
        lgd = legend(['uL(t); R=' num2str(R) '; L=' num2str(L) '; C=' num2str(C)]);
        title(lgd,'Values');
        grid on
    case 'capacitanceVoltage'
        figure
        fplot(inputValue, plotRange)
        title('Kapazitätsspannung uC(t)')
        ylabel('uC(t) [V]')
        xlabel('t [s]')
        lgd = legend(['uC(t); R=' num2str(R) '; L=' num2str(L) '; C=' num2str(C)]);
        title(lgd,'Values');
        grid on
    otherwise
        % do nothing
end
end