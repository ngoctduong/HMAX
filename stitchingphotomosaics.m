warning off all %Warning: Turn off warning 
clc;
bbox=[-700 1600 -200 800];
nim1='..\images\fromwindow_2.jpg';
nim2='..\images\fromwindow_1.jpg';
nim3='..\images\fromwindow_3.jpg';
nim=strvcat(nim1,nim2,nim3);
nimage=size(nim,1);
cH=cell(nimage,1);
cH{1}=eye(3);
%Read the images
im1=imread(nim(1,:));
idmaxinlier=cell(nimage,1);
idptsmaxitl=cell(nimage,1);
ptsd=cell(nimage,1);
ptstc=cell(nimage,1);
nrinlier=cell(nimage,1);

% Read docs, codes to define these values of 5 parameters below

thrs_harris=;
thrs_enn=;
thrs_inlier=;
ni=;
s=;

for i=[2:size(nim,1)]
    im2=imread(nim(i,:));
    %Compute the matrice homographic
    [cH{i} idmaxinlier{i} idptsmaxitl{i} ptsd{i} ptstc{i}]=...
        mappingmosaic(im2,im1,thrs_harris,s,thrs_enn,thrs_inlier,ni);
    if(idmaxinlier{i}==0) % Something went wrong, we don't have any inlier
        disp(i)
        return;
    end
    %Compute inlier/inlier+outlier
    nrinlier{i}=length(idmaxinlier{i})/size(ptstc{i},1);
end

%Draw the image mosaic
cim=cell(nimage,1);
for i=[1:nimage]
    cim{i}=imread(nim(i,:));
end
immosaic=drawmosaic(cH,cim,bbox);
imwrite(immosaic/255,'images/fromwindow_mosaic.jpg')
