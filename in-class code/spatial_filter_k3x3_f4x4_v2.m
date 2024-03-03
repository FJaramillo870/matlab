clc;
clear all;
pkg load image;

%***** Construct Image, f(x,y) *************
f_0 = [0 1 0 1;0 0 1 1;1 1 0 0;1 1 1 1]*127;
imshow(uint8(f_0));
%*******************************************

%***** Construct Kernel, k(u,v) ************
k = [1 1 1;1 1 1;1 1 1]*1./9;
display(k)
%*******************************************

%***** Construct Padding, k(u,v) ************
f_P = [0 0 1 0 1 1;...
       0 0 1 0 1 1;...
       0 0 0 1 1 1;...
       1 1 1 0 0 0;...
       1 1 1 1 1 1;...
       1 1 1 1 1 1]*127;
figure;
imshow(uint8(f_P));
%*******************************************

%*************** Define f_s_0 and 1 ********
f_s_0 = f_P(1:3,1:3);
f_s_1 = f_P(1:3,2:4);
f_s_2 = f_P(1:3,3:5);
f_s_3 = f_P(1:3,4:6);

f_s_4 = f_P(2:4,1:3);
f_s_5 = f_P(2:4,2:4);
f_s_6 = f_P(2:4,3:5);
f_s_7 = f_P(2:4,4:6);
%*******************************************

%******* Hadamard Multiply  k*f_s_0 and Sum*
temp_0 = k.*f_s_0;
sum_s_0 = sum(sum(temp_0));

temp_1 = k.*f_s_1;
sum_s_1 = sum(sum(temp_1));

temp_2 = k.*f_s_2;
sum_s_2 = sum(sum(temp_2));

temp_3 = k.*f_s_3;
sum_s_3 = sum(sum(temp_3));

temp_4 = k.*f_s_4;
sum_s_4 = sum(sum(temp_4));

temp_5 = k.*f_s_5;
sum_s_5 = sum(sum(temp_5));

temp_6 = k.*f_s_6;
sum_s_6 = sum(sum(temp_6));

temp_7 = k.*f_s_7;
sum_s_7 = sum(sum(temp_7));
%*******************************************

%************** Replace Pixel for f_s_0 ****
f_1 = zeros(size(f_0,1),size(f_0,2));
f_1(1,1) = sum_s_0;
f_1(1,2) = sum_s_1;
f_1(1,3) = sum_s_2;
f_1(1,4) = sum_s_3;

f_1(2,1) = sum_s_4;
f_1(2,2) = sum_s_5;
f_1(2,3) = sum_s_6;
f_1(2,4) = sum_s_7;
imshow(uint8(f_1));
%*******************************************
