import sys
import matplotlib.pyplot as plt
import numpy as np

suscept=[]
infected=[]
recover=[]
time=[]
suscept.append(762)
infected.append(1)
recover.append(0.1*(suscept[0]))
suscept[0]=suscept[0]-0.1*(suscept[0])
r=0.00218
a=0.5
dt=0.01
start=0
end=20
npoints=(end-start)/dt
for i in range(0,2000):
	suscept.append(suscept[i]-(r*suscept[i]*infected[i]*dt))
	infected.append(infected[i]+((r*suscept[i]*infected[i]-a*infected[i])*dt))
	recover.append(recover[i]+(a*infected[i]*dt))


suscept1=[]
infected1=[]
recover1=[]

suscept1.append(762)
infected1.append(1)
recover1.append(0)

for i in range(0,2000):
	suscept1.append(suscept1[i]-(r*suscept1[i]*infected1[i]*dt))
	infected1.append(infected1[i]+((r*suscept1[i]*infected1[i]-a*infected1[i])*dt))
	recover1.append(recover1[i]+(a*infected1[i]*dt))





for i in range(0,2001):
	time.append(i*0.01)

plt.plot(time,suscept,'-b',label='suscepted after vaccine')
plt.plot(time,infected,'-r',label='infected after vaccine')
plt.plot(time,recover,'-g',label='recovered after vaccine')

plt.plot(time,suscept1,'--b',label='suscepted before vaccine')
plt.plot(time,infected1,'--r',label='infected before vaccine')
plt.plot(time,recover1,'--g',label='recovered before vaccine')



plt.legend(loc='best')
plt.xlabel('Days')
plt.ylabel('No of people')
plt.grid()
plt.show()

