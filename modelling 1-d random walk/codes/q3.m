clear all;
close all;
clc;

toss=100;
simulations=10;

table=zeros(simulations,toss);

for i=1:1:simulations
    for j=2:1:toss
        temp=rand();
        r=normrnd(3,5);
        if(temp<=0.5)
            table(i,j)=table(i,j-1)-r;
        else
            table(i,j)=table(i,j-1)+r;
        end
    end
end

final1=zeros(1,toss);

for i=1:1:simulations
    final1(1,i)=mean(table(i,:));
end

% a1=figure()
% plot(final1)
% grid on
% grid minor
% title('Random Walk')
a1=figure()
histogram(final1,30)
title('Histogram for P_n(m) with ensemble size=10')
xlabel("Time(step)")
ylabel("Frequency")
saveas(a1,'q3_1.png')

xmxsq1=zeros(1,toss);

for i=1:1:toss
    xmxsq1(1,i)=(mean(table(:,i).^2))-((mean(table(:,i)))^2);
end

xsq1=zeros(1,toss);

for i=1:1:toss
    xsq1(1,i)=(mean(table(:,i).^2));
end

x1=zeros(1,toss);

for i=1:1:toss
    x1(1,i)=(mean(table(:,i)));
end

%-------------------------------------------------------------------------------------------%
toss=100;
simulations=100;

table=zeros(simulations,toss);

for i=1:1:simulations
    for j=2:1:toss
        temp=rand();
        r=normrnd(3,5);
        if(temp<=0.5)
            table(i,j)=table(i,j-1)-r;
        else
            table(i,j)=table(i,j-1)+r;
        end
    end
end

final1=zeros(1,toss);

for i=1:1:simulations
    final1(1,i)=mean(table(i,:));
end

%a1=figure()
%plot(final1)
%grid on
%grid minor
%title('Random Walk')
a1=figure()
histogram(final1,30)
title('Histogram for P_n(m) with ensemble size=100')
xlabel("Time(step)")
ylabel("Frequency")
saveas(a1,'q3_2.png')

xmxsq2=zeros(1,toss);

for i=1:1:toss
    xmxsq2(1,i)=(mean(table(:,i).^2))-((mean(table(:,i)))^2);
end

xsq2=zeros(1,toss);

for i=1:1:toss
    xsq2(1,i)=(mean(table(:,i).^2));
end

x2=zeros(1,toss);

for i=1:1:toss
    x2(1,i)=(mean(table(:,i)));
end
%------------------------------------------------------------------------------------------%
toss=100;
simulations=1000;

table=zeros(simulations,toss);

for i=1:1:simulations
    for j=2:1:toss
        temp=rand();
        r=normrnd(3,5);
        if(temp<=0.5)
            table(i,j)=table(i,j-1)-r;
        else
            table(i,j)=table(i,j-1)+r;
        end
    end
end

final1=zeros(1,toss);

for i=1:1:simulations
    final1(1,i)=mean(table(i,:));
end

%a1=figure()
%plot(final1)
%grid on
%grid minor
%title('Random Walk')
a1=figure()
histogram(final1,30)
title('Histogram for P_n(m) with ensemble size=1000')
xlabel("Time(step)")
ylabel("Frequency")
saveas(a1,'q3_3.png')

xmxsq3=zeros(1,toss);

for i=1:1:toss
    xmxsq3(1,i)=(mean(table(:,i).^2))-((mean(table(:,i)))^2);
end

xsq3=zeros(1,toss);

for i=1:1:toss
    xsq3(1,i)=(mean(table(:,i).^2));
end

x3=zeros(1,toss);

for i=1:1:toss
    x3(1,i)=(mean(table(:,i)));
end
%------------------------------------------------------------------------------------%

toss=100;
simulations=10000;

table=zeros(simulations,toss);

for i=1:1:simulations
    for j=2:1:toss
        temp=rand();
        r=normrnd(3,5);
        if(temp<=0.5)
            table(i,j)=table(i,j-1)-r;
        else
            table(i,j)=table(i,j-1)+r;
        end
    end
end

final1=zeros(1,toss);

for i=1:1:simulations
    final1(1,i)=mean(table(i,:));
end

%a1=figure()
%plot(final1)
%grid on
%grid minor
%title('Random Walk')
a1=figure()
histogram(final1,30)
title('Histogram for P_n(m) with ensemble size=10000')
xlabel("Time(step)")
ylabel("Frequency")
saveas(a1,'q3_4.png')

xmxsq4=zeros(1,toss);

for i=1:1:toss
    xmxsq4(1,i)=(mean(table(:,i).^2))-((mean(table(:,i)))^2);
end

xsq4=zeros(1,toss);

for i=1:1:toss
    xsq4(1,i)=(mean(table(:,i).^2));
end

x4=zeros(1,toss);

for i=1:1:toss
    x4(1,i)=(mean(table(:,i)));
end
%-----------------------------------------------------------------------------------%


a1=figure()
plot(xmxsq1,'r')
hold on
plot(xmxsq2,'b')
hold on
plot(xmxsq3,'g')
hold on
plot(xmxsq4,'m')
grid on 
grid minor
title('<x^2> - <x>^2 vs t for different ensemble size')
legend('ensemble size = 10','ensemble size = 100','ensemble size = 1000','ensemble size = 10000')
xlabel("Time(step)")
ylabel("<x^2> - <x>^2")
saveas(a1,'q3_5.png')

a1=figure()
plot(xsq1,'r')
hold on
plot(xsq2,'b')
hold on
plot(xsq3,'g')
hold on
plot(xsq4,'m')
grid on 
grid minor
title('<x^2> vs t for different ensemble size')
legend('ensemble size = 10','ensemble size = 100','ensemble size = 1000','ensemble size = 10000')
xlabel("Time(step)")
ylabel("<x^2>")
saveas(a1,'q3_6.png')

a1=figure()
plot(x1,'r')
hold on
plot(x2,'b')
hold on
plot(x3,'g')
hold on
plot(x4,'m')
grid on 
grid minor
title('<x> vs t for different ensemble size')
legend('ensemble size = 10','ensemble size = 100','ensemble size = 1000','ensemble size = 10000')
xlabel("Time(step)")
ylabel("<x>")
saveas(a1,'q3_7.png')
 
       