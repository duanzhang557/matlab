%fg_lag_pm()����ͼ���η����֮��У��������(wcδ֪)
function [ngc,dgc]=fg_lag_pm(ng0,dg0,w,Pm)
[mu,pu]=bode(ng0,dg0,w);
wgc=spline(pu,w,Pm+5-180);
ngv=polyval(ng0,j*wgc);
dgv=polyval(dg0,j*wgc);
g=ngv/dgv;
alph=abs(1/g);
T=10/alph*wgc;
ngc=[alph*T,1];
dgc=[T,1];
