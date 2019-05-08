function [ngc,dgc]=fg_lead_pm(ng0,dg0,Pm,w)
[mu,pu]=bode(ng0,dg0,w);
[gm,pm,wcg,wcp]=margin(mu,pu,w);
alf=ceil(Pm-pm+5);
phi=(alf)*pi/180;
a=(1+sin(phi))/(1-sin(phi));
dbmu=20*log10(mu);
mm=-10*log10(a);
wgc=spline(dbmu,w,mm);
T=1/(wgc*sqrt(a));
ngc=[a*T,1];dgc=[T,1];