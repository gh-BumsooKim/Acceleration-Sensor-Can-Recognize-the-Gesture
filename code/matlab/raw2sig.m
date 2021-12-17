function [Ax, Ay, Az] = raw2sig(commas, char_accel, idx, max_i)

Ax = str2double(char_accel(commas((idx-1)*6+2)+1:commas((idx-1)*6+3)-1));
Ay = str2double(char_accel(commas((idx-1)*6+4)+1:commas((idx-1)*6+5)-1));

if idx == max_i
    Az = str2double(char_accel(commas((idx-1)*6+6)+1:end-1));
else
    Az = str2double(char_accel(commas((idx-1)*6+6)+1:commas((idx-1)*6+7)-1));
end

end