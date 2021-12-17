%delay(40) in aruduino 

f1 = figure;
f2 = figure;
f3 = figure;
f4 = figure;
f5 = figure;
f6 = figure;

%clear, clc, close all
clear device

Fs = 72;

%serialportlist("available")
%device = serialport("COM6", 115200);
device = serialport(serialportlist("available"), 115200);
t = 0:1/Fs:100/Fs;


%% figure plot 1
h1 = figure(f1);
%h1.Position = [624 100 1092 811];
h1.Position = [0 600 500 400];

% fig1 : imu signal plot
p11 = subplot(2, 1, 1);
accel1 = zeros(101, 3);
plot_accel1 = plot(t, accel1, "LineWidth", 3);
h1.Children.FontSize = 8;
h1.Children.Title.String = "Acceleration";
h1.Children.XTickLabel = {'-1.4', '-1.2', '-1.0', '-0.8', '-0.6',...
    '-0.4', '-0.2'};
axis([0 t(end) -300 300]);
xlabel("Seconds in the past");
ylabel("Acceleration, mpss");
grid on;
flush(device)

% fig2 : scalogram plot
p12 = subplot(2, 1, 2);
scale_accel1 = image(zeros(224, 224, 3));
p12.Title.String = 'Scalogram';
p12.FontSize = 8;
xlabel('Time (s)');ylabel('Frequency (Hz)');
grid on;

%% figure plot 2

h2 = figure(f2);
h2.Position = [500 600 500 400];

% fig1 : imu signal plot
p21 = subplot(2, 1, 1);
accel2 = zeros(101, 3);
plot_accel2 = plot(t, accel2, "LineWidth", 3);
h2.Children.FontSize = 8;
h2.Children.Title.String = "Acceleration";
h2.Children.XTickLabel = {'-1.4', '-1.2', '-1.0', '-0.8', '-0.6',...
    '-0.4', '-0.2'};
axis([0 t(end) -300 300]);
xlabel("Seconds in the past");
ylabel("Acceleration, mpss");
grid on;

% fig2 : scalogram plot
p22 = subplot(2, 1, 2);
scale_accel2 = image(zeros(224, 224, 3));
p22.Title.String = 'Scalogram';
p22.FontSize = 8;
xlabel('Time (s)');ylabel('Frequency (Hz)');
grid on;

%% figure plot 3

h3 = figure(f3);
h3.Position = [1000 600 500 400];

% fig1 : imu signal plot
p31 = subplot(2, 1, 1);
accel3 = zeros(101, 3);
plot_accel3 = plot(t, accel3, "LineWidth", 3);
h3.Children.FontSize = 8;
h3.Children.Title.String = "Acceleration";
h3.Children.XTickLabel = {'-1.4', '-1.2', '-1.0', '-0.8', '-0.6',...
    '-0.4', '-0.2'};
axis([0 t(end) -300 300]);
xlabel("Seconds in the past");
ylabel("Acceleration, mpss");
grid on;

% fig2 : scalogram plot
p32 = subplot(2, 1, 2);
scale_accel3 = image(zeros(224, 224, 3));
p32.Title.String = 'Scalogram';
p32.FontSize = 8;
xlabel('Time (s)');ylabel('Frequency (Hz)');
grid on;

%% figure plot 4

h4 = figure(f4);
h4.Position = [0 113 500 400];

% fig1 : imu signal plot
p41 = subplot(2, 1, 1);
accel4 = zeros(101, 3);
plot_accel4 = plot(t, accel4, "LineWidth", 3);
h4.Children.FontSize = 8;
h4.Children.Title.String = "Acceleration";
h4.Children.XTickLabel = {'-1.4', '-1.2', '-1.0', '-0.8', '-0.6',...
    '-0.4', '-0.2'};
axis([0 t(end) -300 300]);
xlabel("Seconds in the past");
ylabel("Acceleration, mpss");
grid on;

