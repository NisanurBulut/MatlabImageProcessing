clc;
clear all;
an=imread('R2.jpg');%İmge oku
an=rgb2gray(an);
an=imresize(an,[500,500]);%resmi 500x500 boyuta getir

F=fft2(an);%fourier dönüşüm

d=medfilt2(an);
[m,n]=size(an);% resmin boyutlarını al
an=uint8(an);
b=9;%filtre maske boyutu
z=ones(b);
[p,q]=size(z);
w=1:p;
x=round(median(w));
anz=zeros(m+2*(x-1),n+2*(x-1));

for i=x:(m+(x-1))
    for j=x:(n+(x-1))
        anz(i,j)=an(i-(x-1),j-(x-1));
    end
end
    
sum=0;
x=0;
y=0;
for i=1:m
    for j=1:n
        for k=1:p
            for l=1:q 
                sum= sum+anz(i+x,j+y)*z(k,l);
                y=y+1;
            end
            y=0;
            x=x+1;
        end
        x=0;
        anse(i,j)=(1/(p*q))*(sum);
        sum=0;
    end
end
I1=uint8(anse);
[m,n]=size(I1);%Gürültülü resmin boyutlarını al

%Filtre hazırlama işlemi
H=zeros(500,500);
for i=1:m
  for j=1:m
      if(j<10 && i<10)
          H(i,j)=1/81;%9x9 filtre için 1/81 olur
      end
  end
end

H=fft2(H);%Maske üzerinde fourier dönüşümü
F1=F.*H;%Noktasal çarpım işlemi
I2=ifft2(F1);%ters dönüşüm işlemi
I2=abs(I2);%mutlak değer alımı
I2 = log(I2+1);%düzenleme
I2 = mat2gray(I2);%0-1 arası ölçeklendirme

subplot(1,3,1); imshow(an); title('Orjinal Resim');
subplot(1,3,2); imshow(I1); title('9x9 Ortalama Filtre Uygulanmış Resim');
subplot(1,3,3); imshow(I2); title('Fourier İşlemleri Sonucu');


