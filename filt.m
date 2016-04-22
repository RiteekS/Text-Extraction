function [ A ] = filt( a )
[m,n]=size(a);
for i=1:m
    for j=2:(n-1)
       % if((a(i-1,j-1)==0&&a(i-1,j)==0&&a(i-1,j+1)==0)||(a(i+1,j-1)==0&&a(i+1,j)==0&&a(i+1,j+1)==0))
        if (a(i,j-1)==0&&a(i,j)==0&&a(i,j+1)==0)
            A(i,j)=1;
        else
            A(i,j)=0;
        end;
    end;
end

