% Файл кодирования и модулироввния текста 
%> @file Receiver.m
% =========================================================================
% Используемые файлы: IncoherentReception.m (Функция для синхронизации зашумленного сигнала и демодуляции).
% Используемые файлы: Phasing.m (Функция определяющая момент начала считывания сообщения).
% Используемые файлы: ReadingSBSS.m (Функция декодирования в режиме SBSS).
% Используемые файлы: ReadingСBSS.m (Функция декодирования в режиме СBSS).
% =========================================================================
%%
% =========================================================================
% Прием зашумленного сигнала 
% =========================================================================

 clc
 clear all
 
% Fs = 48000;
% filename = 'TEXT\heard.wav';
% [Noised,Fs] = audioread(filename);
% FsFd  = 40;
% 
% binarycode_after = Demodulation(Noised,FsFd,0,0);
% 
% binarycode_after = reshape(binarycode_after,7,[]);
% 
% bytenum = 0;
% maxbytenum = length(binarycode_after);
% reading = 0;
% last_simb = -1;
% prev = "";
% pair = 0;
% num_of_pairs = 0;  
% print_text = "";
% 
% while (1)
%     bytenum = bytenum + 1;
%     if(bytenum > maxbytenum)
%         break;
%     end
% 
%     byte = binarycode_after(:,bytenum);
% 
%     if(reading ~= 1)
%         [simbol,print_text] = TextDecoder(byte,last_simb);
%         [reading,pair,num_of_pairs] = Phasing(simbol,prev,pair,num_of_pairs);
%     end
%        
%     if (reading == 1) 
%       
%         bytecode_after = reshape(binarycode_after,7,[]);
%         
%         print_text = ReadingSBSS(bytenum,maxbytenum,bytecode_after);
%         break;
%     end
%     prev = simbol;
%     
% end
% 
% 
% fprintf(print_text);

Fs = 48000;
filename = '..\TEXT\Noised.wav';
%filename = 'TEXT\Modulated.wav';
[Noised,Fs] = audioread(filename);

bincod_arr = IncoherentReception(Noised);
%% 
% =========================================================================
% Декодер принятого сигнала
% =========================================================================

binarycode_after = reshape(bincod_arr,7,[]);

bytenum = 0;
maxbytenum = length(binarycode_after);
reading = 0;
last_simb = -1;
prev = "";
pair = 0;
num_of_pairs = 0;  
print_text = "";

while (1)
    bytenum = bytenum + 1;
    if(bytenum > maxbytenum)
        break;
    end

    byte = binarycode_after(:,bytenum);

    if(reading ~= 1)
        [simbol,print_text] = TextDecoder(byte,last_simb);
        [reading,pair,num_of_pairs] = Phasing(simbol,prev,pair,num_of_pairs);
    end
    if (reading == 1) 
        bytecode_after = reshape(binarycode_after,7,[]);
        
        print_text = ReadingSBSS(bytenum,maxbytenum,bytecode_after);
        break;
    end
    prev = simbol;
    
end


fprintf(print_text);

filename = '..\TEXT\recived_text.txt';
f = fopen(filename,'w');
fprintf(f,'%s',print_text);
fclose(f);


