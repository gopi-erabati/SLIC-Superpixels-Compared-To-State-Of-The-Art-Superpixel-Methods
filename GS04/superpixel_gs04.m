function img_with_pxl_bound = superpixel_gs04(in_img, sigma,k , min_size)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Input:
%   input_image: uint8 type H-by-W-by-3 RGB array
%         sigma: scalar param used to smooth the input image before segmenting it
%             k: scalar param for the threshold function
%      min_size: param for minimum component size enforced by post-processing
% Output:
%  Image with superpixels
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example:
% img = imread('bee.jpg');
% superpixel_gs04(img,0.5,200,100);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pf.make;  %to make mex file

% to run gs04 sgementation algorithm
segmentation = pf.segment(in_img, sigma,k , min_size); 

%to draw superpixel boundary (code written by us)
img_with_pxl_bound = drawsuperpxlboundary(segmentation,in_img,[255 0 0]);
%figure,imshow(img_with_pxl_bound);