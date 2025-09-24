p = [1 -1 -1 1;...
     1  1 -1 -1]
t = [0 0 1 1;...
     0 1 1 0];
W0 = [0 0;0 0];
b0 = [1;0];
Q = 10; % số kỷ nguyên
c = 1e-6;
J = 1;
n_epoch = 0;
while J>c
    n_epoch = n_epoch + 1;
    J = 0;
    for i = 1:4
        n = W0*p(:,i)+b0;
        a = hardlim(n);
        e = t(:,i)-a;
        W0 = W0+e*p(:,i)';
        b0 = b0+e;
        J = J + e'*e;
    end
    J = J/4;
    if n_epoch > Q
        break;
    end
end
J 
W0
b0


