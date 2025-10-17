% simulazione di traiettoria e di diagramma delle fasi di un pendolo

clear; clc

g = 9.81; % m/s^2
tt = 0: 0.01 : 10;

% richiesta dei dati in input

fprintf('Inserire i parametri (costanti) per un pendolo ideale con forzatura costante\n')
l = input('Lunghezza del filo (m): ');
M = input('Massa (kg): ');
b = input('Coefficiente di attrito: ') ;
u = input('Momento in ingresso (costante): ');
theta0 = input('Angolo iniziale (rad): ');
w0 = input('Velocità angolare iniziale (rad/s): ');

% problema di Cauchy

f = @ (t, x) [x(2); -(g/l)*sin(x(1))-(b/(M*l^2))*x(2)+u/(M*l^2)];
IC = [theta0; w0];

[time, traj] = ode45(f, tt, IC);

% Grafici: diagramma di fase e posizione

% traj è un vettore colonna che a ogni istante associa l'angolo (:,1) e la
% velocità angolare (:, 2)

figure (1)
grid on
axis equal
g_phase = plot(traj(:,1), traj(:,2), 'b');
xlabel('\theta [rad]') 
ylabel('\omega [rad/s]')
title('Diagramma di fase')

figure (2)
grid on
axis equal
g_theta = plot(time, traj(:,1), 'r');
xlabel('Tempo [s]')
ylabel('\theta [rad]')
title('Evoluzione dello stato')

