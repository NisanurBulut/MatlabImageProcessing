Sinyal = [1 1 1 1 1 1];
Fs = 6;        % Örnekleme frekansı
Ts = 1/Fs;         % Örnekleme periyodu
L = 6;          % Sinyalin uzunluğu
t = (0:L-1)*Ts;    % Zaman vektörü
figure,subplot(1,2,1);plot(t,Sinyal);title('Sinyal');

% Fsample: örnekleme frekansı
L = length(t);
Y = fft(Sinyal);
P2 = abs(Y/L);%genlik
P3 = angle(Y/L);%faz
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
P4 = P3(1:L/2+1);
P4(2:end-1) = 2*P4(2:end-1);

f = Fs*(0:(L/2))/L;

subplot(1,3,2);plot(f,P1,'LineWidth',2);title('Sinyalin Genlik Spektrumu');
subplot(1,3,3);plot(f,P4,'LineWidth',2);title('Sinyalin Faz Spektrumu');

xlabel('f (Hz)');
ylabel('|P1(f)|');

