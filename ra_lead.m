%ra_lead 根轨迹解析法设计串联超前矫正。
function [ngc,dgc]=ra_lead(ng0,dg0,s1)
ngv=polyval(ng0,s1);
dgv=polyval(dg0,s1);
g=ngv/dgv;
thetag=angle(g);
mg=abs(g);
thetas=angle(s1);
ms=abs(s1);
tz=(sin(thetas)-mg*sin(thetag-thetas))/(mg*ms*sin(thetag));
tp=-(mg*sin(thetas)+sin(thetag-thetas))/(ms*sin(thetag));
ngc=[tz,1];
dgc=[tp,1];