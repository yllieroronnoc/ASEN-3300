%% House Keeping 
clear all;
close all;
clc;

%% Download
   
% Read signals, col1 = time (s), col2 = voltage(V)
signal_10hz =  readmatrix('lab07_section03_signal10Hz.csv');
Fs_10hz = 1600; %Hz
num_samples_10hz = 8000;
signal_100hz = readmatrix('lab07_section03_signal100Hz.csv');
Fs_100hz = 40000; %Hz
num_samples_100hz = 8192;
signal_500hz = readmatrix('lab07_section03_signal500Hz.csv');
Fs_500hz = 40000; %Hz
num_samples_500hz = 8192;
signal_1khz = readmatrix('lab07_section03_signal1kHz.csv');
Fs_1khz = 4000; %Hz
num_samples_1khz = 8000;
signal_2khz = readmatrix('lab07_section03_signal2kHz.csv');
Fs_2khz = 4000; %Hz
num_samples_2khz = 8000;


%% Time domain
%Plot Signals in time domain:

%Signal 10hz input
figure('Name','Signal 10hz time domain');
plot(signal_10hz(:,1),signal_10hz(:,2));
title('Signal 10hz input V as a function of t');
xlabel('time [s]');
ylabel('voltage [V]');
grid on

%Signal 100hz input
figure('Name','Signal 100hz time domain');
plot(signal_100hz(:,1),signal_100hz(:,2));
title('Signal 100hz input V as a function of t');
xlabel('time [s]');
ylabel('voltage [V]');
grid on

%Signal 500hz input
figure('Name','Signal 500hz time domain');
plot(signal_500hz(:,1),signal_500hz(:,2));
title('Signal 500hz input V as a function of t');
xlabel('time [s]');
ylabel('voltage [V]');
grid on

%Signal 1khz input
figure('Name','Signal 1khz time domain');
plot(signal_1khz(:,1),signal_1khz(:,2));
title('Signal 1khz input V as a function of t');
xlabel('time [s]');
ylabel('voltage [V]');
grid on

%Signal 2khz input
figure('Name','Signal 2khz time domain');
plot(signal_2khz(:,1),signal_2khz(:,2));
title('Signal 2khz input V as a function of t');
xlabel('time [s]');
ylabel('voltage [V]');
grid on


%% FFT

%signal 10hz
[fX_10, dBX_10] = FFT_function(Fs_10hz, signal_10hz(:,2)); 

% Plot FFT:
figure('Name','10hz signal');
semilogx(fX_10,dBX_10,'LineWidth',1);
title('Frequency domain for 10hz input');
xlabel('f [Hz]');
ylabel('dB');
grid on;

%signal 100hz
[fX_100, dBX_100] = FFT_function(Fs_100hz, signal_100hz(:,2)); 

% Plot FFT:
figure('Name','100hz signal');
semilogx(fX_100,dBX_100,'LineWidth',1);
title('Frequency domain for 100hz input');
xlabel('f [Hz]');
ylabel('dB');
grid on;

%signal 500hz
[fX_500, dBX_500] = FFT_function(Fs_500hz, signal_500hz(:,2)); 

% Plot FFT:
figure('Name','500hz signal');
semilogx(fX_500,dBX_500,'LineWidth',1);
title('Frequency domain for 500hz input');
xlabel('f [Hz]');
ylabel('dB');
grid on;

%signal 1khz
[fX_1, dBX_1] = FFT_function(Fs_1khz, signal_1khz(:,2)); 

% Plot FFT:
figure('Name','1khz signal');
semilogx(fX_1,dBX_1,'LineWidth',1);
title('Frequency domain for 1kHz input');
xlabel('f [Hz]');
ylabel('dB');
grid on;

%signal 2khz
[fX_2, dBX_2] = FFT_function(Fs_2khz, signal_2khz(:,2)); 

% Plot FFT:
figure('Name','2khz signal');
semilogx(fX_2,dBX_2,'LineWidth',1);
title('Frequency domain for 2kHz input');
xlabel('f [Hz]');
ylabel('dB');
grid on;




