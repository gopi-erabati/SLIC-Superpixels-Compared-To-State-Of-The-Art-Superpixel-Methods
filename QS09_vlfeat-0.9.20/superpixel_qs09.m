function img_with_pxl_bound = superpixel_qs09 (in_img, ratio, kernelsize, maxdist,ndist)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input Parameters
% in_img      Image to segement
% ratio       tradeoff between color importance and spatial importance 
%             (larger values give more importance to color), 
% kernelsize  size of the kernel used to estimate the density
% maxdist     maximum distance between points in the feature space that 
%             may be linked if the density is increased.
% 
%
% output 
% img with superpixels overlaid.
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example:
% img = imread('bee.jpg');
% superpixel_qs09(img,0.5,2,50,10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Iedge = vl_quickvis(in_img, ratio, kernelsize, maxdist,ndist);

%to draw superpixel (function written by us)
img_with_pxl_bound = drawsuperpxlboundary(uint16(Iedge),in_img,[255 0 0]);
%figure,imshow(img_with_pxl_bound);