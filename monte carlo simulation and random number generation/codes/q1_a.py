import numpy as np
import matplotlib.pyplot as plt
from random import random
from matplotlib.offsetbox import AnchoredText
n=int(input("The number of points to be generated"))
countout=0
inptx=[]
inpty=[]
outptx=[]
outpty=[]
for i in range(0,n):
	ptx =random()
	pty =random()
	ptx=ptx*2
	pty=pty*4
	#print(ptx," ",pty)
	sqptx=ptx*ptx;
	if sqptx >= pty:
		countout=countout + 1
		outptx.append(ptx)
		outpty.append(pty)
	else:
		inptx.append(ptx)
		inpty.append(pty)
ratio=countout/n
my_title="Number of points = "+str(n)
calc_value="Calculated Value Of integral by Monte Carlo Simulation: "+str(ratio*8)+"\n"
real_value="Actual value of integral: "+str(8/3)
fig, ax1 = plt.subplots()
plt.plot(outptx,outpty,'.b',label="Points inside the area")
plt.plot(inptx,inpty,'.r',label="Points outside the area")
plt.title(my_title)
at = AnchoredText(calc_value+real_value,prop=dict(size=10), frameon=True, loc='upper left')
at.patch.set_boxstyle("round,pad=0.,rounding_size=0.2")
ax1.add_artist(at)
plt.xlabel("X - label")
plt.ylabel("Y - label")
plt.legend(loc="best")
plt.show()

'''
t=1000
n=100

ptxs=[]
ptys=[]
optxs=[]
optys=[]

avd1=[]
for ind in range(0,t):
        arr=[]
        area=[]
        count=0
        for i in range(0,n):
                ptx=rand()
                ptx=ptx*2
                pty=rand()
                pty=pty*4
                ptxs.append(ptx)
                ptys.append(pty)
                if(ptx*ptx>pty):
                    optxs.append(ptx)
                    optys.append(pty)  
                    count=count+1
                    arr.append(1)
                area.append(count/i)
        area=area*8
        avd1.append(area(n))
for i in range(0,t):
        avd1(i)=(avd1(i)+avd1(i-1)*(i-1) )/(i)
for i in range(0,n-1):
        arr(i+1)=arr(i+1)+arr(i)
plt.plot(avd1,'lineWidth',1.5)
plt.show()

avd2=zeros(savedv2,1);
avd2=zeros(savedv2,1);
count=1;
for i=1:savedv2
    avd2(i)=avd1(count);
    if(mod(i,n)==0)
        count=count+1;
    end
end

figure;
set(gca,'fontsize',13)
hold on
plot(1:1:savedv2,avd2,'lineWidth',1.5);
ylim([0 3.5])
hold on
plot(1:1:savedv2,savedv1,'lineWidth',1.5);
ylim([0 3.5])
hold on
plot([1 savedv2],[8/3 8/3],'lineWidth',1.5)
legend('ensemble method','in the long run','actual area')
mytitle=strcat('Area calculated using two different methods n=',int2str(n),'  t=',int2str(t));

xlabel('runs');
ylabel('area');
title(mytitle);

'''
input()
