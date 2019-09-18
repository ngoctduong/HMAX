function [Hmax idmaxinlier idptsmaxitl ptsd1 ptsd2 ptstc1 ptstc2]=mappingmosaic(im1,im2,thrs_harris,s,thrs_enn,thrs_inlier,ni)
% Use the modified harris.m with threshold
[x1,y1,v1]=harris(im1,thrs_harris);
[x2,y2,v2]=harris(im2,thrs_harris);
% ptsd1 and ptsd2 is the interesting points of the matrix im1, im2
% They are matrices of [number_of_points x 2]
% Please give them the values from x1,y1,x2,y2
ptsd1=;
ptsd2=;

% Compute the feature descriptor
app1=desvector(ptsd1,s,im1(:,:,1));
app2=desvector(ptsd2,s,im2(:,:,1));
[ptstc1 ptstc2]=matchdesvector(???,thrs_enn);
%drawmatchdesvector(im1(:,:,1),im2(:,:,1),ptstc1,ptstc2,1);
% Compute the best matrix for homorgraphy
[Hmax idmaxinlier idptsmaxitl] = computeHmax(ptstc1, ptstc2, thrs_inlier, ni);
