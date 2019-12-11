fprintf('The Estimation of LN(X) with Quadratic Interpolation\n\n');

x0 = input('Enter first value: ');
x1 = input('Enter second value: ');
x2 = input('Enter third value: '); 

func = @(x) log(x);

x = (1:10);

plot(x,func(x),'-*');
hold on
grid on

b0 = func(x0);
b1 = (func(x1)-func(x0))/(x1-x0);
b2 = (((func(x2)-func(x1))/(x2-x1))-b1)/(x2-x0);

y_est = [];

for i = 1 : 10
    est = b0 + b1*(i-x0)+b2*(i-x0)*(i-x1);
    y_est(i) = est;
end

plot(x,y_est,'-o');
