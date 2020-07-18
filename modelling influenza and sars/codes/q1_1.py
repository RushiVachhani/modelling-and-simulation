import sys
import matplotlib.pyplot as plt
import numpy as np

suscept=[]
infected=[]
recover=[]
time=[]
suscept.append(762-(0.10*762))
infected.append(1)
recover.append(0.10*762)
r=0.00218
a=0.5
dt=0.01
start=0
end=20
npoints=(end-start)/dt
count=0
x=0
npoints = int(npoints)
for i in range(0,npoints):
	if count==100:
		count=0
		x=suscept[i-1]-0.15*suscept[i-1]
		suscept[i]=x;
		infected.append(infected[i]+((r*suscept[i]*infected[i]-a*infected[i])*dt))
		recover[i]=recover[i-1]+x;
	else:
		suscept.append(suscept[i]-(r*suscept[i]*infected[i]*dt))
		infected.append(infected[i]+((r*suscept[i]*infected[i]-a*infected[i])*dt))
		recover.append(recover[i]+(a*infected[i]*dt))
for i in range(0,npoints+1):
	time.append(i*dt)

plt.plot(time,suscept,'.-k',label='suscepted')
plt.plot(time,infected,'.-b',label='infected')
plt.plot(time,recover,'--k',label='recovered')
plt.legend(loc='best')
plt.xlabel('Days')
plt.ylabel('No of people')
plt.grid()
plt.show()

