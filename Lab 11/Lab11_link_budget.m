%{
    Lab 11 Link Budget Code
    Authors:
        Connor O'Reilly
        Max Morgan 
        Gio Borrani
    Last Edited: 4/25/2021
%}

%% House Keeping
clc; clear all; close all;
%% Parameter Section 

%Given
c = 3.0 * 10^8;             %speed of light
k_b = 1.380*10^(-23);  % Boltzman's Constant [ W/(Hz-K) ]
f_up = 8.4 * 10^9;        %Uplink Frequency [ Hz ]
f_down = 8.0 * 10^9;   %Downlink Frequency [ Hz ]
R = 40000000; % Range [ m ]

%Solve
lambda_up = c/f_up; % Uplink Wave length [ m ]
lambda_down = c/f_down; % Downlink Wave length [ m ]

%% Data parameters

%Given 
be_up = 10^(-7); %Uplink Bit Error Rate / Probablility of Bit Error
be_down = 10^(-5); %Downlink Bit Error Rate / Probablility of Bit Error
dr_up = 9600; %Uplink Data Rate [ bps (Hz) ]
dr_down = 2097152; %Downlink Data Rate [ bps (Hz) ]
RDM_up = 6.00; %Required Design Margin Uplink [ dB ]
RDM_down = 3.00; %Required Design Margin Uplink [ dB ]
%Solve

%provided code 
EbNo_up = (qfuncinv(be_up)^2)/2;
EbNo_up_dB = 10*log10(EbNo_up); %Uplink Bit Energy to Noise Ratio Density in dB
EbNo_down = (qfuncinv(be_down)^2)/2;
EbNo_down_dB = 10*log10(EbNo_down); %Downlink Bit Energy to Noise Ratio Density in dB

% Lab 11 Notes page 8
CNo_up_dB_min = EbNo_up_dB + 10*log10(dr_up); % minimum Carrier-to-noise-density-ratio uplink [dB]
CNo_down_dB_min = EbNo_down_dB + 10*log10(dr_down);%minimum Carrier-to-noise-density-ratio downlink [dB]
CNo_up_dB_req = CNo_up_dB_min + RDM_up; % minimum Carrier-to-noise-density-ratio uplink [dB]
CNo_down_dB_req = CNo_down_dB_min + RDM_down; % minimum Carrier-to-noise-density-ratio uplink [dB]

%% Noise

%Given
Tref = 290; %Reference Temperature Uplink and Downlink [ K ]
eta_up = 0.44; % Receive Antenna Efficiency Uplink 
eta_down = 0.62; %Recieve Antenna Efficiency Downlink
Tphys_up = 200; %Recieve antenna Physical Temperature uplink [ K ]
Tphys_down = 290; %Recieve antenna Physical Temperature downlink [ K ]
Text_up = 260; %External "scene" Noise Temperature uplink [ K ]
Text_down = 25; %External "scene" Noise Temperature downlink [ K ]
CLrec = 0.90; %Receiver Cable Loss Uplink and Downlink [ dB ]
NF_up = 3.00; %Receiver Noise Figure uplink rec [ dB ]
NF_down = 1.00; %Receiver Noise Figure donwlink rec [dB ]

%Solve

%lec slides 38
Tant_up = eta_up * Text_up + (1-eta_up) * Tphys_up; %Antenna Noise Temperature uplink [ K ]
Tant_down = eta_down * Text_down + (1-eta_down) * Tphys_down; %Antenna Noise Temperature downlink [ K ]
CL_linear = 10^(-CLrec/10); %Receiver Cable Loss [ linear ]

%lec slides 41
F_up = 10^(NF_up/10); %Receiver Noise Factor Uplink [ linear] 
F_down = 10^(NF_down/10); %Receiver Noise Factor downlink [ linear] 
Trx_up = Tref  * ( F_up - 1 );  % Receiver Noise Temperature Uplink [ K ]      
Trx_down = Tref  * ( F_down - 1 );  % Receiver Noise Temperature Downlink [ K ]


%Get cable temperature (Lec slides 39)
Tcab_up = Tphys_up*(1-CL_linear); %Passive ( Cable ) noise temperature Uplink
Tcab_down = Tphys_down*(1-CL_linear); %Passive ( Cable ) noise temperature downlink
%Lec slide 40

