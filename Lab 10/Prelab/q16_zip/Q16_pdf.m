%main driver for 16

   % Ohm
C1 = 00.000001;     % micro F
C2 = 0.0000001;   % micro F
R =  330;
[f0, Q] = SallenKey(R, C1, C2)
                