%part of lab 6 code 

%% House keeping
clear all;
close all;
%% Data
f = [10 20 50 100 200 500 1000 2000 5000 10000 20000 50000]; %Hz
gain = [6.43 6.594 6.384 6.33 5.6969 5.6969 5.6969 5.070 1.459 -1.626 -5.811]; %dB

%% Semilog plot
semilog(f,gain)
