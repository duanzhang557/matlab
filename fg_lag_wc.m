   %fg_lag_wc����ͼ���η�����ͺ�У��������
   function [ngc,dgc]=fg_lag_wc(ng0,dg0,w,wc)
   ngv=polyval(ng0,j*wc);
   dgv=polyval(dg0,j*wc);
   g=ngv/dgv;
   alph=abs(1/g);
   T=10/(alph*wc);
   ngc=[alph*T,1];
   dgc=[T,1];