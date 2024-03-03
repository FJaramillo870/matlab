clc;
clear all;

% Bring in two images and create two labels ***************
f_1_image = zeros(7,7);
f_2_image = zeros(7,7);
N =5;
for k=1:N
  f_1_image(size(f_1_image,1),:,k) = rand(1,1:size(f_1_image,2))./2.0 + 0.5;
  f_1_image(:,1,k) = ones(size(1:f_1_image(:,:,k),1),1);
  %f_1_image = uint8(f_1_image.*255);
  y_l(k,1) = 1;
  %subplot(N,2,k)
  %imshow(f_1_image(:,:,k))
  
  f_2_image(1,:,k) = rand(1,1:size(f_2_image,2))./2.0 + 0.5;
  f_2_image(:,size(f_2_image,2),k) = ones(size(1:f_2_image(:,:,k),1),1);
  %f_2_image = uint8(f_2_image.*127);
  y_l(k,2) = 0;
  %subplot(N,2,k+1)
  %imshow(f_2_image(:,:,k))
endfor
% ***********************************************************