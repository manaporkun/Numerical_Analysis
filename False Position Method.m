y = @(x) x^3-2*x+16;
x1 = input('Enter first value: ');
x2 = input('Enter second value: ');
iteration = input('Enter number of iteration: ');
error = input('Enter minimum error: ');

if y(x1)*y(x2)> 0
    fprintf('No root exist within the given interval\n');
    return
end

if y(x1) == 0
    fprintf('x1 is one of the roots\n');
    return
elseif y(x2) == 0
    fprintf('x2 is one of the roots\n');
    return
end

if y(x1)<0 && y(x2)>0
    xl = x1;
    xu = x2;
elseif y(x1)>0 && y(x2)<0
    xl = x2;
    xu = x1;
else
    fprintf('Error');
    return
end 

xrold = 0;

for i=1:iteration

    xr = xu - (y(xu)*(xl-xu))/(y(xl)-y(xu));
    ea = abs((xr - xrold) / xr);
    xrold = xr;
        
    if y(xr) < 0
        xl = xr;
    elseif y(xr) > 0
        xu = xr;
        
    elseif y(xr) == 0
        break;
    end
    
    if ea <= error
        break;
    end
end

fprintf('The estimated root: %f\nThe number of iteration: %d\n',xr,i)
root = fzero(y,x1);
fprintf('The exact root : %f\n',root)
fplot(y)
hold on
plot(xr,y(xr),"*r")
hold on
xL = xlim;
yL = ylim;
line([0 0], yL);
line(xL, [0 0]); 
hold on 
plot(root,y(root),"*b")

