function [ B ] = textrem1( A,a )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a1=rgb2gray(a);
model=fspecial('gaussian',[mod(size(a,1),20) mod(size(a,2),20)],15);
modelim=imfilter(a1,model,'replicate');
lev=graythresh(modelim);
smtbi=im2bw(modelim,lev);
dimn=round(size(a,2)/3);
col=rand(1,dimn);
col=round(col*size(a,2));
thck=0;whtsp=0;
for ctr=1:dimn
    ctr1=1;
    while smtbi(ctr1,col(1,ctr))~=0
        if ctr1~=size(a,1)
            ctr1=ctr1+1;
        else
            break
        end
    end
    if ctr1==1
        break;
    else
        while smtbi(ctr1,col(1,ctr))~=1
            thck=thck+1
            if ctr1~=size(a,1)
                ctr1=ctr1+1;
            else
                break
            end
        end
        while smtbi(ctr1,col(1,ctr))~=0
            whtsp=whtsp+1
            if ctr1~=size(a,1)
                ctr1=ctr1+1;
            else
                break
            end
        end
    end
end
if thck==0||whtsp==0||(thck==0&&whtsp==0)
    ofst=30;
else
    thck=thck/dimn;
    whtsp=whtsp/dimn;
    ofst=round(thck+(whtsp));
end
%stats=regionprops(smtbi,'MinorAxisLength');
%for ctr=1:size(stats,1)
%    st(ctr)=stats(ctr).MinorAxisLength;
%end
% st=round(st);
% thck=round(mean(st));
[m,n]=size(A);
B=zeros(m,n);
for i=1:m
    for j=1:n
        if A(i,j)>50
            d=j;
            while(A(i,d)~=0)
                if d~=n
                    d=d+1;
                else
                    break;
                end
            end
            while (i-ofst)<=0
                ofst=ofst-round(whtsp/2);
            end
            for k=i-ofst:i
                for l=j:d
                    B(k,l)=a(k,l);
                end
            end
        end
    end
end

end