clear all;
clc
a=imread('R2.jpg');
b=rgb2gray(a);
b=imresize(b,[256,256]);
[satir,sutun]=size(b);
randMatrix=randn(satir,sutun);
x=5;
y=0;
ISize = input('Kaç adet gürültü resim üretilsin ?');
randMatrix2=x*randMatrix+y;
for i=1:satir 
    for j=1:sutun
        b1(i,j)=b(i,j)+randMatrix2(i,j);
    end
end

sumMatris = zeros(size(b1));

for i=1:ISize
std=15;%n=randn(satir,sutun);
randMatrix=randn(satir,sutun);
n3=std*randMatrix+y;%gürültü üretilit
for k=1:satir
    for j=1:sutun 
        b3(k,j)=b(k,j)+n3(k,j);
    end
end
b4=im2double(b3);
for k=1:satir
    for j=1:sutun 
        sumMatris(k,j)=sumMatris(k,j)+b4(k,j);
    end
end
end
meanImage = sumMatris / ISize;
subplot(3,2,1); imshow(b); title('Orjinal Resim');
subplot(3,2,2); imhist(b); title('Orjinal Resim Histogram');
subplot(3,2,3); imshow(b3); title('Gürültülü Resim');
subplot(3,2,4); imhist(b3); title('Gürültülü Resim Histogram');
subplot(3,2,5); imshow(meanImage); title('Ortalama Resim');
subplot(3,2,6); imhist(meanImage); title('Ortalama Resim Histogram');
