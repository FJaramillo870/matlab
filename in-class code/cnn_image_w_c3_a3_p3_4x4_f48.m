clc;
clear all;

% Bring in two images and create two labels ***************

f_1_image = imread('butterfly_474x710.jpg');
y_l(1) = 1;
subplot(4,2,1)
imshow(f_1_image)

f_2_image = imread('butterfly_474x710.jpg');
y_l(2) = 0;
subplot(4,2,2)
imshow(f_2_image)
% ***********************************************************

% CAP 1
% *****Construct 3 Spatial Convolutions for f_1 and f_2******
%Number 1 Convolution
k_1 = [-1 0 1;-1 0 1;-1 0 1]; %Left Vertical Edge Filter
f_1_c1 = conv2(double(f_1_image)./255,k_1,'same');
f_2_c1 = conv2(double(f_2_image)./255,k_1,'same');
subplot(4,2,3)
imshow(uint8(f_1_c1.*255))
subplot(4,2,4)
imshow(uint8(f_2_c1.*255))
%Number 2 Convolution
k_2 = [1 2 1;2 4 2;1 2 1]./16; %Gaussian filter
f_1_c2 = conv2(double(f_1_image)./255,k_2,'same');
f_2_c2 = conv2(double(f_2_image)./255,k_2,'same');
subplot(4,2,5)
imshow(uint8(f_1_c2.*255))
subplot(4,2,6)
imshow(uint8(f_2_c2.*255))
%Number 3 Convolution
k_3 = [-1 -1 -1;0 0 0;1 1 1]; % Bottom Horizontal Edge Filter
f_1_c3 = conv2(double(f_1_image)./255,k_3,'same');
f_2_c3 = conv2(double(f_2_image)./255,k_3,'same');
subplot(4,2,7)
imshow(uint8(abs(f_1_c3.*255)))
subplot(4,2,8)
imshow(uint8(abs(f_2_c3.*255)))
%************************************************************

%************* Activation f_1_c1,2,3 and f_2_c1,2,3 *********
f_1_a1 = 1./(1+exp(-f_1_c1));
f_2_a1 = 1./(1+exp(-f_2_c1));

f_1_a2 = 1./(1+exp(-f_1_c2));
f_2_a2 = 1./(1+exp(-f_2_c2));

f_1_a3 = 1./(1+exp(-f_1_c2));
f_2_a3 = 1./(1+exp(-f_2_c2));

figure;
subplot(3,2,1)
imshow(uint8(f_1_a1.*255))
subplot(3,2,2)
imshow(uint8(f_2_a1.*255))
subplot(3,2,3)
imshow(uint8(f_1_a2.*255))
subplot(3,2,4)
imshow(uint8(f_2_a2.*255))
subplot(3,2,5)
imshow(uint8(f_1_a3.*255))
subplot(3,2,6)
imshow(uint8(f_2_a3.*255))
%************************************************************

%********************* Pooling 5x5 --> 3x3 w/stride = 2 *****
k_p = [1 0 0;0 1 0;0 0 1]./3;
f_1_p1 = conv2(f_1_a1,k_p,'valid');
f_2_p1 = conv2(f_2_a1,k_p,'valid');

f_1_p2 = conv2(f_1_a2,k_p,'valid');
f_2_p2 = conv2(f_2_a2,k_p,'valid');

f_1_p3 = conv2(f_1_a3,k_p,'valid');
f_2_p3 = conv2(f_2_a3,k_p,'valid');

figure;
subplot(3,2,1)
imshow(uint8(f_1_p1.*255))
subplot(3,2,2)
imshow(uint8(f_2_p1.*255))
subplot(3,2,3)
imshow(uint8(f_1_p2.*255))
subplot(3,2,4)
imshow(uint8(f_2_p2.*255))
subplot(3,2,5)
imshow(uint8(f_1_p3.*255))
subplot(3,2,6)
imshow(uint8(f_2_p3.*255))
%************************************************************

