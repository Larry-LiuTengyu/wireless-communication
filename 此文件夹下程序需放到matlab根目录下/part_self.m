function [ partvec,partn,err,erryindex] = part_self( S,tol,k )
%  Inupts:
%         S        : ��������
%         tol      : ��ֹ��׼��һ����С������
%         k        : ��С�����������У�����С��λ��1�׶�Ӧ118��

%  Outputs:
%         partvec: �ָ�ڵ��������ָ�к�����ɵ�������
%         partn  : �ָ����õĳ��������ָ���˼���������partn=Length(partvec)
%         err    : ����������
%         erryindex: �ָ��������±�
 
partvec=1;
count=k;

Sp=S([1:count],:);
feavec=feature_self(Sp);
count=count+k;
[row,col]=size(S);
n=floor(row/k)-2;
erryindex=[];

for i=1:n
    feavec_old=feavec;
    Sp=S([partvec(end):count],:);    % ������һ��
    feavec=feature_self(Sp);
    err(i,1)=sum(abs(feavec-feavec_old)./abs(feavec_old));
    if (err(i,1)>tol)                  
        partvec=[partvec;count-k+1];       %���������µķָ��
        Sp=S([partvec(end):count],:);
        feavec=feature_self(Sp);
        erryindex=[erryindex;i];
    end
    count=count+k;
end
partn=length(partvec);    

