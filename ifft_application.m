clear all;%Temizle hafıza
I1=imread('R3.jpg');%resim oku
I1=imresize(I1,[256,256]);%resmi yeniden boyutlandır
I1=rgb2gray(I1);%gri seviyeye indirge
F1=fft2(I1);%DFT hesabı
Fs1=fftshift(F1);%merkeze kaydırma işlemi
F11=abs(Fs1);%Büyük değerler çıkması sebebiyle mutlak alınır
F11=mat2gray(log(F11));%düzenleme
Fi1=ifft2(F1,'symmetric');
Fi1=uint8(Fi1);%double çıktı tamsayı yapılır


I2=imread('R4.jpg');
I2=imresize(I2,[256,256]);
I2=rgb2gray(I2);
F2=fft2(I2);%DFT hesabı
Fs2=fftshift(F2);
F22=abs(Fs2);%Genlik hesabı
F22=mat2gray(log(F22));
Fi2=ifft2(F2,'symmetric');
Fi2=uint8(Fi2);

I3=imread('R5.jpg');
I3=imresize(I3,[256,256]);
I3=rgb2gray(I3);
F3=fft2(I3);
Fs3=fftshift(F3);
F33=abs(Fs3);
F33=mat2gray(log(F33));
Fi3=ifft2(F3,'symmetric');
Fi3=uint8(Fi3);


subplot(3,4,1);imshow(I1);title('Orjinal');
subplot(3,4,2);imshow(F11);title('FFTSHIFT');
subplot(3,4,3);imshow(Fs1);title('FFT');
subplot(3,4,4);imshow(Fi1);title('Ters FFT');
subplot(3,4,5);imshow(I2);
subplot(3,4,6);imshow(F22);
subplot(3,4,7);imshow(Fs2);
subplot(3,4,8);imshow(Fi2);
subplot(3,4,9);imshow(I3);
subplot(3,4,10);imshow(F33);
subplot(3,4,11);imshow(Fs3);
subplot(3,4,12);imshow(Fi3);
