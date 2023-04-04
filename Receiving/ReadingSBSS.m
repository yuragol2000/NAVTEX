% Функция считывания сообщения в SBSS режиме
%> @file ReadingSBSS.m
% =========================================================================
% Используемые файлы: TextDecoder.m (Функция Декодированяи текста).
% Используемые файлы: SBSS_check.m (Функция определения для кого сообщения в режиме SBSS ).
% Используемые файлы: Comporation.m (Функция Сравнения двух строк).
% =========================================================================
%> @brief Функция считывания сообщения в CBSS режиме
%> @param bytenum (Номер символа)
%> @param maxbytenum (Максимальный номер символа)
%> @param bytecode_after (Массив принятых символов)
%> @return text_for_print (Текст для печати)
% =========================================================================
function [text_for_print] = ReadingSBSS(bytenum,maxbytenum,bytecode_after) %Чтение сигнала в циркулярном режиме режиме(SBSS)
      
SBSS = -1;
text_after = "";
last_simb_1 = -1;
last_simb_2 = -1;
text_1 = "";
text_2 = "";
text_for_print1 = "";
text_for_print2 = "";
text_1_for_print = "";
text_2_for_print = "";
reading_1 = 0;
reading_2 = 0;
num_of_simb_1 = 0;
num_of_simb_2 = 0;

while bytenum < length (bytecode_after)
    bytenum = bytenum + 1;

    if(bytenum > maxbytenum)
        break;
    end
    
    byte = bytecode_after(:,bytenum);
     

    if (mod(bytenum,2) == 0)
        if(SBSS == -1)
            [SBSS,num_of_simb_1] = SBSS_check(byte,num_of_simb_1);
        end
        if(SBSS == 1)
            byte = Inversion(byte);
        end

        [byte_text,text_for_print1,last_simb_1] = TextDecoder(byte,last_simb_1);
        text_1 = text_1+byte_text;

        if (byte_text == '<')
            reading_1 = 1;
        end
        if(reading_1 == 1)
            text_1_for_print = text_1_for_print+text_for_print1;
        end
    else
        if(SBSS == -1)
            [SBSS,num_of_simb_2] = SBSS_check(byte,num_of_simb_2);
        end
        if(SBSS == 1)
            byte = Inversion(byte);
        end

        [byte_text,text_for_print2,last_simb_2] = TextDecoder(byte,last_simb_2);
        text_2 = text_2+byte_text;
        if (byte_text == '<')
            reading_2 = 1;
        end
        if(reading_2 == 1)
            text_2_for_print = text_2_for_print+text_for_print2;
        end
    end

    text_after = text_after+byte_text;

end   
text_for_print = Comporation(text_1_for_print,text_2_for_print);

end