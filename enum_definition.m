if ~exist('Bearing', 'class') 
    Simulink.defineIntEnumType('Bearing', {'North', 'NorthEast', 'East', 'SouthEast', 'South', 'SouthWest', 'West', 'NorthWest'} , [0;1;2;3;4;5;6;7]);
end
