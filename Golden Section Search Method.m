func = @(x) x^2-6*x+15;
R = 0.618033988;
a = input('Enter first value: ');
b = input('Enter second value: ');
maxIter = input('Enter max iteration value: ');
tolerance = input('Enter tolerance value: ');

fa = func(a);
fb = func(b);

fprintf('------------------------------------------------------\n');
fprintf(' K      x1      x2        f(x1)    f(x2)    b - a\n');
fprintf('------------------------------------------------------\n');
%fprintf(' %d %.3e %.3e %.3e %.3e %.3e\n', k, x1, x2, f1, f2, b-a);

for k = 1:maxIter
    
   x1 = a+R*(b-a);
   x2 = b-R*(b-a);
   f1 = func(x1);
   f2 = func(x2);
    
   if(f1>f2)
       a = x2;
       %x2 = x1;
       %f2 = f1;
       %x1 = a+R*(b-a);
       %f1 = func(x1);
   else
       b = x1;
       %x1 = x2;
       % = f2;
       %x2 = b-R*(b-a);
       % = func(x2);
   end
    fprintf(' %d %.3e %.3e %.3e %.3e %.3e\n', k, x1, x2, f1, f2, b-a);
    if((x1-x2)<tolerance)
        break;      
    end
end

fprintf('\nMAX : %d\n',15 - (36 / 4));
