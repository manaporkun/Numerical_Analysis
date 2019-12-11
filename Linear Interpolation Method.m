fprintf('The Estimation of LN(X) with Linear Interpolation\n\n');

a = input('Enter first value: ');
b = input('Enter second value: ');

func = @(x) log(x);

x = (1:10);

plot(x,func(x),'-*');
hold on
grid on

y_est = [];

for i = 1:10
    est = func(a) + ((func(b)-func(a))/(b-a))*(i-a);
    y_est(i) = est;
   
end

plot(x,y_est,'-o');


fprintf('\nTrue Value : %d\n',func(2));