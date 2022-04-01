clc;
clear all;

data1 = readmatrix("HW4-1.xls");

x1 = data1(:,1);
y1 = data1(:,2);
output1 = data1(:,3);

a = 0;
b = 0;
for i = 1:length(x1)
    a = a + x1(i)*x1(i);
    b = b + x1(i)*y1(i);
end

p = b/a

figure(1)
x = 0:0.1:max(x1);
y = p*x;
plot(x,y, 'color', 'red')
hold on
plot(x1, y1, '.', 'markersize', 8, 'color', 'blue')
hold off






