clc;
clear all;

pkg load image

%Generate an image, f(x,y)
f_1 = ones(5,5);
f_1(3,3) = 0; 
f1_image = uint8(f_1.*127);
subplot(1,3,1)
imshow(f1_image);
%*************************

%Construct Blur Filter, k_blur, 3x3
k_gaus = [1 2 1;2 4 2;1 2 1]./16.0;
%**********************************

%Spatial convolution f1_hat = k_blur@f1_image
f1_hat = conv2(f1_image,k_gaus,'same');
f1_hat_image = uint8(f1_hat);
subplot(1,3,2)
imshow(f1_hat_image);
%*********************************************

% Frequency Domain FFT on f(x,y) --> F(u,v) --> [F_mag F_phase]
F1 = fft2(f1_image);
F1_mag = 1./(1+exp(-real(F1)));
F1_phase = 1./(1+exp(-imag(F1)));
F1_mag_image = uint8(F1_mag.*255);
F1_phase_image = uint8(F1_phase.*255);
figure;
subplot(1,2,1)
imshow(F1_mag_image);
subplot(1,2,2)
imshow(F1_phase_image);
f1_freq = ifft2(imag(F1));
f1_freq = imag(f1_freq);
%**************************************************************


%**************************************************************



