function [fr_1, fr_2, fr_3] = norm_channel(accel)

fr_1 = norm(accel(:, :, 1), 'fro');
fr_2 = norm(accel(:, :, 2), 'fro');
fr_3 = norm(accel(:, :, 3), 'fro');

end