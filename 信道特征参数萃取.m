A=load('Test11');      
A11=A.ChannelIR;   
A=load('Test12');      
A12=A.ChannelIR;  
A=load('Test13');      
A13=A.ChannelIR;   
A=load('Test14');      
A14=A.ChannelIR;  
A=load('Test15');      
A15=A.ChannelIR;   
A=load('Test21');      
A21=A.ChannelIR;   
A=load('Test22');      
A22=A.ChannelIR;  
A=load('Test23');      
A23=A.ChannelIR;   
A=load('Test24');      
A24=A.ChannelIR;  
A=load('Test25');      
A25=A.ChannelIR;
A=load('Test31');      
A31=A.ChannelIR;   
A=load('Test32');      
A32=A.ChannelIR;  
A=load('Test33');      
A33=A.ChannelIR;   
A=load('Test34');      
A34=A.ChannelIR;  
A=load('Test35');      
A35=A.ChannelIR;
B=load('Test1ForScene');
B1=B.ChannelIR;  
B=load('Test2ForScene');
B2=B.ChannelIR;
Sample=load('Sample');
S=Sample.ChannelIR;

T={A11,A12,A13,A14,A15;A21,A22,A23,A24,A25;A31,A32,A33,A34,A35};  
u=[]; 
U={};
[sn,esen]=size(T);          %sn�ǳ���������esen��ÿ������ʵ�����
fn=3;                       %��������
for i=1:sn
    for j=1:esen
        u=[u;feature_self(T{i,j})];
    end
    u=reshape(u,fn,esen);
    U{i}=u;
    fea_average(:,i)=sum(U{i},2)/esen;   %%ÿһ�д���һ��������ƽ���������������о��м�������
    u=[];
end


b1=feature_self(B1);        %��ƥ���������ƥ������fea_average��
b2=feature_self(B2);        %��ƥ�������

%%������ƥ�䷨
Bpmodeldistinguish( fea_average,b1 );
Bpmodeldistinguish( fea_average,b2 );




%% ����������ʾ��

for i=1:sn
    V1(:,i)=abs(fea_average(:,i)-b1)./b1;   %��һ����������볡�������������
    V2(:,i)=abs(fea_average(:,i)-b2)./b2;   %�ڶ�����������볡�������������
end

%% �������������С�ĳ�����
vn=sum(V1);                                 %��һ��������������������������
vn1=find(vn==min(vn));                      %���һ����������������С�ĳ�����
vnt=sum(V2);                                %�ڶ���������������������������
vn2=find(vnt==min(vnt));                    %��ڶ�����������������С�ĳ�����

fprintf('��һ������������������������ֱ�Ϊ:%4.2f,%4.2f,%4.2f\n',vn(1),vn(2),vn(3));
fprintf('��һ�����������ӽ��ĳ���Ϊ������%d\n',vn1);
fprintf('�ڶ�������������������������ֱ�Ϊ:%4.2f,%4.2f,%4.2f\n',vnt(1),vnt(2),vnt(3));
fprintf('�ڶ������������ӽ��ĳ���Ϊ������%d\n',vn2);



%%%�������ĳ���
tol=1;
k=17700/20;
[ partvec,partn,err] = part_self( S,tol,k );
