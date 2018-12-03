clc;
close all;
A1=imread('R2256x256.jpg');%orjinal fotoğraf
A1=rgb2gray(A1);%gri seviye dönüşüm
lap = [1 1 1; 1 -8 1; 1 1 1];%laplace maske
b=3;%laplace maske 3x3 boyutta
[y,x] = size(A1);%boyut alınır
A2=zeros(size(A1));%sonucu tutar
pad=floor(b/2);
modifyImge = padarray(double(A1),[pad,pad]); % 0 pad ekleme
for i= 1:x
    for j=1:y
       localRegion = modifyA(i:i+(b-1),j:j+(b-1)); % maskenin kapladığı alan 
       C = localRegion.*lap;%maske değerletiyle çarpılır
       total=sum(C(:));%Çarpım sonucu toplanır
       A2(i,j)=total;%laplace filtre sonucunu tutar
    end
end
A2=uint8(A2);%laplace uygulanmış resim
sharpenedA = imsubtract(A1, A2);%Imge-Lalpace uygulanmış imge

B1=imread('R29x9B.jpg');%orjinal fotoğraf
B2=zeros(size(B1));%sonucu tutar
modifyImgeB = padarray(double(B1),[pad,pad]); % 0 pad ekleme
for i= 1:x
    for j=1:y
       localRegion = modifyImgeB(i:i+(b-1),j:j+(b-1)); % maskenin kapladığı alan 
       C = localRegion.*lap;%maske değerletiyle çarpılır
       total=sum(C(:));%Çarpım sonucu toplanır
       B2(i,j)=total;%laplace filtre sonucunu tutar
    end
end
B2=uint8(B2);%laplace uygulanmış resim
sharpenedB = imsubtract(B1, B2);%Imge-Lalpace uygulanmış imge


C1=imread('R215x15B.jpg');%orjinal fotoğraf
C2=zeros(size(C1));%sonucu tutar
modifyImgeC = padarray(double(C1),[pad,pad]); % 0 pad ekleme
for i= 1:x
    for j=1:y
       localRegion = modifyImgeC(i:i+(b-1),j:j+(b-1)); % maskenin kapladığı alan 
       C = localRegion.*lap;%maske değerletiyle çarpılır
       total=sum(C(:));%Çarpım sonucu toplanır
       C2(i,j)=total;%laplace filtre sonucunu tutar
    end
end
C2=uint8(C2);%laplace uygulanmış resim
sharpenedC = imsubtract(C1, C2);%Imge-Lalpace uygulanmış imge

D1=imread('R235x35B.jpg');%orjinal fotoğraf
D2=zeros(size(D1));%sonucu tutar
modifyImgeD = padarray(double(D1),[pad,pad]); % 0 pad ekleme
for i= 1:x
    for j=1:y
       localRegion = modifyImgeD(i:i+(b-1),j:j+(b-1)); % maskenin kapladığı alan 
       C = localRegion.*lap;%maske değerletiyle çarpılır
       total=sum(C(:));%Çarpım sonucu toplanır
       D2(i,j)=total;%laplace filtre sonucunu tutar
    end
end
D2=uint8(D2);%laplace uygulanmış resim
sharpenedD = imsubtract(D1, D2);%Imge-Lalpace uygulanmış imge

figure; 
subplot(3,4,1);imshow(A1); title('Orjinal resim');
subplot(3,4,2);imshow(B1); title('9x9 bulanık resim');
subplot(3,4,3);imshow(C1); title('15x15 bulanık resim');
subplot(3,4,4);imshow(D1);  title('35x35 bulanık resim');
subplot(3,4,5);imshow(A2);  title('Laplace filtreli resim');
subplot(3,4,6);imshow(B2);  title('Laplace filtreli resim');
subplot(3,4,7);imshow(C2);  title('Laplace filtreli resim');
subplot(3,4,8);imshow(D2);  title('Laplace filtreli resim');
subplot(3,4,9);imshow(sharpenedA);  title('Keskin resim');
subplot(3,4,10);imshow(sharpenedB);  title('Keskin resim');
subplot(3,4,11);imshow(sharpenedC);  title('Keskin resim');
subplot(3,4,12);imshow(sharpenedD);  title('Keskin resim');