% fig2 : scalogram plot
p42 = subplot(2, 1, 2);
scale_accel4 = image(zeros(224, 224, 3));
p42.Title.String = 'Scalogram';
p42.FontSize = 8;
xlabel('Time (s)');ylabel('Frequency (Hz)');
grid on;

%% figure plot 5

h5 = figure(f5);
h5.Position = [500 113 500 400];

% fig1 : imu signal plot
p51 = subplot(2, 1, 1);
accel5 = zeros(101, 3);
plot_accel5 = plot(t, accel5, "LineWidth", 3);
h5.Children.FontSize = 8;
h5.Children.Title.String = "Acceleration";
h5.Children.XTickLabel = {'-1.4', '-1.2', '-1.0', '-0.8', '-0.6',...
    '-0.4', '-0.2'};
axis([0 t(end) -300 300]);
xlabel("Seconds in the past");
ylabel("Acceleration, mpss");
grid on;

% fig2 : scalogram plot
p52 = subplot(2, 1, 2);
scale_accel5 = image(zeros(224, 224, 3));
p52.Title.String = 'Scalogram';
p52.FontSize = 8;
xlabel('Time (s)');ylabel('Frequency (Hz)');
grid on;

%% figure plot 6 (compressed data of 5 images)

h6 = figure(f6);
h6.Position = [1000 113 500 400];

% fig1 : imu signal plot
p61 = subplot(2, 1, 1);
accel6 = zeros(101, 3);
plot_accel6 = plot(t, accel6, "LineWidth", 3);
h6.Children.FontSize = 8;
h6.Children.Title.String = "Acceleration";
h6.Children.XTickLabel = {'-1.4', '-1.2', '-1.0', '-0.8', '-0.6',...
    '-0.4', '-0.2'};
axis([0 t(end) -300 300]);
xlabel("Seconds in the past");
ylabel("Acceleration, mpss");
grid on;

% fig2 : scalogram plot
p62 = subplot(2, 1, 2);
scale_accel6 = image(zeros(224, 224, 3));
p62.Title.String = 'Scalogram';
p62.FontSize = 8;
xlabel('Time (s)');ylabel('Frequency (Hz)');
grid on;

%% wavelet variable

fb = cwtfilterbank('SignalLength',101,...
    'SamplingFrequency',Fs,...
    'VoicesPerOctave',12);

% t = timer;
% t.Period = 3;
% t.TasksToExecute = 100;
% t.ExecutionMode = 'fixedRate';
% t.TimerFcn = @timer_callback;
% start(t);

%% Main Code

% if canUseGPU
%     executionEnvironment = "gpu";
%     numberOfGPUs = gpuDeviceCount("available");
%     pool = parpool(numberOfGPUs);
% else
%     executionEnvironment = "cpu";
%     pool = parpool;
% end

