% Функция определяющая момент начала считывания сообщения
%> @file Phasing.m
% =========================================================================
%> @brief Функция определяющая момент начала считывания сообщения
%> @param simbol (Принятый символ)
%> @param prev (Предыдущий символ)
%> @param pair (Входной маркер пары 0 => первый элемент пары 1 => второй элемент пары)
%> @param num_of_pairs (Входное суммарное количество пар)
%> @return reading (Маркер начала считывания сообщения 0 => фазирование 1 => чтение сообщения)
%> @return pair (Выходной маркер пары 0 => первый элемент пары 1 => второй элемент пары)
%> @return num_of_pairs (Выходное суммарное количество пар)
% =========================================================================
function [reading,pair,num_of_pairs] = Phasing(simbol,prev,pair,num_of_pairs)
reading = 0;
sync_duration = 16;

if(num_of_pairs >= sync_duration)
    disp('Phased');
    reading = 1; 
end
    
switch simbol
        case '}'
            if(prev == '{')
                if(pair == 0)
                    pair = 1;
                elseif(pair == 1)
                    pair = 0;
                    num_of_pairs = num_of_pairs + 1;
                end
            else
                pair = 1;
            end 


        case '{'
            if(prev == '}')
                if(pair == 0)
                    pair = 1;
                elseif(pair == 1)
                    pair = 0;
                    num_of_pairs = num_of_pairs + 1;
                end
            else 
                pair = 1;
            end

        case '<'
            if(num_of_pairs >= sync_duration)
                reading = 1; 
            end
            
        case '!'
            if(num_of_pairs >= sync_duration)
                reading = 1;
            end
end

end