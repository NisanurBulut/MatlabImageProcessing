I = imread('R1GaussNoise.jpg'); %load example data
A=I;
colormap gray
I = I(:,:,1);
N=3; %must be odd
sigma=1;
imagesc(I);
x=1:N;
X=exp(-(x-((N+1)/2)).^2/(2*sigma^2));
h=X'*X;
h=h./sum(h(:));
[is,js]=size(I);
Ib = NaN(is+N-1,js+N-1); %köşeleri ekle
b=(N-1)/2 +1;
Ib(b:b+is-1,b:b+js-1)=I;
I=zeros(size(I));
for i = 1:is
    for j = 1:js
        I(i,j)=sum(sum(Ib(i:i+N-1,j:j+N-1).*h,'omitnan'));
    end
end
 subplot(1,2,1); imagesc(A); title('Orjinal Resim');
 subplot(1,2,2); imagesc(I); title('Gaussian/Varyans Filtre Uygulanmış Resim');
colormap gray
