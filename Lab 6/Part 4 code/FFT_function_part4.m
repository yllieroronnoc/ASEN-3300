function [f, dB] = FFT_function(Fs, volt)
%% ASEN 3300 - FFT
%{
Summary: Perform an Fast Fourier Transfer of a given signal
%}

% Author: {primary author, Ruben Hinojosa Torres}
% Source: https://www.mathworks.com/help/matlab/ref/fft.html
% Date: 9/30/2020, Updated: 2/11/2021

%{
INPUTS:   - Fs: Sampling frequency
                 - This will be provided for you, and  can be extracted 
                   from a .mat file using the load() MATLAB function.
                 - If given a .csv file, the fastest and most robust way 
                   of getting this value will be to open the .csv file 
                   using excel and manually typing this as a variable.
          - volt: Signal input
                 - This is also provided for you and can be extracted using
                   the load() or csvread() MATLAB functions depending on
                   the type of file provided.

OUTPUTS:   - f: Frequency vector
                 - Provides the frequency range of the desired FFT plot.
                   (Note: Not log(f), simply f!)
           - dB: Magnitude vector
                 - Provides the magnituded of each corresponding frequency
                   within the signal
%}

    % Attain FFT:
    Y = fft(volt); % Take FFT of Transform Signal
    P2 = abs(Y/length(volt)); % Compute two sided spectrum
    P1 = P2(1:length(volt)/2+1); % Compute Single sided spectrum P1 based on P2
    P1(2:end-1) = 2*P1(2:end-1); % Double it to account for both sides
    f = Fs*(0:(length(volt)/2))/length(volt); % Define Frequency domain based on Sampling Frequency
    dB = P1;
    
%{
    
Copy and paste the code below in your main function to view both the time
domain and the frequency domain of the signal in question:
    Note: You'll need to adjust the names apropriately! Keep organized!
    
% Read signalX produced by X sinusoid input:
signalX = csvread('labX_sectionX_signalX.csv',4,0);
    or
load('labX_sectionX_signalX.mat')
    
% Re-name/Define variables here
% Example:
FsX = Fs; % ... etc

% Plot Signal in time domain:
figure();
plot(signalX(:,1),signalX(:,2));
title('X Signal input');
xlabel('time [s]');
ylabel('voltage [V]');

% FFT Function call:
[fX, dBX] = FFT_function(FsX, signalX(:,2)); 

% Plot FFT:
figure();
semilogx(fX,dBX,'LineWidth',1);
title('Frequency domain for X input');
xlabel('f [Hz]');
ylabel('dB');
grid on; 
    
% Remember to make your plot look pretty by zooming in appropriately!

%}
    
end

