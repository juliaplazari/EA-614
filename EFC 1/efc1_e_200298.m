%calculate h as described in item b
H = zeros(6,5); %H will be a 5x6 matrix

for i=1:6
    if (i <= 5)
        H(i,i) = 1; %"principal diagonal" will be iqual to h[0]=1
    end
    if (i-1 > 0)
        j = i-1; %element before h[0] will be h[1] = -0.5
        H(i,j) = -0.5;
    end
end

w1 = [1;0.5;0.25;0.125;0.0625]; %given by the exercise
g1 = zeros(5,1); %define g1 as a matrix of zeros with dimension 5x1

%matrix product
for i=1:6
    g1(i,1) = H(i,:)*w1(:,1);
end

%diplay matrix G1, result of the convolution between H*W1
disp("g1 = H*w1");
disp(g1);

w2 = [1;1.5;0.7;-0.2;0.3];
g2 = zeros(5,1);

%matrix product
for i=1:6
    g2(i,1) = H(i,:)*w2(:,1);
end

%diplay matrix G2, result of the convolution between H*W2
disp("g2 = H*w2");
disp(g2);





