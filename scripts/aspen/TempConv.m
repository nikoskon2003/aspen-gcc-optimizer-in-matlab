function T = TempConv(Tin, units)
    T = Tin;
    if units == 'C'
        T = Tin + 273.15;
    end
    if units == 'F'
        T = (Tin + 459.67) * 5/9;
    end
    if units == 'R'
        T = Tin * 5/9;
    end
end