%creat one sample of DGFF

n = 500;
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

dlmwrite('DGFF_sample.txt',h,'delimiter',' ');
%fileID = fopen('DGFF_samdlmwrite('myFile.txt',M,'delimiter',' ');ple.txt','wt');
%for i=1:size(h, 1)
 %   fprintf(fileID, '%g\t ', h(i,:));
%    fprintf(fileID, '\n');
%end
%fclose(fileID);

%fileID = fopen('DGFF_sample.txt');
%h = fread(fileID);
%fclose(fileID);
%[A,delimiterOut]=importdata(fileID)
 %h = dlmread('DGFF_sample.txt');