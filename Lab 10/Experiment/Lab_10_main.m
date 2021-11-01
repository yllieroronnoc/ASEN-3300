% % {
% %         Lab 10 main driver script
% %         Author: Connor O'Reilly
% %         Last Modified: 04/12/2021
% % }
% 
% % House Keeping
% clc; clear all; close all;
% %% 5.1.c - FFT of 5khz signal up to 60 kHz
% signal_5kHz = readmatrix('lab10_section01_signal5kHz.csv');
% fs_5kHz = 400000; %Hz
% num_samp_5kHz = 8192;
% t_5kHz = signal_5kHz(:,1);
% v_5kHz = signal_5kHz(:,2);
% 
% % Time domain 
% figure('Name','Signal 7 time domain');
% plot(t_5kHz , v_5kHz);
% hold on;
% title('5 kHz Signal V as a function of t');
% xlabel('time [s]');
% ylabel('voltage [V]');
% grid on;
% hold off;
% 
% % frequency domain 
% [fX5, dBX5] = FFT_function(fs_5kHz,  v_5kHz); 
% 
% %find index closest to 60 kHz
% [~,i] = min( abs(fX5 - 60000) );
% 
% % Plot FFT:
% figure('Name','freq 5kHz');
% semilogx(fX5(1:i),dBX5(1:i),'LineWidth',1);
% title('Frequency domain for 5 kHz Signal');
% xlabel('f [Hz]');
% ylabel('dB');
% grid on;
% 
% %% 5.1.d - FFT of 4khz signal up to 60 kHz
% signal_4kHz = readmatrix('lab10_section01_signal4kHz.csv');
% fs_4kHz = 400000; %Hz
% num_samp_4kHz = 8192;
% t_4kHz = signal_4kHz(:,1);
% v_4kHz = signal_4kHz(:,2);
% 
% % Time domain 
% figure('Name','time 4kHz');
% plot(t_4kHz , v_4kHz);
% hold on;
% title('4 kHz Signal V as a function of t');
% xlabel('time [s]');
% ylabel('voltage [V]');
% grid on;
% hold off;
% 
% % frequency domain 
% [fX4, dBX4] = FFT_function(fs_4kHz,  v_4kHz); 
% 
% %find index closest to 60 kHz
% [~,i] = min( abs(fX4 - 60000) );
% 
% % Plot FFT:
% figure('Name','freq 4kHz');
% semilogx(fX4(1:i),dBX4(1:i),'LineWidth',1);
% title('Frequency domain for 4 kHz Signal');
% xlabel('f [Hz]');
% ylabel('dB');
% grid on;
%     
% %% 5.1.d - FFT of 4khz signal without diode up to 60 kHz
% signal_4kHznd = readmatrix('lab10_section01_signal4kHz_NoDiode.csv');
% fs_4kHznd = 400000; %Hz
% num_samp_4kHznd = 8192;
% t_4kHznd = signal_4kHznd(:,1);
% v_4kHznd = signal_4kHznd(:,2);
% 
% % Time domain 
% figure('Name','time 4kHznd');
% plot(t_4kHznd , v_4kHznd);
% hold on;
% title('4 kHz Signal with no diode, V as a function of t');
% xlabel('time [s]');
% ylabel('voltage [V]');
% grid on;
% hold off;
% 
% % frequency domain 
% [fX4nd, dBX4nd] = FFT_function(fs_4kHznd,  v_4kHznd); 
% 
% %find index closest to 60 kHz
% [~,i] = min( abs(fX4nd - 60000) );
% 
% % Plot FFT:
% figure('Name','freq 4kHznd');
% semilogx(fX4nd(1:i),dBX4nd(1:i),'LineWidth',1);
% title('Frequency domain for 4 kHz Signal with no diode');
% xlabel('f [Hz]');
% ylabel('dB');
% grid on;
% %% 5.1.h - FFT of 2 signals without diode up to 60 kHz
% signal_2_5vppnd = readmatrix('lab10_section01_signal2WGen_NoDiode.csv');
% fs_2_5vppnd = 800000; %Hz
% num_samp_2_5vppnd = 8192;
% t_2_5vppnd = signal_2_5vppnd(:,1);
% v_2_5vppnd = signal_2_5vppnd(:,2);
% 
% % Time domain 
% figure('Name','time 2 5vppnd');
% plot(t_2_5vppnd , v_2_5vppnd);
% hold on;
% title('20kHz and 24.8 kHz 5 Vpp Signals with no diode, V as a function of t');
% xlabel('time [s]');
% ylabel('voltage [V]');
% grid on;
% hold off;
% 
% % frequency domain 
% [fX2_5vppnd, dBX2_5vppnd] = FFT_function(fs_2_5vppnd,  v_2_5vppnd); 
% 
% %find index closest to 60 kHz
% [~,i] = min( abs(fX2_5vppnd - 60000) );
% 
% % Plot FFT:
% figure('Name','freq 2 5 Vppnd');
% semilogx(fX2_5vppnd(1:i),dBX2_5vppnd(1:i),'LineWidth',1);
% title('Frequency domain for 20kHz and 24.8 kHz 5 Vpp Signals with no diode');
% xlabel('f [Hz]');
% ylabel('dB');
% grid on;
%% 5.1.i - FFT of 2 signals with diode up to 60 kHz
signal_2_5vpp = readmatrix('lab10_section01_signal2WGen.csv');
fs_2_5vpp = 800000; %Hz
num_samp_2_5vpp = 8192;
t_2_5vpp = signal_2_5vpp(:,1);
v_2_5vpp = signal_2_5vpp(:,2);

