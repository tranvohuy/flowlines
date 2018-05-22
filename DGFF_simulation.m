% This code is written in Octave which is a free version of Matlab. 
% All syntax are the same as in Matlab
% create DGFF on {0,1,2,...,n} x {0,1,2,...,n}
% with zeros boundary condition.
% and save it in a file
n = 100;
Z = randn(n+1);

for x=1:n-1
  for y = 1:n-1
  %normalize with sqrt of eigenvalues.
    Z(x+1,y+1)=Z(x+1,y+1)/n/sqrt((sin(x*pi/(2*n)))^2+ (sin(y*pi/(2*n)))^2);
  end
end

h = zeros(n+1);

X = 0:1:n;
J = 0:1:n;

A = sin(pi/n * J'*X);
h = A *  Z * A;
fprintf("Max of DGFF: %f\n",max(max((h))));
fprintf("Min of DGFF: %f\n",min(min((h))));
fprintf("Theoretical max sqrt(2/pi)*log(n)-3/8*sqrt(2/pi)*log(log(n)): %f\n", ...
sqrt(2/pi)*log(n)-3/8*sqrt(2/pi)*log(log(n)));
% 1/2 smaller from Ding, Peres's paper because of normalization 


figure;

X = 0:1:n;
surf(X/n,X/n,h);
az = 0;
el = 90;
view(az, el);

figure;
pcolor(X/n,X/n,h)
shading interp
colorbar