clc;
clear all;
pkg load image;

f_original = imread('apple.jpg');
f_original = rgb2gray(f_original);
f_original = imsmooth(f_original,'Median');

f_sobel = imcomplement(uint8(edge(f_original,'Sobel').*255));
f_canny = imcomplement(uint8(edge(f_original,'Canny',0.10).*255));
f_laplacian = imcomplement(uint8(edge(f_original,'LoG').*255));

subplot(1,4,1)
imshow(f_original);
subplot(1,4,2)
imshow(f_sobel);
subplot(1,4,3)
imshow(f_canny);
subplot(1,4,4)
imshow(f_laplacian);

figure;
imshow(f_canny);

imwrite(f_original,'f_original_bw.png');
imwrite(f_sobel,'f_sobel.png');
imwrite(f_canny,'f_canny.png');
imwrite(f_laplacian,'f_laplacian.png');









