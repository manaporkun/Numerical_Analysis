y = @(x) x^3-4*x-9;
x1 = input('Enter first value: ');
x2 = input('Enter second value: ');
iteration = input('Enter the number of iterations: ');
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

for i = 1:iteration
    xh = (x1+x2)/2;
    if y(x1)*y(xh) < 0
        x2 = xh;
    else
        x1 = xh;
    end
    if abs(y(x1)) < error
        break
    end
end
fprintf('The estimated root: %f\nThe number of bisections: %d\n',x1,i)
root = fzero(y,x1);
fprintf('The exact root : %f\n',root)
fplot(y)
hold on
plot(x1,y(x1),"*r")
hold on
xL = xlim;
yL = ylim;
line([0 0], yL);
line(xL, [0 0]); 
hold on 
plot(root,y(root),"*b")