Tsys_rx_up = Tant_up + ( (Tphys_up*(1-CL_linear))/CL_linear) + (Tref* (F_up-1)/CL_linear);
Tsys_rx_down = Tant_down + ( (Tphys_down*(1-CL_linear))/CL_linear) + (Tref* (F_down-1)/CL_linear);
%CL_linear*Tant_up + Tcab_up + Trx_up; %Receiver System Noise Temperature uplink
%Tsys_rx_down = CL_linear*Tant_down + Tcab_down + Trx_down; %Receiver System Noise Temperature downlink
%lec slide 35
NP_up = k_b * Tsys_rx_up; %Receiver System Noise Power Uplink linear
NP_down = k_b * Tsys_rx_down ; %Receiver System Noise Power Downlink linear
NP_up_dB = 10*log10(NP_up); %Receiver System Noise Power Uplink dB
NP_down_dB = 10*log10(NP_down); %Receiver System Noise Power downlink dB

%% Reciever Parameters

%Given
d_up = 0.18; % Recieve antenna Diameter uplink[ m ]
d_down = 6.8; % Recieve antenna Diameter downlink [ m ]
e_up = 6.0; %Receive Antenna Pointing Accuracy uplink [ deg ]
e_down = 0.15; % Receive Antenna Pointing Accuracy downlink [ deg ]

%Solve 
%assume circular aperature lec slides 14
Aphys_up = (pi*d_up^2)/4; %Receive Antenna Area [ m^2 ]
Aphys_down = (pi*d_down^2)/4; %Receive Antenna Area [ m^2 ]
Aeff_up  = eta_up * Aphys_up; %Receive Antenna Effective Area uplink
Aeff_down = eta_down * Aphys_down; %Receive Antenna Effective Area downlink
G_up = (4*pi * Aeff_up)/lambda_up^2;
G_up_db = 10*log10(G_up); %Receive Antenna Gain
G_down = (4*pi * Aeff_down)/lambda_down^2;
G_down_db = 10*log10(G_down); %Receive Antenna Gain

%lec slides 16
bw_up = sqrt( (eta_up * 41253)/G_up); %Receive Antenna Beamwidth uplink
bw_down = sqrt( (eta_down * 41253)/G_down); %Receive Antenna Beamwidth downlink

%lec slides 30 
PL_up = -12*(e_up/bw_up)^2; % Receive Antenna Pointing Loss uplink
PL_down = -12*(e_down/bw_down)^2; %Receive Antenna Pointing Loss downlink

%lec slides 46
FOM_up = G_up_db/Tsys_rx_up; %Receiver Figure of Merit uplink
FOM_down = G_down_db/Tsys_rx_down; %Receiver Figure of Merit downlink

%% Propagation Parameters

%Given
Po_up = -0.20; %Polarization Loss
Po_down = -0.20;
%Solve

%lec slides 24
Ls_up = (lambda_up/(4*pi*R))^2;
Ls_up_db = 10*log10(Ls_up); %Space Loss uplink [ dB ]
Ls_down = (lambda_down/(4*pi*R))^2;
Ls_down_db = 10*log10(Ls_down);%Space Loss downlink [ dB ]

%lec slides 27
Lat_up = 10^(-1.6);
Lat_down = 10^(-1.7);
Proploss_up = Lat_up + Ls_up_db + Po_up; %Propagation Losses
Proploss_down = Lat_down + Ls_down_db + Po_down;

%% Transmitter Parameters

%Given
d_trans_up = 6.8; %Transmit Antenna Diameter uplink
d_trans_down  = 0.18; %Transmit Antenna Diameter downlink
A_trans_up = Aphys_down; %Receive Antenna Area uplink
A_trans_down  = Aphys_up; %Receive Antenna Area downlink
eta_trans_down = eta_up; %Transmit Antenna Efficiency
eta_trans_up = eta_down; %Transmit Antenna Efficiency

%Solve
Ae_up = A_trans_up * eta_trans_up; %effective area
Ae_down = A_trans_down * eta_trans_down;

%lec 14
Gt_up = 4 * pi * (Ae_up/lambda_up^2);
Gt_down = 4 * pi * (Ae_down/lambda_down^2);

Gt_up_db = 10*log10(Gt_up);
Gt_down_db = 10*log10(Gt_down);

bw_trans_up = sqrt( (eta_trans_up * 41253)/Gt_up);
bw_trans_down = sqrt( (eta_trans_down * 41253)/Gt_down);

Lpt_up = -12*(e_down/bw_trans_up)^2;

Lpt_down = -12*(e_up/bw_trans_down)^2;

pt_up = 10*log10(100);
pt_down = 10*log10(5);
EIRP_up = -0.5+pt_up+Gt_up_db; 
EIRP_down = -0.5+pt_down+Gt_down_db; 