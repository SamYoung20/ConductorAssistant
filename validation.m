[lr_accel, lr_gyro] = parsePowerSenseData_1('anil_perfect_square.csv');
% makeAccelerometerPlots(lr_accel,[],true)

startcut = 280;
endcut = 800;

x_accel = lr_accel(:,2);
x_accel = x_accel(startcut:endcut);

h = [1/4 1/4 1/4 1/4];          % moving average shape
x_accel = conv(x_accel, h);     % moving average convolution
x_accel = x_accel(1:(end-length(h)+1)); % adjusting for conv
x_accel = conv(x_accel,h);      % move the average again
x_accel = x_accel(1:(end-length(h)+1)); % adjusting for conv
x_times = lr_accel(:,1);        % grab times column
x_times = x_times(startcut:endcut);     % cutoff bad data
x_times = x_times-x_times(1);   % center unex times
% plot(x_accel)
fft_x = real(fft(x_accel));
fft_xshift = fftshift(fft_x);

[~, i] = max(fft_xshift);
figure
stem(fft_x)
index = 8;
freq = index/length(x_accel) * 50

