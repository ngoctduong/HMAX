% Copyright: LE Hai Son lehaison@ioit.ac.vn
% Input:
% p1: Interesting points of the first image
% p2: Interesting points of the second image
% f1: Descriptor of interesting points of the first image
% f2: Descriptor of interesting points of the second image
% thrs_rmin: Usually in [0.5,0.7] Threshold as in the article 
% of Lowe For thresholding, use the simpler approach due to 
% Lowe of thresholding on the ratio between the first and the 
% second nearest neighbors"
% Output:
% pairs of features that look similar:
% op1 (in the first image), op2 (in the second image)

function [op1 op2]=matchdesvector(p1,p2,f1,f2,thrs_rmin);

%Use dist2 to compute the distance between the vectors of two images
dts=dist2(f1,f2);
sdts=size(dts,1);
[dtsmin,idmin]=sort(dts,2);
%Compute vmin: The minimal distances of vectors of images 1 with neighbour
%Comput rmin: e1-nn/e2-nn
vmin=zeros(sdts,1);
rmin=zeros(sdts,1);
for i=[1:sdts]
    vmin(i)=dtsmin(i,1);
    rmin(i)=dtsmin(i,1)/dtsmin(i,2);
end
%Keep only the couple of vectors who help the rmin < threshold
idc=zeros(1,2);
for i=[1:sdts]
    if(rmin(i)<thrs_rmin)    
        idc=[idc;[i idmin(i,1)]];        
    end
end
idc(1,:)=[];
%op1, op2: The array of couple out
op1=zeros(1,2);
op2=zeros(1,2);
for i=[1:size(idc,1)]
    op1=[op1;p1(idc(i,1),:)];
    op2=[op2;p2(idc(i,2),:)];
end

op1(1,:)=[];
op2(1,:)=[];
