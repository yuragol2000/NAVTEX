% Файл Для запуска
%> @file Check.m
% =========================================================================
% Используемые файлы: transmitter.m (Функция кодирования в режиме CBSS).
% Используемые файлы: Noise.m (Функция модулирования сигнала).
% Используемые файлы: Receiver.m (Функция кодирования в режиме SBSS).
% =========================================================================
clc
clear all

run("Transmission\transmitter.m");

clc
clear all

run("Noise\Noise.m");

clc
clear all

run("Receiving\Receiver.m");

