% Функция для синхронизации зашумленного сигнала и демодуляции
%> @file IncoherentReception.m
% =========================================================================
%> @brief Функция для синхронизации зашумленного сигнала и демодуляции
%> @param Noised (Зашумленный сигнал)
%> @return bincod_arr (Битовая последовательность после демодуляции)
% =========================================================================
function bincod_arr = IncoherentReception(Noised)
% =========================================================================
%  Полосовой фильтр
% =========================================================================

%Полосовой фильтр
fs = 4000;

% m = length(Noised);       % original sample length
% n = pow2(nextpow2(m));    % transform length
% y = fft(Noised,n);        % DFT of signal
% 
% f = (0:n-1)*(fs/n);
% power = abs(y).^2/n;      

%plot(f(1:floor(n/2)),power(1:floor(n/2)))
%xlabel('Frequency')
%ylabel('Power')



Filtered_LOW = bandpass(Noised,[1360 1700],fs,Steepness =0.85 ,StopbandAttenuation=60);
Filtered_HIGH = bandpass(Noised,[1701 1999],fs,Steepness =0.85 ,StopbandAttenuation=60);

%Filtered_LOW = bandpass(Noised,[1500 1560],fs,Steepness =0.85 ,StopbandAttenuation=60);
%Filtered_HIGH = bandpass(Noised,[1840 1900],fs,Steepness =0.85 ,StopbandAttenuation=60);

%%
% =========================================================================
%  Проверка работы полосового фильтра
% =========================================================================

% subplot(2, 1,1)
% y = fft(Filtered_LOW,n);        % DFT of signal
% power = abs(y).^2/n; 
% plot(f(1:floor(n/2)),power(1:floor(n/2)))
% xlabel('Frequency')
% ylabel('Power')
% 
% subplot(2, 1,2)
% y = fft(Filtered_HIGH,n);        % DFT of signal
% power = abs(y).^2/n; 
% plot(f(1:floor(n/2)),power(1:floor(n/2)))
% xlabel('Frequency')
% ylabel('Power')

%% 
% =========================================================================
%  Амплитудный детектор огибающей
% =========================================================================

% t = 1:1:length(Filtered_LOW);
% plot(t,Filtered_LOW)
% xlim([0 1000])

y = hilbert(Filtered_LOW);
env_LOW = abs(y);

% plot_param = {'Color', [0.6 0.1 0.2],'Linewidth',2}; 
% subplot(2,1,1)
% plot(t,Filtered_LOW)
% hold on
% plot(t,-1*env_LOW,plot_param{:})
% plot(t,1*env_LOW,plot_param{:})
% hold off
% xlim([0 1000])
% title('Hilbert Envelope Low')

y = hilbert(Filtered_HIGH);
env_HIGH = abs(y);

% t = 1:1:length(Filtered_HIGH);
% plot_param = {'Color', [0.6 0.1 0.2],'Linewidth',2}; 
% subplot(2, 1,2)
% plot(t,Filtered_HIGH)
% hold on
% plot(t,-1*env_HIGH,plot_param{:})
% plot(t,1*env_HIGH,plot_param{:})
% hold off
% xlim([0 1000])
% title('Hilbert Envelope High')


%% Проверка корреляции

Comp = [];
Switch =  [];
Flag = 0;
j = 0;

MAXDIFF = 0.6; 
res = [];


for i=1:length(env_HIGH)
   env_diff = env_HIGH(i) - env_LOW(i) ;
   if(env_diff >= MAXDIFF)
        res(i) = 1;
   else
        res(i) = 0;
   end

end

% Окно в 40 
Demodulated = [];
for i = 1:40:length(res)
    sum_L = 0;
    sum_H = 0;
    
    for j = 0:39
         sum_L = sum_L + env_LOW(i+j);
         sum_H = sum_H + env_HIGH(i+j);
    end
    
    if sum_H > sum_L
        Demodulated(end+1) = 1;
    elseif sum_H < sum_L
        Demodulated(end+1) = 0;
    else 
        printf("Error")
    end    
end
%%
PhasingSign_1 = [0,0,0,0,1,1,1];
PhasingSign_2 = [1,0,0,1,1,0,0];


for i=1:length(Demodulated)-7
    if(sum(Demodulated(i:i+6) == PhasingSign_1) == 7 || sum(Demodulated(i:i+6) == PhasingSign_2) == 7)
        Demodulated = Demodulated(i:end);
        break
    end
end  

bincod_arr = Demodulated;
%%

%% Собственный полосовой фильтр
% clc
% clear all
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % Программа испытаний конструкции корпуса полосового фильтра

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % f1 = 300; f3 = 500;% верхний и нижний пределы частоты среза полосы пропускания
 % fsl = 200; fsh = 600;% верхний и нижний предел частоты среза полосы заграждения
 % rp = 0,1; rs = 30; значение DB затухания на стороне полосы пропускания и значение DB затухания на стороне полосы пропускания

%  fs = 4000; %частота дискретизации%
%  
%  x = Noised;
%  figure;
% 
%  % Bandpass test
%  Filtered_LOW  = bandp (x, 1360,1700,1300,1800,0.5,20, fs); %проверка функции полосового фильтра%.
%  Filtered_HIGH = bandp (x, 1701,1960,1600,1999,0.5,30, fs); %проверка функции полосового фильтра%.




end
