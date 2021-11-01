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
end

