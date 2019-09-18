% Copyright: LE Hai Son lehaison@ioit.ac.vn
function [H,R1,R2]=homography(im1_pts,im2_pts)
%ax=(-x1,-y1,-1,0,0,0,x2'x1,x2'y1,x2')
%ay=(0,0,0,-x1,-y1,-1,y2'x1,y2'y1,y2')
n=size(im1_pts,2);
Ab=[-im1_pts(1,:);-im1_pts(2,:);-ones(1,n);...
    zeros(3,n);...
    im2_pts(1,:).*im1_pts(1,:);im2_pts(1,:).*im1_pts(2,:);im2_pts(1,:);...
    ];
A=[zeros(3,n);...
    -im1_pts(1,:);-im1_pts(2,:);-ones(1,n);...
    im2_pts(2,:).*im1_pts(1,:);im2_pts(2,:).*im1_pts(2,:);im2_pts(2,:);...
    ];
A=[Ab';A'];
[U,S,V]=svd(A); 
H=V(:,end);
R2=norm(A*H);
H=reshape(H,3,3)';
R1=U(9);


% nim1_pts=[im1_pts;ones(1,n)];
% nim2_pts=[im2_pts;ones(1,n)];
% M=H*nim1_pts;
% M(1,:)=M(1,:)./M(3,:);
% M(2,:)=M(2,:)./M(3,:);
% M(3,:)=ones(1,n);
% M=M-nim2_pts;
