function img_with_pxl_bound = drawsuperpxlboundary(label,img,color)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function draws the boundaries of detected superpixel using SLIC
% 
% input parameters
% 
%             label                       This is label image ,o/p of SLIC
%             img                         This is the original image
%             col                         This is color of boundary [R G B]
%             
% output
% 
%         img_with_pxl_bound              This gives image with detected 
%                                         superpixel with boundaries.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%define an operator to detect edges, here we choose simple operator
h = [-1 1];

%apply operator on labelled image to detect edges in x and y directions

grad_x = filter2(h,label);
grad_y = filter2(h',label);

grad = sqrt(grad_x.^2 + grad_y.^2);

%apply threshold
grad = grad > 0;

% %thin the edges using morphology
% we do it infinite times to remove pixels so that an object without holes shrinks to a minimally
% connected stroke
mask_img = bwmorph(grad,'thin',Inf); 

%as the boundary of image is global edge, the operation we did makes
%boundary as edge , so make them zero

mask_img(1,:) = 0;
mask_img(end,:) = 0;
mask_img(:,1) = 0;
mask_img(:,end) = 0;

[row,col,col_chan] = size(img);

img_with_pxl_bound = img;
for i = 1 : col_chan
    temp = img_with_pxl_bound(:,:,i);
    temp(mask_img) = color(i);
    img_with_pxl_bound(:,:,i) = temp;
end
