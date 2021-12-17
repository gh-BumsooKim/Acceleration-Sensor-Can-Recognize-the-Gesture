function [accel_1, accel_2, accel_3] = sig2channel(accel, fb, inputSize)

sig = accel(:, 1);
[cfs,~] = wt(fb,sig);
cfs_abs = abs(cfs);
accel_1 = imresize(cfs_abs/8, inputSize(1:2));

sig = accel(:, 2);
[cfs,~] = wt(fb,sig);
cfs_abs = abs(cfs);
accel_2 = imresize(cfs_abs/8, inputSize(1:2));

sig = accel(:, 3);
[cfs,~] = wt(fb,sig);
cfs_abs = abs(cfs);
accel_3 = imresize(cfs_abs/8, inputSize(1:2));

end