%Initialize the values
xi = [];
yi = [];

i = input('Enter data points [xi, yi] \n');

n = size(i,1);
o = 1;
p = n + 1;
least = inf;

%Store values of the data points into xi and yi
while n ~= 0 
    
    xi(2:end+1) = xi;
    xi(1) = i(o);
    xi = sort(xi);
    yi(2:end+1) = yi;
    yi(1) = i(p);
    yi = sort(yi);
    
    o = o + 1;
    p = p + 1;
    n = n - 1;
    
end

%Compute for the best fit
if (size(i,1)) <= 10 %Limit to only 10 data points
    r = (size(i,1)) - 1;
else
    r = 10;
end

while r ~= 0
    
    p = polyfit(xi,yi,r);
    f = polyval(p, xi);
    e = yi - f;
    norm_e = norm(e);
    if norm_e < least
        least = min(norm_e);
        BestFit = p;
    end
    
    r = r - 1;
end

format short g

%Plotting

x = (min(xi):1/100:max(xi));
y = polyval(BestFit, x);
plot(x,y,'-r'), hold on
plot(xi, yi, '--bo')
title 'Curve of Best Fit'
xlabel 'x_i'
ylabel 'y_i'
legend ('Curve of Best Fit','Data Points x_i, y_i')

disp('-----------------')
disp('Line of Best Fit:')
disp(BestFit)