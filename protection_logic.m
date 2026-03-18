function [trip, fault] = protection(Ia, Ib, Ic, V)

trip = 0;
fault = 0;

Imax = max([Ia Ib Ic]);
Imin = min([Ia Ib Ic]);

% Overcurrent
if Imax > 10
    trip = 1;
    fault = 1;
end

% Under Voltage
if V < 180
    trip = 1;
    fault = 2;
end

% Over Voltage
if V > 250
    trip = 1;
    fault = 3;
end

% Earth Fault
if abs(Ia + Ib + Ic) > 1
    trip = 1;
    fault = 4;
end

% Imbalance
if (Imax - Imin) > 3
    trip = 1;
    fault = 5;
end
