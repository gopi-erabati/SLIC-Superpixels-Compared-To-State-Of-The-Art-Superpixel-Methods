function img_with_pxl_bound =  superpixel_slic(in_img,num_of_sup,m)
%======================================================================
%SLIC demo
% Copyright (C) 2015 Ecole Polytechnique Federale de Lausanne
% File created by Radhakrishna Achanta
% Please also read the copyright notice in the file slicmex.c 
%======================================================================
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% For SLICMEX function provided by author
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Input parameters are:
%[1] 8 bit images (color or grayscale)
%[2] Number of required superpixels (optional, default is 200)
%[3] Compactness factor (optional, default is 10)
%
%Ouputs are:
%[1] labels (in raster scan order)
%[2] number of labels in the image (same as the number of returned
%superpixels
%
%NOTES:
%[1] number of returned superpixels may be different from the input
%number of superpixels.
%[2] you must compile the C file using mex slicmex.c before using the code
%below
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for drawsuperpxlboundary function written by us
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input Parameters
% [1] label image, which is output of SLIC
% [2] image, which is input image
% [3] color, of the boundary to draw in the form of [R G B] mandatorily
% 
% Output is image with drawn super pixel boundaries.
%======================================================================
% Example:
% img = imread('bee.jpg');
% superpixel_slic(img,200,12);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[labels, numlabels] = slicmex(in_img,num_of_sup,m);%numlabels is the same as number of superpixels

%to draw superpixel boundary on given image (function written by us)
img_with_pxl_bound = drawsuperpxlboundary(labels,in_img,[255 0 0]);
%figure,imshow(img_with_pxl_bound);




