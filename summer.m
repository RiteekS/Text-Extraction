function [ A ] = summer( e )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[m,n]=size(e);
A=zeros(m,n);
for i=1:m
    for j=1:n
        b=j;
        while(e(i,b)==1)
            A(i,j)=A(i,j)+1;
            if b~=n
                b=b+1;
            else
                break;
            end
        end;
    end;
end;
            
            

end

