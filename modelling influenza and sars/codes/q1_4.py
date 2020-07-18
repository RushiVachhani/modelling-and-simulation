import sys
import matplotlib.pyplot as plt
import numpy as np

suscept=[]
infected=[]
vaccine=[]
sum1=[]
for i in range(0,101):
	vaccine.append(i)
r=0.00218
a=0.5
dt=0.01
start=0
end=20
npoints=(end-start)/dt
for i in range(0,101):
	suscept=[]
	infected=[]
	x=762-((0.01*i)*762)
	suscept.append(x)
	infected.append(1)
	for i in range(0,2000):
		suscept.append(suscept[i]-(r*suscept[i]*infected[i]*dt))
		infected.append(infected[i]+((r*suscept[i]*infected[i]-a*infected[i])*dt))
	sum1.append(max(infected))


plt.plot(vaccine,sum1)
plt.xlabel('percentage of vaccine')
plt.ylabel('No of infected')
plt.grid()
plt.show()

