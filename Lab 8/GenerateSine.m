function [ sine_array ] = GenerateSine(bits,num_pts,min_v,max_v)
%Author: Eddy Scott
%V 1.0: 1/29/2015
%This function will generate the binary representation of a sinewave for
%the appropriate resolution of DAC.  It is used to show DAC quantization
%for ASEN 3300 Electronics labs
%Inputs:
%       bits:  number of bit resolution of DAC availible
%       num_pts: number of points used to represent the sinewave
%       min_v: minimum voltage [in V NOT mV] of the sinewave
%       max_v: peak voltage [in V NOT mV] of the sinewave
%Outputs:
%       sine_array: [1xn] vector of binary numbers corisponding to
%                   appropriate DAC output voltage to represent sinewave
%% Generate one period of a sinewive bounded by max_v ,min_v
max_bin = 2^(bits)-1;%note that 1st bin on arduino DACs is numbered as 0
mid_range = (max_v+min_v)/2;
amplitude = (max_v/2)-(min_v/2);
%%amplitude = 0.25/2;
if amplitude == (max_v/2)-(min_v/2)
   disp('Generating full scale sinewave') 
else
    disp(['Generating ',num2str(2*amplitude),'Vpp sinewave'])
end
c = 1;
for i = 0:(2*pi)/(num_pts-1):2*pi
   volt_sine(c) = (amplitude)*sin(i)+mid_range;
   c = c+1;
end
%%%%% Plot voltage sinewave
PlotSine(volt_sine,'volt')
%% Convert voltages to proper bin number of DAC 
bin_res = (max_v-min_v)/2^bits;
for j = 1:length(volt_sine)
   bin_sine(j) =  floor((volt_sine(j)-min_v)/bin_res);
end
sine_array = bin_sine;
%%%%Plot binned sinewave as voltages
PlotSine(sine_array,'bin');
end

