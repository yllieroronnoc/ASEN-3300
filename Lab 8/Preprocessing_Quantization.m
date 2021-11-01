clear all
close all
clc
test = [2048,2305,2557,2802,3034,3251,3449,3625,3777,3901,3995,4059,4092,4092,4060,3996,3902,3778,3628,3452,3254,3037,2805,2560,2308,2051,1795,1542,1297,1065,847,649,473,321,197,102,37,4,4,35,99,193,316,466,642,839,1056,1288,1533,1785,2041];
%%num_pts = length(test);
num_pts = 10;%2000;
bits = 12;
min_v = 0.5;
max_v = 2.60;
[ sine_array ] = GenerateSine(bits,num_pts,min_v,max_v);
dlmwrite([num2str(bits),' bit DAC sine array.txt'],sine_array)