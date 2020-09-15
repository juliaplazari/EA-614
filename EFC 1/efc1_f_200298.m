%define s as a (1,100) vector
%+1 or -1 randomly
s = sign(randn(1,100));

%calculate H as in the preview item
H = zeros(101,100);
for i=1:101
    if(i<=100)
        H(i,i) = 1;
        end
    if (i-1 > 0)
        j = i-1;
        H(i,j) = -0.5;
    end
end

%matrix x will be a (100,1) vector
x = zeros(100,1);
for i=1:100
    x(i,1) = H(i,:)*s'(:,1); %use s transposed
end

disp("s"); 
disp(s);%display matrix s
disp("x = H*s', display x'")
disp(x'); %display x transposed, as it is easier to visualize
%compute the difference between s and x
disp(x-s');