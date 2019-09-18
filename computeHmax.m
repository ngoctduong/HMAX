function [Hmax idmaxinlier idptsmaxitl] = computeHmax(ptstc1, ptstc2, thrs_inlier, ni)
n=size(ptstc1,1);
nmaxinlier=-1;
idmaxinlier=zeros(1,1);
Hmax=zeros(3,3);
idptsmaxitl=zeros(1,4);

for i=[1:ni]
    idr=randperm(n);
    [H,R1,R2]=homography(ptstc1(idr(1:4),:)',ptstc2(idr(1:4),:)');
    [idinlier,ninlier]=estRANSAC(ptstc1,ptstc2,H,thrs_inlier);    
    if(ninlier<=4)
        continue;
    end
    [H,R1,R2]=homography(ptstc1(idinlier,:)',ptstc2(idinlier,:)');
    [idinlier,ninlier]=estRANSAC(ptstc1,ptstc2,H,thrs_inlier);    
    if(nmaxinlier<ninlier)
        nmaxinlier=ninlier;
        idmaxinlier=idinlier;       
        Hmax=H;
        idptsmaxitl=idr(1:4);
    end
end