% CAP 2
% *****Construct 3 Spatial Convolutions for f_1 and f_2******
%Number 1 Convolution
k_1 = [1 0 -1;1 0 -1;1 0 -1]; % Right Vertical Edge Filter
f_1_c12 = conv2(f_1_p1,k_1,'same');
f_2_c12 = conv2(f_2_p1,k_1,'same');
figure;
subplot(4,2,3)
imshow(uint8(f_1_c12.*255))
subplot(4,2,4)
imshow(uint8(f_2_c12.*255))
%Number 2 Convolution
k_2 = [1 2 1;2 4 2;1 2 1]./16; %Gaussian filter
f_1_c22 = conv2(f_1_p2,k_2,'same');
f_2_c22 = conv2(f_2_p2,k_2,'same');
subplot(4,2,5)
imshow(uint8(f_1_c22.*255))
subplot(4,2,6)
imshow(uint8(f_2_c22.*255))
%Number 3 Convolution
k_3 = [1 1 1;0 0 0;-1 -1 -1]; % Top Horizontal edge filter
f_1_c32 = conv2(f_1_p3,k_3,'same');
f_2_c32 = conv2(f_2_p3,k_3,'same');
subplot(4,2,7)
imshow(uint8(abs(f_1_c32.*255)))
subplot(4,2,8)
imshow(uint8(abs(f_2_c32.*255)))
%************************************************************

%************* Activation f_1_c1,2,3 and f_2_c1,2,3 *********
f_1_a12 = 1./(1+exp(-f_1_c12));
f_2_a12 = 1./(1+exp(-f_2_c12));

f_1_a22 = 1./(1+exp(-f_1_c22));
f_2_a22 = 1./(1+exp(-f_2_c22));

f_1_a32 = 1./(1+exp(-f_1_c32));
f_2_a32 = 1./(1+exp(-f_2_c32));

figure;
subplot(3,2,1)
imshow(uint8(f_1_a12.*255))
subplot(3,2,2)
imshow(uint8(f_2_a12.*255))
subplot(3,2,3)
imshow(uint8(f_1_a22.*255))
subplot(3,2,4)
imshow(uint8(f_2_a22.*255))
subplot(3,2,5)
imshow(uint8(f_1_a32.*255))
subplot(3,2,6)
imshow(uint8(f_2_a32.*255))
%************************************************************

%********************* Pooling 5x5 --> 3x3 w/stride = 2 *****
k_p = [1 0 0;0 1 0;0 0 1]./3;
f_1_p12 = conv2(f_1_a12,k_p,'valid');
f_2_p12 = conv2(f_2_a12,k_p,'valid');

f_1_p22 = conv2(f_1_a22,k_p,'valid');
f_2_p22 = conv2(f_2_a22,k_p,'valid');

f_1_p32 = conv2(f_1_a32,k_p,'valid');
f_2_p32 = conv2(f_2_a32,k_p,'valid');

figure;
subplot(3,2,1)
imshow(uint8(f_1_p12.*255))
subplot(3,2,2)
imshow(uint8(f_2_p12.*255))
subplot(3,2,3)
imshow(uint8(f_1_p22.*255))
subplot(3,2,4)
imshow(uint8(f_2_p22.*255))
subplot(3,2,5)
imshow(uint8(f_1_p32.*255))
subplot(3,2,6)
imshow(uint8(f_2_p32.*255))
%************************************************************

%******** Flatten Images from Pooling, (3x3)x3 = 27 elements*
f1_flat = zeros(1,3.*size(f_1_p12,1)*size(f_1_p12,2));
f1_flat(1,1:???) = reshape(f_1_p12,...
                 [1 size(f_1_p12,1)*size(f_1_p12,2)]);                
f1_flat(1,???:???) = reshape(f_1_p22,...
                 [1 size(f_1_p22,1)*size(f_1_p22,2)]);   
f1_flat(1,???:???) = reshape(f_1_p32,...
                 [1 size(f_1_p32,1)*size(f_1_p32,2)]);   
      
f2_flat = zeros(1,3.*size(f_2_p12,1)*size(f_2_p12,2));
f2_flat(1,1:9) = reshape(f_2_p12,...
                 [1 size(f_2_p12,1)*size(f_2_p12,2)]);                
f2_flat(1,10:18) = reshape(f_2_p22,...
                 [1 size(f_2_p22,1)*size(f_2_p22,2)]);   
f2_flat(1,19:27) = reshape(f_2_p32,...
                 [1 size(f_2_p32,1)*size(f_2_p32,2)]);       
%************************************************************

%********************* Plot Pooled Flattened Images *********
figure;
plot(f1_flat,'b')
hold 
plot(f2_flat,'r')
%************************************************************

%********************* Plot Original Images *****************
f1_o_flat = reshape(f_1, [1 size(f_1,1)*size(f_1,2)]);
f2_o_flat = reshape(f_2, [1 size(f_2,1)*size(f_2,2)]);
figure;
plot(f1_o_flat,'g');
hold
plot(f2_o_flat,'m');
%************************************************************









