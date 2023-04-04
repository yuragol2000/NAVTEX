% Прогонка модулированного сигнала через Гаусовский шум 
%> @file Noise.m
% =========================================================================

clc
clear all

% =========================================================================
% Начальные константы
% =========================================================================

filename = '..\TEXT\Modulated.wav';
[Modulated,Fs] = audioread(filename);

FsFd  = 40;
SNR = 5;

% =========================================================================
% Добавление шума
% =========================================================================

NoisedSignal = awgn(Modulated,SNR,'measured'); %Гаусовский шум
M = max(abs(NoisedSignal));
NoisedSignal= NoisedSignal./M;

% =========================================================================
% Запись зашумленного сигнала
% =========================================================================

filename = '..\TEXT\Noised.wav';
Fs = 48000;
audiowrite(filename,NoisedSignal,Fs);
