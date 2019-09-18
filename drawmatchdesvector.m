function drawmatchdesvector(im1g,im2g,ptstc1,ptstc2,bl)    
im3g=[im1g im2g];
figure();
imshow(im3g);
hold on;
pts1=ptstc1;
pts2=ptstc2;
pts2(:,2)=ptstc2(:,2)+size(im1g,2);
%show features detected in image 1,2
plot(pts1(:,2),pts1(:,1),'+g'); 
plot(pts2(:,2),pts2(:,1),'*r'); 
%show displacements
if(bl)
    co=[1:size(pts1,1)];
    line([pts1(co,2)'; pts2(co,2)'],[pts1(co,1)'; pts2(co,1)'],'color','y');
end