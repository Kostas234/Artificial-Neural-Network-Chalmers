p = [12, 24, 48, 70, 100, 120];
N = 120;
perror1 = [];
perror2 = [];

for m = 1:2
  perror = [];
  for i = 1:length(p)
    e=0;
    for j = 1:10^5
      pattern = 2*randi([0,1],N,p(i)) - 1;
      w = 0;
      for k = 1:size(pattern,2)
        w = w + mtimes(pattern(:,k),transpose(pattern(:,k)));
      end
      if m == 1
        w = w-diag(diag(w));
      end
      w = w/N;
  
      randPattern = pattern(:,randi(p(i)));
      randBit = randi(N);
      b = mtimes(w,randPattern);
      x_temp = sign(b(randBit));
      if x_temp ~= randPattern(randBit)
        e = e + 1;
      end
    end % trials loop

    perror = [perror e/10^5];
 
  end % patterns loop
  if m == 1
    perror1 = perror;
  else
    perror2 = perror;
  end
end