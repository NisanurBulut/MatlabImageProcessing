my_image = imread('R2.jpg');%resmi oku
my_image=imresize(my_image,[256,256]);%resmi 256x256 boyuta indirge
my_image=rgb2gray(my_image);%siyah beyaz formata getir
my_image = im2double(my_image');
image_thresholded = my_image;
a=0.05;
b=0.05;
X=rand(size(my_image,1),size(my_image,2));%random bir matris üretir
c= X<=a;%0.05 değerinden küçük olanlar
image_thresholded(c)=0;
u=a+b;%u=0.1
c=find(X>a & X<=u);%0.1 ve 0.05 arası bulunur
image_thresholded(c)=1;
subplot(1,2,1);imshow(my_image);title('Orjinal Fotoğraf');
subplot(1,2,2);imshow(image_thresholded);title('Tuz Biber Gürültüsü Eklenmiş Fotoğraf');
imwrite(image_thresholded,'R2SaltPepper.jpg');
