delta=0.02;
x=ScopeData1(1:1)
y=ScopeData1(:,2);
plot(x,y)
[mp,ind]=max(y)
tp=x(ind)
num=length(x);%����
yss=y(num)%�ȶ�ֵ
pos=100*(mp-yss)/yss%������

for i=1:1:num
    if y(i)>yss
    tr=x(i)
    break  
    end
end

for i=i:num
 if y(i)>=(1+delta)*yss|y(i)<=(1-delta)*yss
    maxum=x(i);        %����ʱ��,2%�����
 end
end
ts=max(maxum)
