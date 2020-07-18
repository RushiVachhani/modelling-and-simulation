close all;
clear all;

N = 20; % N x N grids
t = 1000; % time/ iterations/ no. of. matrices/ days

mu1 = 0.002;
mu2 = 0.004;
beta = 0.5;
epsilon = 1.0 / 12;
gamma = 1.0 / 21;
delta =  1.0 / 180;
rho = 1 / 90;

grids = zeros(N, N, t);

% ****** States *****
M = 1;
S = 2;
E = 3;
I = 4;
R = 5;
D = 6;
%*********************

times = ones(N, N);

total = zeros(6, 1);

for i = 1 : N
    for j = 1 : N
        x = rand();
        if x < 0.85
            grids(i, j, 1) = S;
        elseif x < 0.95
            grids(i, j, 1) = M;
        else
            grids(i, j, 1) = D;
        end;
        total(grids(i, j, 1)) = total(grids(i, j, 1)) + 1;
    end;
end;


dx = [-1, 1, 0, 1, -1, 1, -1, 0]; % positions of cells
dy = [1, 1, 1, 0, 0, -1, -1, -1]; % positions of cells

% initializing infected **********************
grids(N / 2, N / 2, 1) = I;
grids(8, 6, 1) = I;
grids(5, 7, 1) = I;
% *********************************************

%grids(:, :, 1);


ax1 = zeros(t, 1);
ax1(1) = 1;

cs = zeros(t, 1);
ci = zeros(t, 1);
cr = zeros(t, 1);

for x = 2 : t
    for i = 1 : N
        for j = 1 : N
            c = grids(i, j, x - 1);
            cnt = zeros(6, 1);
            for w = 1 : 8
                ni = i + dx(w);
                nj = j + dy(w);
                if(ni <= 0) ni = 1; 
                    end
                if(nj <= 0) nj = 1; 
                    end
                if(ni > N) ni = N; 
                    end
                if(nj > N) nj = N; 
                    end
                
                cnt(grids(ni, nj, x - 1)) = cnt(grids(ni, nj, x - 1)) + 1;
            end
            
            if c == M
                if times(i, j) == 180
                    grids(i, j, x) = S;
                    times(i, j) = 1;
                    continue;
                end
                x2 = rand();
                if x2 < mu1
                    grids(i, j, x) = D;
                    times(i, j) = 1;
                    continue;
                end
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = times(i, j) + 1;
            
            elseif c == S
                cI = cnt(I);
                x2 = rand();
                rho = 1 - (1 - 0.05) ^ cI;
                if x2 < rho
                    grids(i, j, x) = E;
                    times(i, j) = 1;
                    continue;
                end
                x2 = rand();
                if x2 < mu1
                    grids(i, j, x) = D;
                    times(i, j) = 1;
                    continue;
                end
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = times(i, j) + 1;
            
            elseif c == E
                if times(i, j) == 12
                    grids(i, j, x) = I;
                    times(i, j) = 1;
                    continue;
                end
                x2 = rand();
                if x2 < mu2
                    grids(i, j, x) = D;
                    times(i, j) = 1;
                    continue;
                end
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = times(i, j) + 1;
            
            elseif c == I
                if times(i, j) == 21
                    grids(i, j, x) = R;
                    times(i, j) = 1;
                    continue;
                end
                x2 = rand();
                if x2 < mu2
                    grids(i, j, x) = D;
                    times(i, j) = 1;
                    continue;
                end
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = times(i, j) + 1;
            
            elseif c == R
                if times(i, j) == 90
                    grids(i, j, x) = S;
                    times(i, j) = 1;
                    continue;
                end
                x2 = rand();
                if x2 < mu1
                    grids(i, j, x) = D;
                    times(i, j) = 1;
                    continue;
                end
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = times(i, j) + 1;
            else
                x2 = rand();
                if x2 < mu1
                    times(i, j) = 1;
                    temp = rand();
                    if temp < 0.5
                        grids(i, j, x) = S;
                    else
                        grids(i, j, x) = M;
                    end
                    continue;
                end
                grids(i, j, x) = grids(i, j, x - 1);
                times(i, j) = times(i, j) + 1;
            end
        end
    end
    for i = 1 : N
        for j = 1 : N
            if grids(i, j, x) == S
                cs(x) = cs(x) + 1;
            elseif grids(i, j, x) == I
                ci(x) = ci(x) + 1;
            elseif grids(i, j, x) == R
                cr(x) = cr(x) + 1;
            end
        end
    end
    ax1(x) = x;
end

x = 1;

temp1 = zeros(N,N);
temp2 = zeros(N,N);

for i = 1 : N
    for j = 1 : N
        
        temp1(i,j)=i;
        temp2(i,j)=j;
        
        if grids(i, j, x) == S
            cs(x) = cs(x) + 1;
            
        elseif grids(i, j, x) == I
            ci(x) = ci(x) + 1;
            
        elseif grids(i, j, x) == R
            cr(x) = cr(x) + 1;
            
        end
    end
end

M=grids(:,:,850);

% prepare video output
vid = VideoWriter('vid.avi');
vidObj.Quality = 1080;
vid.FrameRate = 30;
open(vid);


% iterate changing matrix
for i=850:1:850
    i
    % display matrix
    h = imagesc(M);
    axis square
    caxis([1 6])
    colormap(jet(6))
    colorbar


    colorbar('Ticks',[1,2,3,4,5,6],'TickLabels',{'Passive immune','Susceptible','Exposed','Infected','Recovered','Dead'})
    % capture frame
    writeVideo(vid,getframe);
    
    M=grids(:,:,i);
end

%close and save video output
%close(vid);


% plot(ax1, cs);
% hold on;
% plot(ax1, ci);
% hold on;
% plot(ax1, cr);
% title('Population count vs time in cellular automaton framework');
% legend('Susceptible', 'Infected', 'Recovered');
% xlabel('Time in days');
% ylabel('Number of individuals');