% Time domain 
% figure('Name','time 2 5vpp');
% plot(t_2_5vpp , v_2_5vpp);
% hold on;
% title('20kHz and 24.8 kHz 5 Vpp Signals with diode, V as a function of t');
% xlabel('time [s]');
% ylabel('voltage [V]');
% grid on;
% hold off;
% 
% % frequency domain 
% [fX2_5vpp, dBX2_5vpp] = FFT_function(fs_2_5vpp,  v_2_5vpp); 
% 
% %find index closest to 60 kHz
% [~,i] = min( abs(fX2_5vpp - 60000) );
% 
% % Plot FFT:
% figure('Name','freq 2 5 Vpp');
% semilogx(fX2_5vpp(1:i),dBX2_5vpp(1:i),'LineWidth',1);
% title('Frequency domain for 20kHz and 24.8 kHz 5 Vpp Signals with diode');
% xlabel('f [Hz]');
% ylabel('dB');
% grid on;
%     
% %% 5.3.c - FFT of am signal mod depth 50%
% signal_am50 = readmatrix('lab10_section03_signalAM50.csv');
% fs_am50 = 400000; %Hz
% num_samp_am50 = 8192;
% t_am50 = signal_am50(:,1);
% v_am50 = signal_am50(:,2);
% 
% % Time domain 
% figure('Name','time am 50');
% plot(t_am50 , v_am50);
% hold on;
% title('modulation index 50% V as a function of t');
% xlabel('time [s]');
% ylabel('voltage [V]');
% grid on;
% hold off;
% 
% % frequency domain 
% [fX_am50, dBX_am50] = FFT_function(fs_am50,  v_am50); 
% 
% %find index closest to 60 kHz
% [~,i] = min( abs(fX_am50 - 60000) );
% 
% % Plot FFT:
% figure('Name','freq am 50');
% semilogx(fX_am50(1:i),dBX_am50(1:i),'LineWidth',1);
% title('Frequency domain for AM voltage source with modulation index = 50%');
% xlabel('f [Hz]');
% ylabel('dB');
% grid on;
% %% 5.3.e - FFT of am signal mod depth 50%
% signal_am100 = readmatrix('lab10_section03_signalAM100.csv');
% fs_am100 = 400000; %Hz
% num_samp_am100 = 8192;
% t_am100 = signal_am100(:,1);
% v_am100 = signal_am100(:,2);
% 
% % Time domain 
% figure('Name','time am 50');
% plot(t_am100 , v_am100);
% hold on;
% title('modulation index 100% V as a function of t');
% xlabel('time [s]');
% ylabel('voltage [V]');
% grid on;
% hold off;
% 
% % frequency domain 
% [fX_am100, dBX_am100] = FFT_function(fs_am100,  v_am100); 
% 
% 
% 
% % Plot FFT:
% figure('Name','freq am 50');
% semilogx(fX_am100,dBX_am100,'LineWidth',1);
% title('Frequency domain for AM voltage source with modulation index = 100%');
% xlabel('f [Hz]');
% ylabel('dB');
% grid on;

%% 5.3.f - FFT of am signal mod depth 100% Fi 100 Hz -> 2 kHz
signal_am100_2kHz = readmatrix('lab10_section03_signalAM100_2kHz.csv');
singal_FR = readmatrix('lab10_section02_FResponse.csv');
fs_am100_2kHz = 160000; %Hz
num_samp_am100_2kHz = 8192;
t_am100_2kHz = signal_am100_2kHz(:,1);
v_am100_2kHz = signal_am100_2kHz(:,2);

% Time domain 
figure('Name','time am 100 2k');
plot(t_am100_2kHz , v_am100_2kHz);
hold on;
title('1 kHz, V as a function of t');
xlabel('time [s]');
ylabel('voltage [V]');
grid on;
hold off;

% frequency domain 
[fX_am100_2kHz, dBX_am100_2kHz] = FFT_function(fs_am100_2kHz,  v_am100_2kHz); 



% Plot FFT:
figure('Name','freq am 100 kHz');
semilogx(fX_am100_2kHz,dBX_am100_2kHz,'LineWidth',1);
title('Frequency domain for 1 kHz');
xlabel('f [Hz]');
ylabel('dB');
grid on;

% figure(3)
% semilogx(singal_FR(:,1) , singal_FR(:,2))
% hold on;
% title('Frequency Spectrum for SK filter')
% xlabel('frequency [ Hz ]')
% ylabel('Amplitude [ dB ] ')
% grid on;
% hold off;