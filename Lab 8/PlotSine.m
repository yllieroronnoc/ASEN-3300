function [] = PlotSine(sine_array,representation)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
switch representation
    
    case 'volt'
        figure
        plot(sine_array)
        xlabel('Array Num')
        ylabel('Voltage [V]')
        
    case 'bin'
        plot(sine_array)
        xlabel('Array Num')
        ylabel('Bin Num')
end

