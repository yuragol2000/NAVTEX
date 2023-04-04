% Функция кодирования текста
%> @file Textcoder.m
% =========================================================================
%> @brief Функция кодирования текста
%> @param text (Текст для кодирования)
%> @return bincod_arr (Битовая последовательность после кодирования текста)
% =========================================================================
function [bincod_arr] = Textcoder(text)

n = length(text);
text = upper(text);% Повышаем регистр

bincod_arr = [];
bincod_arr = logical(bincod_arr);

registrLet = [1,0,1,0,0,1,0]; % Регистр текста
registrDig = [1,0,0,1,0,0,1]; % Регистр цифр

registrLet = logical(registrLet);
registrDig = logical(registrDig);


%Если последний символ 1 => registrLet
%Если последний символ 0 => registrDig
%Если последний символ -1 => none

last_simb = -1; 

% =========================================================================
% Переводим текст в битовые последовательности соглавсно таблице старндарта
% =========================================================================

for i = 1:n
    arr = [];
    if(isletter(text(i)) == 1)
        if(last_simb ~= 1) 
            bincod_arr = [bincod_arr,registrLet];
            last_simb = 1;
        end
        
        switch text(i)
            case 'A'
                arr = [0,0,0,1,1,1,0];              
            case 'B'
                arr = [1,0,1,1,0,0,0];
            case 'C'
                arr = [0,1,0,0,0,1,1];                 
            case 'D'
                arr = [0,0,1,1,0,1,0];
            case 'E'
                arr = [1,0,0,1,0,1,0]; 
            case 'F'
                arr = [0,0,1,0,0,1,1];    
            case 'G'
                arr = [0,1,0,1,0,0,1];                    
            case 'H'
                arr = [0,1,1,0,1,0,0];    
            case 'I'
                arr = [0,1,0,0,1,1,0];
            case 'J'
                arr = [0,0,0,1,0,1,1]; 
            case 'K'
                arr = [1,0,0,0,0,1,1];
            case 'L'
                arr = [0,1,0,1,1,0,0];
            case 'M'
                arr = [0,1,1,0,0,0,1];
            case 'N'
                arr = [0,1,1,0,0,1,0];                
            case 'O'
                arr = [0,1,1,1,0,0,0];    
            case 'P'
                arr = [0,1,0,0,1,0,1];  
            case 'Q'
                arr = [1,0,0,0,1,0,1]; 
            case 'R'
                arr = [0,1,0,1,0,1,0]; 
            case 'S'
                arr = [0,0,1,0,1,1,0];   
            case 'T'
                arr = [1,1,0,1,0,0,0]; 
            case 'U'
                arr = [1,0,0,0,1,1,0];                  
            case 'V'
                arr = [1,1,0,0,0,0,1];             
            case 'W'
                arr = [0,0,0,1,1,0,1];               
            case 'X'
                arr = [1,0,1,0,0,0,1];                    
            case 'Y'
                arr = [0,0,1,0,1,0,1];   
            case 'Z'
                arr = [0,0,1,1,1,0,0]; 
                
            case newline
                arr = [1,1,0,0,1,0,0];                 
        end
   else
        if(last_simb ~= 0) 
            bincod_arr = [bincod_arr,registrDig];
            last_simb = 0;
        end
    
        switch text(i)
             
            case '1'
                arr = [1,0,0,0,1,0,1]; 
            case '2'
                arr = [0,0,0,1,1,0,1];  
            case '3'
                arr = [1,0,0,1,0,1,0]; 
            case '4'
                arr = [0,1,0,1,0,1,0];                 
            case '5'
                arr = [1,1,0,1,0,0,0]; 
            case '6'
                arr = [0,0,1,0,1,0,1];
            case '7'
                arr = [1,0,0,0,1,1,0]; 
            case '8'
                arr = [0,1,0,0,1,1,0];                 
            case '9'
                arr = [0,1,1,1,0,0,0]; 
            case '0'
                arr = [0,1,0,0,1,0,1];  

            case newline
                arr = [1,1,0,0,1,0,0];       
                
            case '-'
                arr = [0,0,0,1,1,1,0];       
            case ' '
                arr = [1,1,0,0,0,1,0];       
            case '?'
                arr = [1,0,1,1,0,0,0];      
            case ','
                arr = [0,1,1,0,0,1,0];    
            case '.'
                arr = [0,1,1,0,0,0,1]; 
            case ':'
                arr = [0,1,0,0,0,1,1];
        end
    end 
    arr = logical(arr);
    bincod_arr = [bincod_arr,arr];
end

end