function y=feature_self(A)

% A�Ǿ���
% y��������������������һ����������������ڶ������������ֱ�����С��������ֵ��

[row,col]=size(A);
A1=A(:,[1:col-1]);A2=A(:,[2:col]);  
C1=corr(A1,conj(A1));                      
C2=corr(A1,conj(A2));                     
c1=min(abs(eig(C1)));                  
c2=min(abs(eig(C2)));                   
y(1,1)=min(c1,c2); 
d=svd(A);
y(2,1)=min(d);
y(3,1)=max(d);

end

