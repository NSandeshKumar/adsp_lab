% Load an ECG signal (replace with your own signal)
data = load('data_ecg_original.mat');
ecg_signal = data.ecg_original(1:1000);  % Load your ECG signal file

% Set parameters
wavelet_name = 'db4'; % Wavelet name (change as needed)
level = 4; % Decomposition level (change as needed)

% Perform Discrete Wavelet Transform (DWT)
[c, l] = wavedec(ecg_signal, level, wavelet_name);

% Set compression ratio (adjust as needed)
compression_ratio = 0.5;

% Quantization (Uniform Scalar Quantization)
max_coeff = max(abs(c));
quantization_step = max_coeff * compression_ratio;
quantized_coeffs = sign(c) .* floor(abs(c) / quantization_step);

% Inverse DWT to reconstruct the compressed signal
compressed_signal = waverec(quantized_coeffs, l, wavelet_name);

% Calculate compression ratio
original_size = numel(ecg_signal);
compressed_size = numel(quantized_coeffs);
compression_ratio = original_size / compressed_size;

% Calculate Mean Square Error (MSE) between original and compressed signal
mse = mean((ecg_signal - compressed_signal).^2);

% Plot original and compressed signals
subplot(2, 1, 1);
plot(ecg_signal);
title('Original ECG Signal');
xlabel('Sample');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(compressed_signal);
title('Compressed ECG Signal');
xlabel('Sample');
ylabel('Amplitude');

% Display compression ratio and MSE
disp(['Compression Ratio: ' num2str(compression_ratio)]);
disp(['Mean Square Error (MSE): ' num2str(mse)]);
