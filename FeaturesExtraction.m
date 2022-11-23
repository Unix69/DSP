clear all; close all;

filename = 'Baby Girl Speaking-SoundBible.com-1799849261.wav';
[signal, Fs] = audioread(filename);

Ts = 1 / Fs
L=length(signal)
duration = L/Fs
timeslice = L*Ts/20
timestep = L*Ts/40
overlap = (timestep / timeslice) * 100
curpos = 1
windowLength = round(timeslice * Fs)
step = round(timestep * Fs)
nFrames = round((L - windowLength)/step + 1);
tF = timestep*(0:nFrames) + (timeslice / 2) 
for i=1:nFrames:1
    frame = signal(curpos:curpos+windowLength);
    x = (0:Ts:timeslice);
    y = frame;
    figure;
    ax1 = subplot(3,1,1);
    plot(ax1, x, y,'Color',[0,0.7,0.9]);
    title('Time Frame');
    xlabel('time');
    ylabel('S(t)');
    frameenergy = stFeature_Energy(frame);
    fftframe = fft(frame);
    y = 10*log10(abs(fftframe));
    x = (0:length(y)-1)*Fs/2;
    ax2 = subplot(3,1,2);
    plot(ax2, x, y,'Color',[0,0.7,0.9]);
    title('Spectrum frame');
    xlabel('frequency');
    ylabel('dB'); 
    y = abs(fftframe);
    y = y.*y;
    y = 10*log10(y);
    ax3 = subplot(3,1,3);
    plot(ax3, x, y,'Color',[0,0.7,0.9]);
    title('Energy frame');
    xlabel('frequency');
    ylabel('dB');
    curpos = curpos + step;
    Spectrum(:, i) = fftframe;
end
    
    
    
    


  
   
    
    