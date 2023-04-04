% Функция Декодированяи текста
%> @file TextDecoder.m
% =========================================================================
%> @brief Функция Декодированяи текста
%> @param bincod_arr (Битовая последовательность)
%> @param last_simb (Входной маркет последнего символа 1 => registrLet
%                                                      0 => registrDig
%                                                      1 => none)
%> @return text (Символ после декодирования битовой последовательности)
%> @return print_text (Символ после декодирования битовой последовательности, только те что пойдут на печать)
%> @return last_simb (Выходной маркет последнего символа)
% =========================================================================
function [text,print_text,last_simb] = TextDecoder(bincod_arr,last_simb)

n = length(bincod_arr);
text = "";
print_text = "";

for i = 0:((n/7)-1)
    ar = bincod_arr(i*7+1:(i+1)*7);
    sum = 0;
    for j = 7:-1:1
        sum = sum + ar(j)*2^(7-j);
    end

    arr = "";
    Print = "";
    
    if (last_simb == 1 && sum ~= 73)
        switch sum
            case 14
                arr = 'A';
                Print = 'A'; 
            case 88
                arr = 'B';
                Print = 'B';
            case 35
                arr = 'C'; 
                Print = 'C';
            case 26
                arr = 'D'; 
                Print = 'D'; 
            case 74
                arr = 'E'; 
                Print = 'E';                
            case 19
                arr = 'F'; 
                Print = 'F';                 
            case 41
                arr = 'G'; 
                Print = 'G';                 
            case 52
                arr = 'H';
                Print = 'H';
            case 38
                arr = 'I'; 
                Print = 'I';
            case 11
                arr = 'J'; 
                Print = 'J';
            case 67
                arr = 'K'; 
                Print = 'K';                
            case 44
                arr = 'L'; 
                Print = 'L'; 
            case 49
                arr = 'M'; 
                Print = 'M'; 
            case 50
                arr = 'N';
                Print = 'N';                
            case 56
                arr = 'O'; 
                Print = 'O';                 
            case 37
                arr = 'P'; 
                Print = 'P'; 
            case 69
                arr = 'Q'; 
                Print = 'Q';
            case 42
                arr = 'R'; 
                Print = 'R';                
            case 22
                arr = 'S'; 
                Print = 'S';
            case 104
                arr = 'T'; 
                Print = 'T';  
            case 70
                arr = 'U'; 
                Print = 'U';                
            case 97
                arr = 'V'; 
                Print = 'V';
            case 13
                arr = 'W'; 
                Print = 'W';
            case 81
                arr = 'X'; 
                Print = 'X';
            case 21
                arr = 'Y'; 
                Print = 'Y';                
            case 28
                arr = 'Z'; 
                Print = 'Z';

            case 82
                last_simb = 1;  
                
            case 73
                last_simb = 0;
                
            case 112
                arr = '<'; 
                last_simb = -1; 

            case 100
                arr = '\n';
                Print = '\n'; 

            case 7
                arr = '{';     %PhasingSign_1 
                
            case 76
                arr = '}';     %PhasingSign_2
            otherwise
                arr = '*';
                Print = '*';
        end
    elseif (last_simb == 0 && sum ~= 82)    
        switch sum
            case 14
                arr = '-'; 
                Print = '-';
            case 98
                arr = ' ';      
                Print = ' ';
            case 88
                arr = '?'; 
                Print = '?';
            case 50
                arr = ','; 
                Print = ',';
            case 49
                arr = '.'; 
                Print = '.';
            case 35
                arr = ':'; 
                Print = ':';

            case 37
                arr = '0'; 
                Print = '0';     
            case 69
                arr = '1'; 
                Print = '1';                     
            case 13
                arr = '2'; 
                Print = '2';     
            case 74
                arr = '3'; 
                Print = '3';                     
            case 42
                arr = '4'; 
                Print = '4';     
            case 104
                arr = '5'; 
                Print = '5';                                     
            case 21
                arr = '6'; 
                Print = '6';     
            case 70
                arr = '7'; 
                Print = '7';           
            case 38
                arr = '8'; 
                Print = '8';     
            case 56
                arr = '9'; 
                Print = '9';

              

             case 82
                last_simb = 1;  
                
            case 73
                last_simb = 0;
                
            case 112
                arr = '<'; 
                last_simb = -1; 

            case 100
                arr = newline ;
                Print = newline ; 

               
                
            case 7
                arr = '{';     %PhasingSign_1 
            case 76
                arr = '}';     %PhasingSign_2
            otherwise
                arr = ' ';
                Print = ' ';
        end
    else
        switch sum
            case 82
                last_simb = 1; 

            case 100
                arr = newline ; 
                Print = newline ;  

            case 73
                last_simb = 0;
                
            case 112
                arr = '<'; 
                last_simb = -1;
                
            case 7
                arr = '{';     %PhasingSign_1 
                
            case 76
                arr = '}';     %PhasingSign_2
            otherwise
                arr = ' ';
             Print = ' ';
        end
    end 
    text = text+arr;
    print_text = print_text + Print;
end

end