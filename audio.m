clear all; close all;

filename = 'Baby Girl Speaking-SoundBible.com-1799849261.wav';

[y, Fs] = audioread(filename);

t = 1:length(y); %same length of y and progressive values [1, 2, 3, ...] 
t = t - 1; %rescale to [0, 1, 2, 3, ...]
t = t / Fs;   % t/Fs are time samples [0, 1*Ts, 2*Ts, 3*Ts, ... ]

xol = 1; %quantizer dinamic (generally among 0 and 1)
nbits = 16; %codification bits (means 2 ^ nbits Levels) 

%soundsc(y, Fs); %play the sound

plot(t, Quantize(y, nbits, xol)) %16bit-ri-quantization becomes original 16bit-quantizied signal
soundsc(Quantize(y, nbits, xol), Fs);

