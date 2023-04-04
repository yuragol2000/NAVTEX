% Функция Сравнения двух строк
%> @file Comporation.m
% =========================================================================
%> @brief Функция Сравнения двух строк и возвращающию '*'  при нахождении несоответствия  
%> @param str_1 (Первая строка)
%> @param str_2 (Вторая строка)
%> @return text_for_print (Совпадающий текст и '*' на местах несоответствия)
% =========================================================================
function [text_for_print] = Comporation(str_1,str_2)

text_for_print = "";
length_str1 = strlength(str_1);
length_str2 = strlength(str_2);
len = min(length_str1,length_str2);

for i = 1:len
    simb_1 = str_1{1}(i);
    simb_2 = str_2{1}(i);
    if(simb_1 == simb_2)
        text_for_print = text_for_print + simb_1;
    else
        text_for_print = text_for_print +'*';
    end

end