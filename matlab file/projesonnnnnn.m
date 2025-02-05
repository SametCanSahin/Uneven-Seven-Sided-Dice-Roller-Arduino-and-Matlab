clear all;
clc;
% Define serial port parameters
portName = 'COM5';  % Change to the appropriate port
baudRate = 1000000;

% Create serial port object
port = serialport(portName, baudRate);

% Set up plotting
figure;

% Initialize variables for storing data
samples = [];
clk_values = [];
clkiki_values = [];
d0_values = [];
a1_values = [];
a0_values = [];
b1_values = [];                                                                
b0_values = [];
X2_values = [];
X1_values = [];
X0_values = [];
O2_values = [];
O1_values = [];
O0_values = [];
Order =1;
Orders=[];
Fs=1/1065;

% Read and plot data
sample = 1;
while ishandle(1) % Loop until figure is closed
    data = readline(port);
    data = str2num(data);
    
    Orders(end+1:end+2)=[Order;Order+1];
    samples(end+1:end+2) = [sample; sample+1];

    d0_values(end+1:end+2) = [data(13); data(13)];
    clk_values(end+1:end+2) = [data(12); data(12)];
    clkiki_values(end+1:end+2) = [data(11); data(11)];
    a1_values(end+1:end+2) = [data(10); data(10)];
    a0_values(end+1:end+2) = [data(9); data(9)];
    b1_values(end+1:end+2) = [data(8); data(8)];
    b0_values(end+1:end+2) = [data(7); data(7)];
    X2_values(end+1:end+2) = [data(6); data(6)];
    X1_values(end+1:end+2) = [data(5); data(5)];
    X0_values(end+1:end+2) = [data(4); data(4)];
    O2_values(end+1:end+2) = [data(3); data(3)];
    O1_values(end+1:end+2) = [data(2); data(2)];
    O0_values(end+1:end+2) = [data(1); data(1)];

    decimal = 4*O2_values+2*O1_values+1*O0_values;
    % Print decimal values line by line
    disp('Decimal value:');
    disp(decimal(Order));

    sample = sample + 2; % Increment by 2 to accommodate duplicate values
    Order=Order+1;

    if mod(Order,300)==0
    % Update sample inde
    % Update plots

    subplot(13, 1, 1);
    plot(Orders, d0_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('D0');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 2);
    plot(Orders, clk_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('CLK1');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 3);
    plot(Orders, clkiki_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('CLK4');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 4);
    plot(Orders, a1_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('A1');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 5);
    plot(Orders, a0_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('A0');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 6);
    plot(Orders, b1_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('B1');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 7);
    plot(Orders, b0_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('B0');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 8);
    plot(Orders, X2_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('X2');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 9);
    plot(Orders, X1_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('X1');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 10);
    plot(Orders, X0_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('X0');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 11);
    plot(Orders, O2_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('O2');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 12);
    plot(Orders, O1_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('O1');
    ylim([0,1]) % Adjust the y-axis limits for better readability

    subplot(13, 1, 13);
    plot(Orders, O0_values);
    xlabel('Sample'); xlim([0,200]);
    ylabel('O0');
    ylim([0,1]) % Adjust the y-axis limits for better readability
    
    
    drawnow; % Force plot update
    end
end

counter1=0;
counter2=0;
counter3=0;
counter4=0;
counter5=0;
counter6=0;
counter7=0;

totalNumbers = length(decimal);

for i=1:totalNumbers
    if decimal(i)==1
        counter1=counter1+1;
    elseif decimal(i)==2
        counter2=counter2+1;
    elseif decimal(i)==3
        counter3=counter3+1;
    elseif decimal(i)==4
        counter4=counter4+1;
    elseif decimal(i)==5
        counter5=counter5+1;
    elseif decimal(i)==6
        counter6=counter6+1;
    elseif decimal(i)==7
        counter7=counter7+1;
    end
end

% Yüzdelik oranları hesapla
percentage1 = (counter1 / totalNumbers) * 100;
percentage2 = (counter2 / totalNumbers) * 100;
percentage3 = (counter3 / totalNumbers) * 100;
percentage4 = (counter4 / totalNumbers) * 100;
percentage5 = (counter5 / totalNumbers) * 100;
percentage6 = (counter6 / totalNumbers) * 100;
percentage7 = (counter7 / totalNumbers) * 100;

fprintf('1 sayısı yüzdesi: %.2f%%\n', percentage1);
fprintf('2 sayısı yüzdesi: %.2f%%\n', percentage2);
fprintf('3 sayısı yüzdesi: %.2f%%\n', percentage3);
fprintf('4 sayısı yüzdesi: %.2f%%\n', percentage4);
fprintf('5 sayısı yüzdesi: %.2f%%\n', percentage5);
fprintf('6 sayısı yüzdesi: %.2f%%\n', percentage6);
fprintf('7 sayısı yüzdesi: %.2f%%\n', percentage7);

fclose(port);
delete(port);
clear port;