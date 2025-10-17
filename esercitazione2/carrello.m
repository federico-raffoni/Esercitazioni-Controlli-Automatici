clear; clc

k = 1; % N/m : costante elastica
M = 0.5; % kg : massa
tt = 0 : 0.1 : 10; % intervallo temporale

A = [0 1; -k/M 0];
B = [0; 1/M];
C = [1 0];
D = 0;

model = ss(A,B,C,D);

% evoluzione libera

x0 = [0;1]; % C.I.
u=zeros(length(tt), 1);

[YL, TT, XL] = lsim(model, u, tt, x0);
plot(TT, XL(:,1), 'r');
hold on

% evoluzione forzata

x0 = [0; 0]; % C.I.
T = 5; %periodo di ingresso
u = sin((2*pi/T)*tt); % ingresso

[YF, TT, XF] = lsim(model, u, tt, x0);
plot(TT, XF(:,1), 'b');
hold on

% uso entrambi vs libera + forzata

x0 = [0;1]; % C.I.

[YL, TT, X] = lsim(model, u, tt, x0);
plot(TT, X(:,1), 'g');
hold on

plot(TT, XL(:,1)+XF(:,1), 'y');
hold off