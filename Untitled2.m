delta=0.05;
x=ScopeData2(:,1);
y=ScopeData2(:,2);
plot(x,y)
[mp,ind]=max(y)
tp=x(ind)
num=length(x);%长度
yss=y(num)%稳定值
pos=100*(mp-yss)/yss%超调量

for i=1:1:num
    if y(i)>yss
    tr=x(i)
    break%调节时间,2%的误差
    end
end

for i=i:num
 if y(i)>=(1+delta)*yss|y(i)<=(1-delta)*yss
    maxum=x(i);        %调节时间,2%的误差
 end
end
ts=max(maxum)
