function gimo=drawmosaic(H,imin,bbox)
imo=cell(size(imin,1),1);
for i =[1:size(H,1)]
    HT=[H{i}(:,2) H{i}(:,1) H{i}(:,3)]; %Change x1<->y1,x2'<->y2'
    HT=[HT(2,:);HT(1,:);HT(3,:)];
    imo{i}=vgg_warp_H(double(imin{i}),HT,'linear', bbox);    
end
gimo=zeros(size(imo{1},1),size(imo{1},2),3);
nba=zeros(size(imo{1},1),size(imo{1},2));
for i=[1:size(imo,1)]
%     for j=[1:size(gimo,1)]
%         for k=[1:size(gimo,2)]
%             if(~isnan(imo{i}(j,k,1)))
%                 gimo(j,k,:)=gimo(j,k,:)+imo{i}(j,k,:);
%                 nba(j,k)=nba(j,k)+1;
%             end
%         end
%     end
    gimo=max(gimo,imo{i});
end
% for j=[1:size(gimo,1)]
%     for k=[1:size(gimo,2)]
%         if(nba(j,k)~=0)
%             gimo(j,k,:)=gimo(j,k,:)/nba(j,k);
%         end
%     end
% end

%gimo=gimo/3;

figure();
imagesc(gimo/255);