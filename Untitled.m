kk=20;delta=0.05;
ng0=[1];dg0=conv([1 1 0],[1 2]);
t=[0:0.01:5];
w=logspace(-2,2);
g0=tf(ng0,dg0);
b1=feedback(kk*g0,1);
[gm,pm,wcg,wcp]=margin(kk*g0)
roots(b1.den{1})
% 不符合要求

% % 设计超前
Pm=45;wc=1.5+0.2;
[ng1,dg1]=fg_lead_pm_wc(ng0,dg0,Pm,wc,w);
gc1=tf(ng1,dg1)

% % 设计滞后
g01=g0*gc1*kk;
[ng2,dg2]=fg_lag_pm(g01.num{1},g01.den{1},w,Pm);
gc2=tf(ng2,dg2)

% % 验算指标
g02=g01*gc2;
b2=feedback(g02,1);
figure(1)
bode(kk*g0,'r--',g02,'b',w)%(2)校正前后伯德图

figure(2)
bode(gc1*gc2,'g',w)%(2)校正装置伯德图
grid on

[pos,tr,ts,tp]=stepchar(b2,delta)%（1）计算超调量pos，上升时间tr，调节时间ts，峰值时间tp
[gm,pm,wcg,wcp]=margin(g02)%（3）计算幅值裕度Gm，相角裕度Pm，幅值裕度频率值Wcg，剪切频率Wcp，
figure(3)
step(b1,'r--',b2,'b',t);%（4）系统校正后，闭环，阶跃响应分析

% gc=zpk(kk*gc1*gc2)