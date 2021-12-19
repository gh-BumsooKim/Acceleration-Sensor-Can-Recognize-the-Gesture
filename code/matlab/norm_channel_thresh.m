function [fr_1, fr_2, fr_3] = norm_channel_thresh(accel, th_value)

fr_1 = norm(accel(:, :, 1), 'fro');
fr_2 = norm(accel(:, :, 2), 'fro');
fr_3 = norm(accel(:, :, 3), 'fro');

if (fr_1< th_value); fr_1=0; end
if (fr_2< th_value); fr_2=0; end
if (fr_2< th_value); fr_3=0; end

end