% Runs the superpixel code on the lizard image

addpath('lsmlib');
img = im2double(imread('bee.jpg'));
[phi,boundary,disp_img] = superpixels(img, 4250);
imagesc(disp_img);
