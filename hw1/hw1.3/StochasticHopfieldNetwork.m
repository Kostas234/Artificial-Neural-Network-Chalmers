p = [7,45];
beta = 2;
N = 200;
Mav = zeros(1, size(p,2));
for l = 1:size(p,2)
  Msum = 0;
  M=0;
  for j = 1:100 
    patterns = [];
    for i = 1:p(l)
      patterns = 2*randi([0,1],N,i)-1;
    end
    w = 0;
    for k   = 1:p(l)
      w = w + mtimes(patterns(:,k), transpose(patterns(:,k)));
    end
    w = w-diag(diag(w));
    w = w/N;
    x_temp = patterns(:,1);
    S = 0;
    for m = 1:10^3
      for n = 1:N
        b = mtimes(w,x_temp);
        r = rand;
        if r<1/(1+exp(1)^(-2*beta*b(n)))
          x_temp(n) = 1;
        else
          x_temp(n) = -1;
        end
      end % bits loop
      S = S + x_temp;
    end % time loop
    M = dot(S,patterns(:,1));
    Msum = Msum + M/(N*10^3);
  end % trials loop
  Mav(l) = Msum/100;
end