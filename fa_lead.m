%伯德图解析法设计带惯性的串联超前控制器
function [ngc,dgc]=fa_lead(ng0,dg0,Pm,wc,w)
ngv=polyval(ng0,j*wc);
dgv=polyval(dg0,j*wc);
g=ngv/dgv;
thetag=angle(g);
mg=abs(g);
thetar=Pm*pi/180;
tz=(1+mg*cos(thetar-thetag))/(-wc*mg*sin(thetar-thetag));
tp=(cos(thetar-thetag)/(wc*sin(thetar-thetag));
ngc=[tz,1];
dgc=[tp,1];