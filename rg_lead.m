 function varargout=rg_lead(ng0,dg0,s1)
 if  nargout==1
     ngv=polyval(ng0,s1);
     dgv=polyval(dg0,s1);
     g=ngv/dgv;
     thetal=pi-angle(g);
     zc=real(s1)-imag(s1)/tan(thetal);
     t=-1/zc;
     varargout{1}=[t,1];
 elseif nargout==2
     ngv=polyval(ng0,s1);
     dgv=polyval(dg0,s1);
     g=ngv/dgv;
     theta=angle(g);
     phi=angle(s1);
     if theta>0
         phi_c=pi-theta;
     end
     if theta<0
         phi_c=-theta;
     end
     theta_z=(phi+phi_c)/2;
     theta_p=(phi-phi_c)/2;
     z_c=real(s1)-imag(s1)/tan(theta_z);
     p_c=real(s1)-imag(s1)/tan(theta_p);
     nk=[1 -z_c];
     varargout{2}=[1 -p_c];
     kc=abs(p_c/z_c);
     if theta<0
         kc=-kc;
     end
     varargout{1}=kc*nk;
 else
     error('the number of input is wrong');
 end
 
     
     