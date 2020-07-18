clear all;
close all;
clc;

toss=20;
simulations=1;

r0=0.5;
p0=(((1-r0)/2)/2);
table=zeros(simulations,toss);

for i=1:1:simulations
    for j=2:1:toss
        r=rand();
        if r<r0
            table(i,j)=table(i,j-1);
        else
            p=(1-r)/2;
            if p<p0
                table(i,j)=table(i,j-1)-1;
            else
                table(i,j)=table(i,j-1)+1;
            end
        end
    end
end

a1=figure();
plot(table(1,:));
title('A sample random walk with above properties')
xlabel("Time(step)")
grid on
grid minor
ylabel("Value")