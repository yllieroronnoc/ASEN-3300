%% House keeping
clear all;
close all;
%% Data
f = [10 20 50 100 200 500 1000 2000 5000 10000 20000 50000]; %Hz
gain = [6.43 6.584 6.384 6.333 6.333 5.6969 5.6969 5.6969 5.070 1.459 -1.626 -5.811]; %dB


length(f)
length(gain)
%% Semilog plot
figure('Name','Bode plot ex2')
semilogx(f,gain,'b')
hold on
% Plot -3dB striaght line at 6.43 - 3 db
line([10,50000],[3.43,3.43])
scatter(f,gain)
grid on 
xlabel('frequency [Hz]')
ylabel('Gain [dBV_{pp}]')
title('Bode plot for LM358p inverting op-amp')
legend('measured gain square wave', '-3 dB','Location','southwest')

%% curve fit open loop  response
p = polyfit(f(9:end),gain(9:end),3);
f_2 = 5000:0.1:50000;
gain_2 = polyval(p,f_2);
plot(f_2,gain_2,'r')

%% Find value closest to -3 dB freq
[~,index] = (min(abs(gain_2 - 3.333))); %-3 db on graph

cuttoff_freq = f_2(index)