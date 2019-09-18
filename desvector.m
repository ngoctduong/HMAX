function app=desvector(x,s,ima)
%Compute the array of patch of pixel with every point x
%Conditions: x(1)>s*4,x(2)>s*4,x(1)<size(ima,1)-s*4,x(2)<size(ima,2)-s*4
app=zeros(1,64);
for nx=1:size(x,1)
    pp=zeros(1,64);
    pcul=x(nx,:)-s*4+floor(s/2);
    for i=[0:7]
        for j=[0:7]
            pp(i*8+j+1)=ima(pcul(1)+i*s,pcul(2)+j*s);
        end
    end
    m=mean(pp);
    c=cov(pp);
    if(sqrt(c)==0)
        nx
        x(nx,:)
    else
        pp=(pp-m)/sqrt(c);    
    end
    app=[app;pp];
end
app(1,:)=[];
