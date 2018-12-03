clc;%Workspace temizle
close all;
A1=imread('R2256x256.jpg');%fotoğraf oku
A=A1;%fotoğraf oku
A=rgb2gray(A);%2seviyeye indirge
[y,x] = size(A);%boyut alınır
b=3;%maske boyutu 3x3
B1=zeros(size(A));
pad=floor(b/2); % veya (n-1)/2
modifyA = padarray(double(A),[pad,pad]); % 0 pad ekleme
filteredImage=zeros(size(A));%Resim boyutu kadar bir matris oluşturulur sonuç gösterimi için
M1=[0 1 0;1 -4 1; 0 1 0];%Maske
for i= 1:x
    for j=1:y
       localRegion = modifyA(i:i+(b-1),j:j+(b-1)); % maskenin kapladığı alan 
       C = localRegion.*M1;%maske değerletiyle çarpılır
       total=sum(C(:));%Çarpım sonucu toplanır
       B1(i,j)=total;
    end
end
B1=uint8(B1);
