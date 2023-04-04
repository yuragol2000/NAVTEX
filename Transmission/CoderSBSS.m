% Функция кодирования в режиме SBSS(Избирательный)
%> @file CoderSBSS.m
% =========================================================================
%  Используемые файлы: Identification.m (Функция кодирования номера станции).
%  Используемые файлы: Textcoder.m (Функция кодирования текста).
%  Используемые файлы: Inversion.m (Функция инвертирования битовой последовательности).
%> @brief Функция кодирование текста в избирательном режиме(SBSS)
%> @param text (Текст для кодирования в режиме SBSS)
%> @param Num_of_station (Номер станции которой передается информация)
%> @return bincod_arr (битовая последовательность после кодирования SBSS режима) 
% =========================================================================
function [bincod_arr] = CoderSBSS(text,Num_of_station)

bincod_arr = [];
bincod_arr = logical(bincod_arr);

PhasingSign_1     = [0,0,0,0,1,1,1];
PhasingSign_2     = [1,0,0,1,1,0,0];
PhasingSign_betta = [0,0,1,1,0,0,1];

PhasingSign_1 = logical(PhasingSign_1);
PhasingSign_2 = logical(PhasingSign_2);

Sign27 = [1,1,1,0,0,0,0];
Sign28 = [1,1,0,0,1,0,0];

Sign27 = logical(Sign27);
Sign28 = logical(Sign28);


for i = 1:20
    bincod_arr = [bincod_arr,PhasingSign_2];
    bincod_arr = [bincod_arr,PhasingSign_1];
end


ID_st = Identification(Num_of_station);
Identification_num = Textcoder(ID_st);
MessageDX = [Identification_num,PhasingSign_betta];

for i = 1:5
    MessageDX = [MessageDX,Identification_num];
end

MessageDX   = [MessageDX,Sign27];
MessageDX   = [MessageDX,Textcoder(text)];
MessageDiff = [PhasingSign_1,PhasingSign_1];
MessageRX   = [MessageDiff,MessageDX];% на 2 больше 

MessageDX   = Inversion(MessageDX);
MessageRX   = Inversion(MessageRX);

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

%Arr = [Arr,PhasingSign_2];
%Arr = [Arr,PhasingSign_1];
%Arr = [Arr,PhasingSign_2];

%MessageDX_2 = Textcoder(text);
%MessageDiff = [PhasingSign_1,PhasingSign_1];
%MessageRX_2 = [MessageDiff,MessageDX_2];% на 2 больше 

%len_RX_2 = length(MessageRX_2);
%len_DX_2 = length(MessageDX_2);

%for i = 0:((len_RX_2/7)-1)
 %   if (i < len_DX_2/7)
  %      Arr = [Arr,MessageDX_2(i*7+1:(i+1)*7)];
   % else
    %    Arr = [Arr,PhasingSign_1];
   % end
   % Arr = [Arr,MessageRX_2(i*7+1:(i+1)*7)];
%end

for i = 1:30
    Arr = [Arr,PhasingSign_1];
    Arr = [Arr,PhasingSign_1];
end

bincod_arr = [bincod_arr,Arr];

end