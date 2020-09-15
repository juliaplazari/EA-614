% ----------------------------Compute matrix x = H*s'--------------------------%

%input s
s = sign(randn(1,100));

%matrix H as calculated previously
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
x = zeros(101,1);
for i=1:100
    x(i,1) = H(i,:)*s'(:,1); %use s transposed
end

% -------------------------------Define W1 and W2------------------------------%
%matriz W1
W1 = zeros(105,101);
for i=1:105
    if(i<=101)
        W1(i,i) = 1;
    end
    if(i-1>0 && i-1<=101)
        W1(i,i-1) = 0.5;
    end
    if(i-2>0 && i-2<=101)
        W1(i,i-2) = 0.25;
    end
    if(i-3>0 && i-3<=101)
        W1(i,i-3) = 0.125;
    end
    if(i-4>0 && i-4<=101)
        W1(i,i-4) = 0.625;
    end
end

%matriz W2
W2 = zeros(105,101);
for i=1:105
    if(i<=101)
        W2(i,i) = 1;
    end
    if(i-1>0 && i-1<=101)
        W2(i,i-1) = 1.5;
    end
    if(i-2>0 && i-2<=101)
        W2(i,i-2) = 0.7;
    end
    if(i-3>0 && i-3<=101)
        W2(i,i-3) = -0.2;
    end
    if(i-4>0 && i-4<=101)
        W2(i,i-4) = 0.3;
    end
end

% --------------------------Calculate and display y1 and y2--------------------%
%output y1 = W1*x
y1 = zeros(105,1);
for i=1:105
    y1(i,1) = W1(i,:)*x(:,1);
end

%display y1
disp("y1 - sinal x filtrado por w1");
disp(y1);

%output y2 = W2*x
y2 = zeros(105,1);
for i=1:105
    y2(i,1) = W2(i,:)*x(:,1);
end

%display y1
disp("y2 - sinal x filtrado por w2");
disp(y2);

% --------------------------------Graphs---------------------------------------%
figure()
stem(s,color ="b","markersize", 1)
hold on
stem(y1(1:100), color = "r","markersize", 1)
xlabel("n")
ylabel("Magnitude das entradas e saídas")
title("Gráfico 1: y1 e s")

figure()
stem(s, color ="b","markersize", 1)
hold on
stem(y2(1:100), color = "r","markersize", 1)
xlabel("n")
ylabel("Magnitude das entradas e saídas")
title("Gráfico 2: y2 e s")

% ------------------------------Compare y and s--------------------------------%
disp("Diferença y1 and s");
disp(y1(1:100)-s');
disp("Diferença y2 and s");
disp(y2(1:100)-s');
