close all; clear all; clc
% solve z'(t) = e^{i*h(z(t))} = cos(h(z(t)) + i*sin(h(z(t)),
%         z(0)=z0


h = dlmread('DGFF_sample.txt');
n = size(h,1);
[xgrid,ygrid]=meshgrid(1:1:n);

z0 = 0.5+ i*0.5;
    
dt = 1e-3;
zx(1) = real(z0);
zy(1) = imag(z0);
ind = 2;

lowx=0.1; highx=0.9;
lowy=0.1; highy=0.9;
N_theta = 3;
theta = 0:1/N_theta:0.5;
plot([0 0]);
axis([0 1  0 1]);

for j=1:N_theta+1
  theta_temp = theta(j);
  for ind=2:1500
       
      h1 = interp2(xgrid,ygrid,h,n*real(z0),n*imag(z0)); % h(z(t))
      k1 = cos(h1+theta_temp) + i*sin(h1+theta_temp);

    
      z1 = z0+ (dt/2)*k1; % vector z0+dt/2*k1
      h2 = interp2(xgrid,ygrid,h,n*real(z1),n*imag(z1)); 
      k2 = cos(h2+theta_temp) + i*sin(h2+theta_temp);
    
      z2 = z0 + (dt/2)*k2; % vector z0+ dt/2*k2
      h3 = interp2(xgrid,ygrid,h,n*real(z2),n*imag(z2));
      k3 = cos(h3+theta_temp) + i*sin(h3+theta_temp);
    
      z3 = z0+ dt*k3;
      h4 = interp2(xgrid,ygrid,h,n*real(z3),n*imag(z3));
      k4 = cos(h4+theta_temp) + i*sin(h4+theta_temp);
    
      z0 = z0 + 1/6*dt*(k1+ 2*k2+ 2*k3+ k4);
      zx(ind) = real(z0);
      zy(ind) = imag(z0);
      if ((zx(ind)<lowx) || (zx(ind)>highx) || (zy(ind)<lowy) || (zy(ind)>highy))
          break;
      end
    
  end
  plot(zx,zy);
end
axis([0 1  0 1]);

%axis([0 1  0 1]);
%