function T = InverseTempConv(Tin, units)
    T = Tin;
    if units == 'C'
        T = Tin - 273.15;
    end
    if units == 'F'
        T = Tin * 9/5 - 459.67;
    end
    if units == 'R'
        T = Tin * 9/5;
    end
end