%  Функция кодирования номера станции
%> @file Identification.m
% =========================================================================
%> @brief Функция кодирования номера станции
%> @param Num_of_station (Номер станции которой передается информация)
%> @return ID_st (Буквенная последовательность закодированного номера станции) 
% =========================================================================
function [ID_st] = Identification(num_of_station)
ID_st = '';
ID = '';
%len = length(num_of_station);
for i = 1:4
    switch i
        case 1 
            switch num_of_station(i)
                case '0'
                    ID = 'V';
                case '1'
                    ID = 'X';
                case '2'
                    ID = 'Q';
                case '3'
                    ID = 'K';
                case '4'
                    ID = 'M';
                case '5'
                    ID = 'P';
                case '6'
                    ID = 'C';
                case '7'
                    ID = 'Y';
                case '8'       
                    ID = 'F';
                case '9'       
                    ID = 'S';
            end
        case 2
            switch num_of_station(i)
                case '0'
                    ID = 'V';
                case '1'
                    ID = 'X';
                case '2'
                    ID = 'Q';
                case '3'
                    ID = 'K';
                case '4'
                    ID = 'M';
                case '5'
                    ID = 'P';
                case '6'
                    ID = 'C';
                case '7'
                    ID = 'Y';
                case '8'       
                    ID = 'F';
                case '9'       
                    ID = 'S';
            end
        case 3
            switch num_of_station(i)
                case '0'
                    ID = 'V';
                case '1'
                    ID = 'X';
                case '2'
                    ID = 'Q';
                case '3'
                    ID = 'K';
                case '4'
                    ID = 'M';
                case '5'
                    ID = 'P';
                case '6'
                    ID = 'C';
                case '7'
                    ID = 'Y';
                case '8'       
                    ID = 'F';
                case '9'       
                    ID = 'S';
            end
        case 4
            switch num_of_station(i)
                case '0'
                    ID = 'V';
                case '1'
                    ID = 'X';
                case '2'
                    ID = 'Q';
                case '3'
                    ID = 'K';
                case '4'
                    ID = 'M';
                case '5'
                    ID = 'P';
                case '6'
                    ID = 'C';
                case '7'
                    ID = 'Y';
                case '8'       
                    ID = 'F';
                case '9'       
                    ID = 'S';
            end
    end
    ID_st = [ID_st,ID];
end