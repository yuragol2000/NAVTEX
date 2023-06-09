% Функция кодирования в режиме CBSS(циркулярный)
%> @file Coder.m
% =========================================================================
%  Используемые файлы: Textcoder.m (Функция кодирования текста).
%> @brief Функция кодирования в режиме CBSS
%> @param text (Текст для кодирования в режиме CBSS)
%> @return bincod_arr (битовая последовательность после кодирования CBSS режима) 
% =========================================================================
function [bincod_arr] = Coder(text)

bincod_arr = [];
bincod_arr = logical(bincod_arr);

% =========================================================================
% Начальные константы
% =========================================================================

PhasingSign_1 = [0,0,0,0,1,1,1]; %Фазирующий сигнал 1
PhasingSign_2 = [1,0,0,1,1,0,0]; %Фазирующий сигнал 2

PhasingSign_1 = logical(PhasingSign_1);
PhasingSign_2 = logical(PhasingSign_2);

Sign27 = [1,1,1,0,0,0,0];% Возврат коретки
Sign28 = [1,1,0,0,1,0,0];% Перевод строки

Sign27 = logical(Sign27);
Sign28 = logical(Sign28);

Phasing_initial_num  = 20; %Количество переданных пар для начальной синхронизации >=10 сек
Phasing_final_num    = 60; %Количество переданных пар для конечной синхронизации >=10 сек

% =========================================================================
% Добавление начальных фазирующих сигналов
% Должно быть передано не мение 10 секунд последновательностей сигнальных пар
% =========================================================================

Phasing = [];
Phasing = logical(Phasing);

for i = 1:Phasing_initial_num
    Phasing = [Phasing,PhasingSign_2];
    Phasing = [Phasing,PhasingSign_1];
end

% =========================================================================
% Разнесение по каналам DX и RX 
% =========================================================================

MessageDX   = [Sign27,Textcoder(text)];
MessageDiff = [PhasingSign_1,PhasingSign_1];
MessageRX   = [MessageDiff,MessageDX];      % На 2 больше 

len_RX = length(MessageRX);
len_DX = length(MessageDX);

Arr = [];
Arr = logical(Arr);
    
for i = 0:((len_RX/7)-1)
    if (i < len_DX/7)
        Arr = [Arr,MessageDX(i*7+1:(i+1)*7)];
    else
        Arr = [Arr,PhasingSign_1];
    end
    Arr = [Arr,MessageRX(i*7+1:(i+1)*7)];
end

% =========================================================================
% Добавление конечных фазирующих сигналов
% Должно быть передано не мение 2 секунд последновательностей сигнальных пар
% =========================================================================

for i = 1:Phasing_final_num
    Arr = [Arr,PhasingSign_1];
end

% =========================================================================
% Объединение  
% =========================================================================

bincod_arr = [Phasing,Arr];

end