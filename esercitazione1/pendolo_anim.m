% animazione di un pendolo semplice

clear; clc

g = 9.81; % m/s^2
timespan = 0: 0.01 : 10;

% richiesta dei dati in input
fprintf('Inserire i parametri (costanti) per un pendolo ideale con forzatura costante\n')
l = input('Lunghezza del filo (m): ');
M = input('Massa (kg): ');
b = input('Coefficiente di attrito: ') ;
u = input('Momento in ingresso (costante): ');
theta0 = input('Angolo iniziale (rad): ');
w0 = input('Velocità angolare iniziale (rad/s): ');

% problema di Cauchy
f = @(t, x) [x(2); -(g/l)*sin(x(1))-(b/(M*l^2))*x(2)+u/(M*l^2)];
IC = [theta0, w0];

% soluzione
[time, traj] = ode45(f, timespan, IC);

theta = traj(:,1);
omega = traj(:,2);

% Animazione pendolo
h = figure(1);
h_line = plot([0, l*sin(theta(1))], [0, -l*cos(theta(1))], 'k-', 'LineWidth', 2);
hold on
h_mass = plot(l*sin(theta(1)), -l*cos(theta(1)), 'bo', 'MarkerSize', 12, 'MarkerFaceColor', 'b');
axis equal
axis([-l l -l 0.1])
grid on

for k = 1:length(time)
    
    % controlla se finestra è chiusa
    if ~isvalid(h) 
        break
    end
    
    % aggiorna animazione pendolo
    x_p = l*sin(theta(k));
    y_p = -l*cos(theta(k));
    set(h_line, 'XData', [0, x_p], 'YData', [0, y_p])
    set(h_mass, 'XData', x_p, 'YData', y_p)
    
    drawnow
end

