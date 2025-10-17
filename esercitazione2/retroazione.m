% Simulazione della retroazione nel sistema massa-molla, con ingresso che
% agisce solo in retroazione: u(t) = -kx(t)

clear; clc

k = 1; % N/m : costante elastica
M = 0.5; % kg : massa
tt = 0 : 0.01 : 10; % intervallo temporale
x0 = [0; 2]; % C.I.
P = [-1+i*10 ; -1-i*10]; % impongo autovalori con parte reale negativa

A = [0 1; -k/M 0];
B = [0; 1/M];
C = [1 0];
D = 0;

% calcolo traiettoria a ciclo chiuso

K = place(A, B, P);
A_C = A-B*K;

% ora impongo B = 0, ossia ingresso non in retroazione nullo

model = ss(A_C, zeros(2,1), C, D);

[Y, TT, X] = lsim(model, zeros(length(tt),1), tt, x0);


% calcoliamo la traiettoria a ciclo aperto

model = ss(A, B, C, D);

[YS, TT, XS] = lsim(model, zeros(length(tt),1), tt, x0);

figure
axis equal
grid on
plot(TT, X(:,1), 'r');
hold on
plot(TT, XS(:,1), 'g');
title('Risposta Massa-Molla a Ciclo Chiuso con Retroazione vs senza');
xlabel('Tempo (s)');
ylabel('Posizione X (m)');