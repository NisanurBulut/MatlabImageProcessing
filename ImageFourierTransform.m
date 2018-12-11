close all;
clear all;
I=imread('R5.jpg');
I=imresize(I,[256,256]);
I=rgb2gray(I);

FI=fft2(I);%DFT hesabı
FI=fftshift(FI);
FI2=abs(FI);%Genlik hesabı
F = log(FI2+1);
F = mat2gray(F);%0-1 arası ölçeklendirme

FI3=angle(FI);

figure,
subplot(1,3,1); imshow(I,[],'InitialMagnification','fit');title('Orjinal fotoğraf');
subplot(1,3,2); imshow(F,[],'InitialMagnification','fit');title('Genlik gösterimi');
subplot(1,3,3); imshow(FI3,[],'InitialMagnification','fit'); title('Faz Gösterimi');

% close all; clear all;
% 
% img   = imread('R1.jpg');
% imagesc(img)
% img   = fftshift(img(:,:,2));
% F     = fft2(img);
% 
% figure;
% 
% imagesc(100*log(1+abs(fftshift(F)))); colormap(gray); 
% title('magnitude spectrum');
% 
% figure;
% imagesc(angle(F));  colormap(gray);
% title('phase spectrum');
