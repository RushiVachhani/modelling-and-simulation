clear all;
close all;
clc;

toss=10;
simulations=10;

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

final1=zeros(1,toss);

for i=1:1:simulations
    final1(1,i)=mean(table(i,:));
end

a1=figure();
histogram(final1,30)
title('Histogram for P_n(m) with ensemble size=10')
xlabel("Time(step)")
ylabel("Frequency")
%saveas(a1,'q4_1.png')


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

%----------------------------------------------------------------------------------------%
    
toss=100;
simulations=100;

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

final1=zeros(1,toss);

for i=1:1:simulations
    final1(1,i)=mean(table(i,:));
end

a1=figure();
histogram(final1,30)
title('Histogram for P_n(m) with ensemble size=100')
xlabel("Time(step)")
ylabel("Frequency")
%saveas(a1,'q4_2.png')


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
%----------------------------------------------------------------------------------------%

toss=100;
simulations=1000;

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

final1=zeros(1,toss);

for i=1:1:simulations
    final1(1,i)=mean(table(i,:));
end

a1=figure();
histogram(final1,30)
title('Histogram for P_n(m) with ensemble size=1000')
xlabel("Time(step)")
ylabel("Frequency")
%saveas(a1,'q4_3.png')


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
%----------------------------------------------------------------------------------------%
toss=100;
simulations=10000;

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

final1=zeros(1,toss);

for i=1:1:simulations
    final1(1,i)=mean(table(i,:));
end

a1=figure();
histogram(final1,30)
title('Histogram for P_n(m) with ensemble size=10000')
xlabel("Time(step)")
ylabel("Frequency")
%saveas(a1,'q4_4.png')


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
%----------------------------------------------------------------------------------------%

a1=figure();
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
%saveas(a1,'q4_5.png')

a1=figure();
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
%saveas(a1,'q4_6.png')

a1=figure();
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
%saveas(a1,'q4_7.png')