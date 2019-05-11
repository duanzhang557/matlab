function [ngc,dgc]=fg_lead_pd(ng0,dg0,wc)
ngv=polyval(ng0,j*wc);dgv=polyval(dg0,j*wc);
g=ngv/dgv;
mg0=abs(g);
t=sqrt(((1/mg0)^2-1/(wc^2));
ngc=[t,1];dgc=[1];