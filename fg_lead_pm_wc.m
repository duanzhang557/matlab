function [ngc,dgc]=fg_lead_pm_wc(ng0,dg0,Pm,wc,w)
[mu,pu]=bode(ng0,dg0,w);
ngv=polyval(ng0,j*wc);dgv=polyval(dg0,j*wc);
g=ngv/dgv;
theta=180*angle(g)/pi;
alf=ceil(Pm-(theta+180)+5);
phi=(alf)*pi/180;
a=(1+sin(phi))/(1-sin(phi));
dbmu=20*log10(mu);
mm=-10*log10(a);
wgc=spline(dbmu,w,mm);
T=1/(wgc*sqrt(a));
ngc=[a*T,1];dgc=[T,1];