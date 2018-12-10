clc;
close all;
AT=imread('R2256x256.jpg');%oku
AT=rgb2gray(AT);%gri seviyeye indirge
AT=im2double(AT);%double formata getir
[r, c]=size(AT);%boyutlarını al
filter=[1 1 1;1 -8 1; 1 1 1];%maske tanımı
A1=AT;
A2=AT;
figure,imshow(AT);%orjinal resmi göster
degree=0;%Laplace katsayısı
for i=2:r-1
    for j=2:c-1
        sum=0;
        row=0;
        col=1;        
        for k=i-1:i+1
            row=row+1;
            col=1;
            for l=j-1:j+1                
                sum = sum+A1(k,l)*filter(row,col);    %laplace sonucunu al           
                col=col+1;
            end
        end
      A2(i,j)=sum;      
    end
end
C0 = A2.*degree;
sharpened0=imsubtract(AT,C0);
degree=0.25;
C025 = A2.*degree;
sharpened075=imsubtract(AT,C025);
degree=0.75;
C075 = A2.*degree;
sharpened025=imsubtract(AT,C075);
degree=1;
C1 = A2.*degree;
sharpened1=imsubtract(AT,C1);
subplot(2,2,1);imshow(sharpened0);title('Laplace Katsayı=0')
subplot(2,2,2); imshow(sharpened025);title('Laplace Katsayı=0.25')
subplot(2,2,3);imshow(sharpened075);title('Laplace Katsayı=0.75')
subplot(2,2,4);imshow(sharpened1);title('Laplace Katsayı=1')
