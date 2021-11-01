%% House Keeping 
clear; 
clc;

%% Download
   
% Read signals, col1 = time (s), col2 = voltage(V)
signal7 = readmatrix('lab06_section04_signal7in.csv');
signal9 = readmatrix('lab06_section04_signal9in');
signal11 = readmatrix('lab06_section04_signal11in');
Fs = 1600; %Hz

%% Time domain
%Plot Signals in time domain:

%Signal 7
figure('Name','Signal 7 time domain');
plot(signal7(:,1),signal7(:,2));
title('Signal 7 V as a function of t');
xlabel('time [s]');
ylabel('voltage [V]');
grid on

%Signal 9
figure('Name','Signal 9 time domain');
plot(signal9(:,1),signal9(:,2));
title('Signal 9 V as a function of t');
xlabel('time [s]');
ylabel('voltage [V]');
grid on

%Signal 11
figure('Name','Signal 11 time domain');
plot(signal11(:,1),signal11(:,2));
title('Signal 11 V as a function of t');
xlabel('time [s]');
ylabel('voltage [V]');
grid on

%% FFT

%signal 7
[fX, dBX] = FFT_function(Fs, signal7(:,2)); 

% Plot FFT:
figure(1);
semilogx(fX,dBX,'LineWidth',1);
title('Frequency domain for X input');
xlabel('f [Hz]');
ylabel('dB');
grid on;


% 
% %% Section 2
% 
% % sine signal 
% %load file
% 
% signal4 = load('lab04_section02_signalSine.mat');
% 
% 
% % FFT Function call:
% [fX, dBX] = FFT_function(signal4.Fs, signal4.ch1); 
% 
% % Plot FFT:
% figure(2);
% semilogx(fX,dBX,'LineWidth',1);
% title('Frequency domain for X input');
% xlabel('f [Hz]');
% ylabel('dB');
% grid on; 
% 
% % square signal 
% %load file
% 
% signal5 = load('lab04_section02_signalSquare.mat');
% 
% 
% % FFT Function call:
% [fX, dBX] = FFT_function(signal5.Fs, signal5.ch1); 
% 
% % Plot FFT:
% figure(3);
% semilogx(fX,dBX,'LineWidth',1);
% title('Frequency domain for X input');
% xlabel('f [Hz]');
% ylabel('dB');
% grid on; 
%     