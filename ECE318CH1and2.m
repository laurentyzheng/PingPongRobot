%% Tutorial 8 - Nov 17, 2022 - ECE 313: Digital Signal Processing
%%% CHW1 & CHW2
%%% By Armin Shafiee

%% HW1 - P1

clear; clc; close all;  % clearing workspace and closing all windows
linewidth = 4;  % for plotting purposes

% creating 5 cycles of a sinusoid in a one second time interval
time_1 = linspace(0, 1, 1000);
sig_1 = cos(2*pi*5*time_1);
figure;
subplot(2, 2, 1);
plot(time_1, sig_1, 'LineWidth', linewidth);
title('Sinusoid-5Hz');

% creating 3 cycles of a sinusoid in a 0.5 second time interval
time_2 = linspace(0, 0.5, 1000);
sig_2 = sawtooth(2*pi*6*time_2);
subplot(2, 2, 2);
plot(time_2, sig_2, 'LineWidth', linewidth);
title('Sawtooth-6Hz');

% creating 2 cycles of a triangle wave in a 10 second time interval
time_3 = linspace(0, 10, 1000);
sig_3 = sawtooth(2*pi*(1/5)*time_3, 0.5);
subplot(2, 2, 3);
plot(time_3, sig_3, 'LineWidth', linewidth);
title('Triangle-5Hz');

% creating the exponential
figure;
time_4 = 0:40;
sig_4 = 0.9.^time_4;
sig_5 = (-0.9).^time_4;
subplot(2, 1, 1);
stem(time_4, sig_4, 'LineWidth', linewidth);
title('Exponential 0.9^n');

subplot(2, 1, 2);
stem(time_4, sig_5, 'LineWidth', linewidth);
title('Exponential (-0.9)^n');

%% HW1 - P2

clear; clc; close all;  % clearing workspace and closing all windows
linewidth = 4;  % for plotting purposes

time = 0:15;  % creating the time index

% creating an array of digital frequencies
freq_dig = [0 1	2 4 8 12 14 15];    

% creating a matrix where each column is a sinusoid of different frequency
dig_sig = cos(2*pi*time'*freq_dig/16);

k = 0;
figure;
for i = 1:length(freq_dig)
    k = k+1;
   	% opening a new figure after 4 plots
    if (k == 5)
        k = 1;
        figure;
    end
    subplot(2, 2, k);
    stem(time, dig_sig(:, i), 'LineWidth', linewidth);
    title([num2str(freq_dig(i)) '/16']);
    xlabel('n', 'FontWeight', 'bold');  
end

%% HW1 - P3

clear; clc; close all;  % clearing workspace and closing all windows
linewidth = 4;  % for plotting purposes

% creating the time index
n = 0:511;
N = 512;

% creating two periods of square wave 
square_sig = square(2*pi*2*n/N);

final_sig = zeros(size(n));
for i = 1:2:25
    % creating i-th harmonic and adding that to previous ones
    temp = (4/pi)*sin(2*pi*2*i*n/N)/i;
    final_sig = temp + final_sig;
 
    figure;
    plot(n, square_sig,'r--', 'LineWidth', linewidth);
    axis tight;
    hold on;
    plot(n, final_sig, 'b', 'LineWidth', linewidth);
    axis tight;
    legend('Desired Square', 'Approximation');
    title(['Created using i= ' num2str(1:2:i)]);
end

%% HW2 - P1

clear; clc; close all;  % clearing workspace and closing all windows
linewidth = 4;  % for plotting purposes

% creating the time domain signal
time = 0:49;
sig_1 = 0.9 .^ time;

% calling my_dtft to find the dtft
[dtft_1, freq_1] = my_dtft(sig_1, time, -2*pi, 2*pi, 512);

figure;
subplot(2, 1, 1);
stem(time, sig_1, 'LineWidth', linewidth);
title('0.9^n');
xlabel('sample num', 'FontWeight', 'bold');
subplot(2, 1, 2);
plot(freq_1/(pi), abs(dtft_1), 'LineWidth', linewidth);
title('DTFT of 0.9^n');
xlabel('Dig freq in units of \pi', 'FontWeight', 'bold');
ylabel('Magnitude', 'FontWeight', 'bold');

% creating the second time domain signal
sig_2 = (-0.9) .^ time;

% calling my_dtft to find the dtft
[dtft_2, freq_2] = my_dtft(sig_2, time, -2*pi, 2*pi, 512);

figure;
subplot(2, 1, 1);
stem(time, sig_2, 'LineWidth', linewidth);
title('-0.9^n');
xlabel('sample num', 'FontWeight', 'bold');
subplot(2, 1, 2);
plot(freq_1/(pi), abs(dtft_2), 'LineWidth', linewidth);
title('DTFT of -0.9^n');
xlabel('Dig freq in units of \pi', 'FontWeight', 'bold');
ylabel('Magnitude', 'FontWeight', 'bold');

%% HW2 - P2

clear; clc; close all;  % clearing workspace and closing all windows
linewidth = 4;  % for plotting purposes

N = 10; % defining signal length
time = 0:N-1;   % defining time index

% creating the input signal
sig_1 = cos(2*pi*0.10*time);
sig_2 = cos(2*pi*0.15*time);
sig = sig_1 + sig_2;

% calling my_dtft to find the dtft
[dtft, freq] = my_dtft(sig, time, -pi, pi, 512);
subplot(2, 1, 1);
plot(freq/pi, abs(dtft), 'LineWidth', linewidth);
xlabel('Digital freq in units of \pi', 'FontWeight', 'bold');
title('DTFT of shorter sequence');
ylabel('Mag of DTFT', 'FontWeight', 'bold')

% creating the longer signal
N = 100;
time = 0:N-1;

sig_1 = cos(2*pi*0.10*time);
sig_2 = cos(2*pi*0.15*time);
sig = sig_1 + sig_2;

% calling my_dtft to find the dtft
[dtft, freq] = my_dtft(sig, time, -pi, pi, 512);
subplot(2, 1, 2);
plot(freq/pi, abs(dtft), 'LineWidth', linewidth);
xlabel('Digital freq in units of \pi', 'FontWeight', 'bold');
title('DTFT of longer sequence');
ylabel('Mag of DTFT', 'FontWeight', 'bold');


