%  Функция инвертирования битовой последовательности
%> @file Inversion.m
% =========================================================================
%> @brief  Функция инвертирования битовой последовательности
%> @param  binarycode (Битовая последовательность)
%> @return binarycode (Инвертированная битовая последовательность) 
% =========================================================================
function [binarycode] = Inversion(binarycode)

len = length(binarycode);

for i=1:len
    if(binarycode(i) == 0)
        binarycode(i) = 1;
    elseif(binarycode(i) == 1)
        binarycode(i) = 0;
    end
end

end

