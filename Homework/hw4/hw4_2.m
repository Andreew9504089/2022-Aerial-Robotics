clc;
clear all;

data2 = readmatrix("HW4-2.xls");

data2 = data2 / norm(data2);
ax = data2(:,1);
ay = data2(:,2);
az = data2(:,3);

learning_rate = 0.01;
q = [1 0 0 0]';
trajectory = q;

for i = 2:length(ax)

    e = [2*-9.8*(q(2)*q(4) - q(1)*q(3)) - ax(i);
        2*-9.8*(q(1)*q(2) + q(3)*q(4)) - ay(i);
        2*-9.8*(0.5 - q(2)^2 - q(3)^2) - az(i)];
    
    J = [-2*-9.8*q(3),	2*-9.8*q(4),    -2*-9.8*q(1),	2*-9.8*q(2);
        2*-9.8*q(2),     2*-9.8*q(1),     2*-9.8*q(4),	2*-9.8*q(3);
        0,         -4*-9.8*q(2),    -4*-9.8*q(3),	0    ];
    
    step = (J'*e);
    if norm(step) ~= 0
        step = step / norm(step);
    else
        step = step;
    end


    q = q - learning_rate*step;
    trajectory = cat(2, trajectory, q);
end

figure(1)
subplot(4, 1, 1)
plot(trajectory(1,:))
title("theta")
subplot(4,1,2)
plot(trajectory(2,:))
title("X")
subplot(4, 1, 3)
plot(trajectory(3,:))
title("Y")
subplot(4, 1, 4)
plot(trajectory(4, :))
title("Z")

sgtitle("Trajectory")


