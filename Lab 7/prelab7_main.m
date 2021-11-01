%{
    Author: Connor O'Reilly
    Last Edited: 3/10/2021
    Purpose: used for questions 3 and 4 of prelab 7
%}
%% Housekeeping
clear all;
close all;

%% Q3
min_voltage = 0;
max_voltage = 3.3;
%initialize voltages and bits
voltages = [0 0.25 0.5 0.75 1 1.25 1.5 1.75 2 2.25 2.5 2.75 3 3.25];
bits = [4, 8 , 12];

%loop through all bits
for i = bits
    %create new fig 
    figure('Name', strcat(num2str(i),' bits [decimal]'));
    hold on;
    grid on;
    title(strcat('Bin number [ decimal ] vs. Voltage, Bits: ',num2str(i)))
    xlabel('Voltage [ V ]')
    ylabel('bin [decimal]')
    %assign voltage to bin
    for j = 1:length(voltages)
        bin(j) = Voltage2Bin(voltages(j),min_voltage,max_voltage,i);
    end 
    plot(voltages,bin)
    yticks(bin) %adjust ticks to occur only at bins
    
    %convert decimal bins to binary and plot
    %will just convert the bin number to a character string representing 
    % the bin number in base 2
    bins2binary = dec2bin(bin);
    figure('Name', strcat(num2str(i),' bits [binary]'));
    hold on;
    grid on;
    title(strcat('Bin number [ binary ] vs. Voltage, Bits: ',num2str(i)))
    yticks(bin)
    yticklabels(bins2binary)
    xlabel('Voltage [ V ]')
    ylabel('bin [binary]')
    plot(voltages,bin)
end

% Q4

% % get voltage inputs using sin wave eqn
% % set time scale for one period
% t = 0:0.001:1;
% v = 1.00 + sin(2*pi*10*t);
% %initialize bits
% bits = 12;
% %get range
% max_voltage = max(v);
% min_voltage = min(v);
% k = 1; %iterator for indexing 
% for i = v
%    bins(k) = Voltage2Bin(i,min_voltage,max_voltage,bits);
%    k = k + 1;
% end
% %plot figure
% figure('Name', 'binvarr')
% hold on;
% grid on;
% title('Bin Number vs. Array Number')
% xlabel('array number')
% ylabel('bin number')
% plot([1:length(v)],bins)
% 
