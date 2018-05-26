x = [0 0.5 1 1.5 2 3];
y = [25.9 37.6 103.8 175.8 350 61.4];
figure;
plot(x, y, '*');
p = polyfit(x, y, 6);
f = polyval(p, x);
hold on
plot(x, f, '--r');