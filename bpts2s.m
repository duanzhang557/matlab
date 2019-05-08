function s=bpts2s(bp,ts,delta)
kosi=sqrt(1-1./(1+((1./pi).*log(1./bp)).^2));
wn=-log(delta.*sqrt(1-kosi.^2))/(kosi.*ts);
s=-kosi.*wn+j.*wn.*sqrt(1-kosi.^2);
