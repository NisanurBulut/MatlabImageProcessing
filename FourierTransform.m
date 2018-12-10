omega = 1;
t = 0:0.01:6;
ft = cos(omega*t.^2);
ff = fft(ft);
subplot(1,2,1);
plot(t,ft);
grid on
xlabel('t');
ylabel('f(t)');
title('Zaman Domeni');
subplot(1,2,2);
plot(abs(ff));
grid on
xlabel('f');
ylabel('F(f)');
title('Frekans Domeni');
