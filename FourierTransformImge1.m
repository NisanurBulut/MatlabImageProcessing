%30x30uk bir imge olustur
f=zeros(30,30);
%imge içerisine bir dikdörtgen çizilir
f(5:24,13:17)=1;
imshow(f,'InitialMagnification', 'fit')
%DFT hesaplanır
F=fft2(f);
F2=abs(F);%magnitude/büyüklük hesaplanır
figure, imshow(F2,[],'InitialMagnification','fit');
F=fft2(f, 256, 256);
F2=abs(F);
figure, imshow(F2, []) 
F2=fftshift(F);
F2=abs(F2);
figure,imshow(F2,[])
F2=log(1+F2);
figure,imshow(F2,[]) 
