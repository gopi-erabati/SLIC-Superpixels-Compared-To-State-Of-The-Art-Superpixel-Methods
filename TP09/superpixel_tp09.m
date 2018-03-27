function disp_img = superpixel_tp09(in_img,num)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Input
% in_img  image to make superpixels
% num     number of superpixels required
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example:
% img = imread('bee.jpg');
% superpixel_tp09(img,300);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath('lsmlib');
img = im2double(in_img);
[phi,boundary,disp_img] = superpixels(img, 4250);
%imshow(disp_img);