%while(1)
 for i = 1:10000   
    temp_accel = readline(device);
    commas = strfind(temp_accel, ' ');
        
    char_accel = char(temp_accel);
    if length(commas)>1
        % IMU Data Parsing
        
        %disp(char_accel);
        %disp(commas);
        [Ax1, Ay1, Az1] = raw2sig(commas, char_accel, 1, 5);
        [Ax2, Ay2, Az2] = raw2sig(commas, char_accel, 2, 5);
        [Ax3, Ay3, Az3] = raw2sig(commas, char_accel, 3, 5);
        [Ax4, Ay4, Az4] = raw2sig(commas, char_accel, 4, 5);
        [Ax5, Ay5, Az5] = raw2sig(commas, char_accel, 5, 5);
                
        accel1(1:100, :) = accel1(2:101, :);
        accel1(101, :) = [Ax1 Ay1 Az1];
        accel2(1:100, :) = accel2(2:101, :);
        accel2(101, :) = [Ax2 Ay2 Az2];
        accel3(1:100, :) = accel3(2:101, :);
        accel3(101, :) = [Ax3 Ay3 Az3];
        accel4(1:100, :) = accel4(2:101, :);
        accel4(101, :) = [Ax4 Ay4 Az4];
        accel5(1:100, :) = accel5(2:101, :);
        accel5(101, :) = [Ax5 Ay5 Az5];
        accel6(1:100, :) = accel6(2:101, :);
        Ax6 = mean([Ax1, Ax2, Ax3, Ax4, Ax5]);
        Ay6 = mean([Ay1, Ay2, Ay3, Ay4, Ay5]);
        Az6 = mean([Az1, Az2, Az3, Az4, Az5]);
        accel6(101, :) = [Ax6 Ay6 Az6];
        
        if mod(i, 2) == 0
            plot_aceel1.YData = accel1;
            plot_aceel2.YData = accel2;
            plot_aceel3.YData = accel3;
            plot_aceel4.YData = accel4;
            plot_aceel5.YData = accel5;
            
            % =============================================================
            % Scalogram A
            % x2r : Convert X Signal to Red Channel       
            % y2g : Convert Y Signal to Green Channel
            % z2b : Convert Z Signal to Blue Channel
            [accel_1, accel_1(:, :, 2), accel_1(:, :, 3)] = sig2channel(...
                accel1, fb, inputSize);
            [accel_2, accel_2(:, :, 2), accel_2(:, :, 3)] = sig2channel(...
                accel2, fb, inputSize);
            [accel_3, accel_3(:, :, 2), accel_3(:, :, 3)] = sig2channel(...
                accel3, fb, inputSize);
            [accel_4, accel_4(:, :, 2), accel_4(:, :, 3)] = sig2channel(...
                accel4, fb, inputSize);
            [accel_5, accel_5(:, :, 2), accel_5(:, :, 3)] = sig2channel(...
                accel5, fb, inputSize);

            % forbenius norm
            
            [fr_11, fr_12, fr_13] = norm_channel(accel_1);
            [fr_21, fr_22, fr_23] = norm_channel(accel_2);
            [fr_31, fr_32, fr_33] = norm_channel(accel_3);
            [fr_41, fr_42, fr_43] = norm_channel(accel_4);
            [fr_51, fr_52, fr_53] = norm_channel(accel_5);
            
            fr_r = sum([fr_11 fr_21 fr_31 fr_41 fr_51]);
            fr_g = sum([fr_12 fr_22 fr_32 fr_42 fr_52]);
            fr_b = sum([fr_13 fr_23 fr_33 fr_43 fr_53]);
            
            accel_6(:, :, 1) = (accel_1(:, :, 1).*fr_11 + accel_2(:, :, 1).*fr_21...
                + accel_3(:, :, 1).*fr_31 + accel_4(:, :, 1).*fr_41...
                + accel_5(:, :, 1).*fr_51)/fr_r;
            accel_6(:, :, 2) = (accel_1(:, :, 2).*fr_12 + accel_2(:, :, 2).*fr_22...
                + accel_3(:, :, 2).*fr_32 + accel_4(:, :, 2).*fr_42...
                + accel_5(:, :, 2).*fr_52)/fr_r;
            accel_6(:, :, 3) = (accel_1(:, :, 3).*fr_13 + accel_2(:, :, 3).*fr_23...
                + accel_3(:, :, 3).*fr_33 + accel_4(:, :, 3).*fr_43...
                + accel_5(:, :, 3).*fr_53)/fr_r;
            
            scale_accel1.CData = im2uint8(accel_1);
            scale_accel2.CData = im2uint8(accel_2);
            scale_accel3.CData = im2uint8(accel_3);
            scale_accel4.CData = im2uint8(accel_4);
            scale_accel5.CData = im2uint8(accel_5);
            scale_accel6.CData = im2uint8(accel_6);

            [label6,score6] = classify(model, scale_accel6.CData);

            set(gca,'yscale','log');shading interp;axis tight;
            title({char(label6),num2str(max(score6),4)});
        end
        
        pause(.001); % for drawing time delay
    end
 end

%% Save and Load the model

% save model
%save("model", [MODEL_NAME]);
%save("model", [MODE-INFOL_NAME]);

% load model
%load("model");