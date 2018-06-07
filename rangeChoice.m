function range = rangeChoice(val)
switch val
    case 1
        range = [0 1e-3];
    case 2
        range = [0 10e-3];
    case 3
        range = [0 100e-3];
    case 4
        range = [0 1];
    case 5
        range = [0 5];
end
end