close all;
clear all;

total = 2500; % no of days
dt = 0.1; % time step
N = 100000; % initial population

mu1 = 0.002; % natural death of uninfected
mu2 = 0.004; % death of infected
beta = 0.5; % susceptible to exposed
epsilon = 1 / 12; % exposed to infected 
gamma = 1 / 21; % infected to recovered 
delta =  1 / 180; % immune to susceptible
rho = 1 / 90; % recovered to susceptible
B = 10; % birth per day

iter = total / dt + 1;  % number of iterations

t = zeros(iter, 1);
M = zeros(iter, 1); %passive immune
S = zeros(iter, 1); %susceptible
E = zeros(iter, 1); %Exposed
I = zeros(iter, 1); %infected
R = zeros(iter, 1); %recovered
D = zeros(iter, 1); %dead

S(1) = 0.8 * N; 
I(1) = 270;
M(1) = N - S(1) - I(1);


for i = 2 : iter
    N = M(i - 1) + S(i - 1) + E(i - 1) + I(i - 1) + R(i - 1);
    M(i) = M(i - 1) + dt * (B - (delta + mu1) * M(i - 1));
    S(i) = S(i - 1) + dt * (B - mu1 * S(i - 1) + delta * M(i - 1) - ((beta * S(i - 1) * I(i - 1)) / N )+ rho * R(i - 1));
    E(i) = E(i - 1) + dt * ( ((beta * S(i - 1) * I(i - 1)) / N) - (epsilon + mu2) * E(i - 1));
    I(i) = I(i - 1) + dt * (epsilon * E(i - 1) - (gamma + mu2) * I(i - 1));
    R(i) = R(i - 1) + dt * (gamma * I(i - 1) - (rho + mu1) * R(i - 1));
    D(i) = D(i - 1) + dt * (mu1* M(i-1)) + (mu1*S(i-1))+ (mu1*R(i-1)) + (mu2 * (E(i-1)+I(i-1)));
    t(i) = t(i - 1) + dt;
end

plot(t, M, 'Linewidth', 1.3);
hold on
plot(t, S, 'Linewidth', 1.3);
hold on
plot(t, E, 'Linewidth', 1.3);
hold on
plot(t, I, 'Linewidth', 1.3);
hold on
plot(t, R, 'Linewidth', 1.3);
%hold on
%plot(t, D, 'Linewidth', 1.3);
legend("Passive Immune","Susceptible","Exposed","Infected","Recovered");
grid on;
grid minor;
xlabel("time");
ylabel("number of people")
xlim([0, 1000]);

m=M(total / dt + 1,1)
s=S(total / dt + 1,1)
e=E(total / dt + 1,1)
i=I(total / dt + 1,1)
r=R(total / dt + 1,1)
d=D(total / dt + 1,1)

