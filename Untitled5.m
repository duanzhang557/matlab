% 10.2.1
% kk=1200;bp=0.25;ts=0.7;delta=0.02;
% ng0=[1];dg0=conv([1,0],conv([1,5],[1,20]));
% g0=tf(kk*ng0,dg0);
% s=bpts2s(bp,ts,delta)
% [ngc,dgc]=rg_lead(kk*ng0,dg0,s);
% gc=tf(ngc,dgc)
% g0c=tf(g0*gc);
% b1=feedback(g0,1);
% b2=feedback(g0c,1);
% step(b1,'r--',b2,'b');
% axis([0 ,1.2,0,1.8]);
% grid on
% [pos,tr,ts,tp]=stepchar(b2,delta)

%10.2.3
% kk=12;
% bp=0.15;ts=2.6;delta=0.05;
% s=bpts2s(bp,ts,delta);
% [kosi,wn]=s2kw(s)
% 
% 10.1
% delta=0.02
% s=kw2s(0.7,0.5);
% ng0=1;
% dg0=10000*[1 0 -1.1772];
% g0=tf(ng0,dg0);
% ngc=rg_lead(ng0,dg0,s)
% gc=tf(ngc,1)
% g0c=tf(g0*gc)
% b1=feedback(g0,1)
% b2=feedback(g0c,1)
% step(b1,'r--',b2,'b');
% grid on
% [pos,tr,ts,tp]=stepchar(b2,delta)

% 10.2
% ng0=[10];
% dg0=[1 4 0];
% kk=50;
% s1=-2+j*sqrt(6)
% [ngc,dgc,k]=rg_lag(ng0,dg0,kk,s1,2);
% gc=tf(ngc,dgc)

% 10.3
% ng0=[10];
% dg0=conv([1 2 0],[1 8]);
% kk=50;
% s1=-2+j*2*sqrt(3)
% [ngc,dgc,k]=rg_lag(ng0,dg0,kk,s1,2);
% gc=tf(ngc,dgc)

% 
% kk=40;Pm=50;
% ng0=1*kk;
% dg0=conv([1 1 0],[1 4]);
% g0=tf(ng0,dg0);
% w=logspace(0,4);
% wc=9;
%  
%  [ngc,dgc]=fg_lead_pm_wc(ng0,dg0,Pm,wc,w);
%  gc=tf(ngc,dgc);
%  g0c=tf(g0*gc);
%  b1=feedback(g0,1);
%  b2=feedback(g0c,1);
%  step(b1,'b--',b2,'r');
%  grid on;
%  bode(g0,'b--',g0c,'r');
%  grid on;
%  [gm,pm,wcg,wcp]=margin(g0c)

%10.4
% Pm=50;w=logspace(-2,5);
% ng0=[1];dg0=[1 5 0 0 ];
% g0=tf(ng0,dg0);
% [ngc,dgc]=fg_lead_pm(ng0,dg0,Pm,w);
% gc=tf(ngc,dgc)
% g0c=g0*gc;
% [gm,pm,wcg,wcp]=margin(g0c);
% km1=20*log(gm)
% gcc=feedback(g0c,1)
% [mag,phase,w]=bode(gcc);
% bode(gcc)
% mr=max(mag)
% a=find(mag==mr);%Ð³Õñ·åÖµ
% wr=w(a)%½ÇÆµÂÊ
% b=find(mag<=0.707*mag(1));
% wb=w(b(1))%´ø¿í

% 10.6
kk-200;bp=0.3;ts=0.7;
delta=0.05;
mg0=1;
dgo=conv([1,0],conv([0.1,1],conv([0.02,1],conv([0.01,1],[0.005,1]))));
g0=tf(ng0,dg0);
w=logspace(-4,3);
t=[0:0.1:3];
[mag,phase]=bode(kk*g0,w);
[gm0,pm0,wg0,wc0]=margin(mag,phase,w);
gm0=20*log(gm0)
mr=0.6+2.5*bp;
wc=ceil((2+1.5*(mr-1)+2.5*(mr-1)^2)*pi/ts);
h=(mr+1)/(mr-1)
w1=2*wc/(h+1);
w2=h*w1;
w1=wc/10;
w2=25;
ng1=[1/w1,1];
dg1=conv([1/w2,1],conv([1,0],[1,0]));
g1=tf(ng1,dg1);
g=polyval(ng1,j*wc)/polyval(dg1,j*wc);
k=abs(1/g);
g1=tf(k*g1);
h=tf(dg1,ng1);
kh=1/k;
h=tf(kh*h);
g2=feedback(kk*g0,h)
b1=feedback(kk*g0,1);
b2=feedback(g2,1);
bode(b1,b2)

grid on;
[pos,tr,ts,tp]=stepchar(b2,delta)

