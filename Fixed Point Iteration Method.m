y = @(x) -0.15*x^3 + 1.5*x^2 - 5.25*x + 7.5;
g = @(x) (-0.15*x^3 + 1.5*x^2 + 7.5)/5.25;
x1 = input('Enter first value: ');
iteration = input('Enter number of iteration: ');
error = input('Enter minimum error: ');

if y(x1) == 0
    fprintf('x1 is one of the roots\n');
    return
end

% xr = 0;
% ea = 1;

for i=1:iteration

    xr = g(x1);
    ea = abs((xr -x1)/xr);
    if ea <= error
        break;
    end
    x1 = xr;
end


fprintf('Estimated error: %f\n',ea);
fprintf('The estimated root: %f\nThe number of iteration: %d\n',xr,i)
root = fzero(y,-5);
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


