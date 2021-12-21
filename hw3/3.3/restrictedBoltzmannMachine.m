load('Patterns.mat');
numOfPatterns = 1;%size(patterns,2);
N = 9; % visible neurons
%M = [2 4 8 16];
M = 16; % hidden neurons
epochs = 100;
k = 100;
learningRate = 0.1;
h = zeros(M,k+1);
v = zeros(N,k+1);
b_h = zeros(M,k+1);
b_v = zeros(N,k+1);

% Initialize weights and thresholds
w = 0.01*(randn(M, N)-0.05);
wUpdate = zeros(M,N);
threshold1 = zeros(M, 1);
threshold2 = zeros(N, 1);
thresholdUpdate1 = zeros(M,1);
thresholdUpdate2 = zeros(N,1);
for ls = 1:100
for ep = 1:100
  
  for mu = 1:1%numOfPatterns
    
    %r = randi([1 14]);
    %v(:,1)=reshape(patterns{3},1,9)';
    v(:,1) = reshape([[0;1;1],[0;0;0],[0;0;0]],1,9);
    b_h(:,1) = w*v(:,1) - threshold1;
  
    for i = 1:M
      r = rand;
      if r<(1/(1+exp(-2*b_h(i,1))))
        h(i,1) = 1;
      else
        h(i,1) = -1;
      end
    end
  
    for t = 1:k
      b_v(:,t) = w'*h(:,t)-threshold2;
      for j = 1:N
        r = rand;
        if r<(1/(1+exp(-2*b_v(j,t))))
          v(j,t+1) = 1;
        else
          v(j,t+1) = -1;
        end
      end
      b_h(:,t+1) = w*v(:,t+1)-threshold1;
      for l = 1:M
        r = rand;
        if r<(1/(1+exp(-2*b_h(l,t+1))))
          h(l,t+1) = 1;
        else
          h(l,t+1) = -1;
        end
      end
    end
  
    wUpdate = learningRate*(tanh(b_h(:,1))*v(:,1)' - tanh(b_h(:,k)*v(:,k)'));
    thresholdUpdate2 = learningRate*(v(:,1)-v(:,k)); 
    thresholdUpdate1 = learningRate*(tanh(b_h(:,1)) - tanh(b_h(:,k)));
  
  end
  for mu=1:numOfPatterns
    w = w + wUpdate;
    threshold1 = threshold1 + thresholdUpdate1;
    threshold2 = threshold2 + thresholdUpdate2;
  end

end
 for sl = 1:14
  vTest = reshape(v(:,k),3,3);
  if vTest==patterns{sl}
    %disp('test');
  end
 end

end

%{
%}