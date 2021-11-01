function [bin] = Voltage2Bin(x,min_voltage,max_voltage, bits)
% Determines the bin number in both binary and decimal for a given
% Voltage signal that would be plaecd in by an A/D converter
%% Decimal 
Range = max_voltage - min_voltage;
num_levels = 2^bits;
LSB = Range/num_levels;

%% Binary representation
% binary number

%% Assign Voltage to bin
bin = floor(x/LSB);
end

