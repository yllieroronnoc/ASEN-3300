function [f0,Q] = SallenKey(R,C1,C2)
%Prelab 10 sallen key shit
w0 = 1/(R*sqrt(C1*C2));
f0 = w0/( 2*pi);
Q = 0.5 * sqrt(C1/C2);
f = 0:60000;
w = f .* 2 * pi;
gain = 20*log10( w0^2 ./ sqrt( ( w0^2 - w.^2).^2 + ( (w0^2 .* w.^2)./Q^2)) );

%freq response
figure('Name', 'mag')
semilogx(f,gain);
hold on;
grid on;
title('Frequency response of SK filter')
xlabel('Frequency [ Hz ]')
ylabel('Amplitude [ dB ]')
hold off;

%phase response  
phase = -atan( (w0 .* w ./ Q) ./ (w0^2 - w.^2)) ;
figure('Name','phase')
semilogx(w,phase);
hold on;
grid on;
title('Phase response of SK filter')
xlabel('Angular Frequency [ rad/s ]' )
ylabel('Phase [ deg ]')
hold off;
end

