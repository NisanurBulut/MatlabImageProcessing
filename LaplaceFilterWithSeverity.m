clc;
close all;
AT=imread('R2256x256.jpg');
AT=rgb2gray(AT);
AT=im2double(AT);
[r, c]=size(AT);
A1=im2double(AT);
filter=[1 1 1;1 -8 1; 1 1 1];
A2=A1;

for i=2:r-1
    for j=2:c-1
        sum=0;
        row=0;
        col=1;        
        for k=i-1:i+1
            row=row+1;
            col=1;
            for l=j-1:j+1                
                sum = sum+A1(k,l)*filter(row,col);               
                col=col+1;
            end
        end
      A2(i,j)=sum;      
    end
end
sharpenedA3 = imsubtract(AT, A2);%Imge-Lalpace uygulanmış imge
degreeLaplace=0;
Ad0=A2;
for i=2:r-1
    for j=2:c-1
        Ad0(r,j)=A2(r,c)*degreeLaplace;
    end
end
sharpenedA0 = imsubtract(AT, Ad0);%Imge-Lalpace uygulanmış imge
Ad0=uint8(Ad0);%laplace uygulanmış resim

degreeLaplace=0.25;
Ad1=A2;
for i=2:r-1
    for j=2:c-1
        Ad1(r,j)=A2(r,c)*degreeLaplace;
    end
end
sharpenedA1 = imsubtract(AT, Ad1);%Imge-Lalpace uygulanmış imge
Ad1=uint8(Ad1);%laplace uygulanmış resim

degreeLaplace=0.75;
Ad2=A2;
for i=2:r-1
    for j=2:c-1
        Ad2(r,j)=A2(r,c)*degreeLaplace;
    end
end
sharpenedA2 = imsubtract(AT, Ad2);%Imge-Lalpace uygulanmış imge
Ad2=uint8(Ad2);%laplace uygulanmış resim
subplot(2,2,1);imshow(sharpenedA0);title('Laplace Katsayı=0')
subplot(2,2,2); imshow(sharpenedA1);title('Laplace Katsayı=0.25')
subplot(2,2,3);imshow(sharpenedA2);title('Laplace Katsayı=0.75')
subplot(2,2,4);imshow(sharpenedA3);title('Laplace Katsayı=1')
