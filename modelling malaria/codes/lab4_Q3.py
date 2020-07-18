import sys
import matplotlib.pyplot as plt
import numpy as np

start=0
end=600
dt=1
npoints=(end-start)/dt
npoints=(int)(npoints)
sh=[]
ih=[]
rh=[]
sm=[]
im=[]
death=[]
sh.append(300.0)
ih.append(1.0)
rh.append(0.0)
death.append(0.0)
sm.append(300.0)
im.append(0.0)
rec_rate=0.3
imm_rate=0.01
mal_death=0.005
mosq_birth=0.01
mosq_death=0.005
biting_sh=0.3
biting_ih=0.3
r1=rec_rate
beta1=biting_sh
beta2=biting_ih
r2=mal_death
r3=imm_rate
b=mosq_birth
d=mosq_death
m=300.0
h=301.0
for i in range(1,npoints):
	a1=im[i-1]/m
	a2=ih[i-1]/h
	sh.append(sh[i-1]-(beta1*sh[i-1]*a1)+r1*ih[i-1])
	ih.append(ih[i-1]+(beta1*sh[i-1]*a1)-r1*ih[i-1]-r2*ih[i-1]-r3*ih[i-1])
	death.append(death[i-1]+r2*ih[i-1])
	rh.append(rh[i-1]+r3*ih[i-1])
	sm.append(sm[i-1]-(beta2*sm[i-1]*a2)+b*m-d*sm[i-1])
	im.append(im[i-1]+(beta2*sm[i-1]*a2)-d*im[i-1])
plt.xlim([0,700])
plt.plot(sh,'r',label='Human Susceptible')
plt.plot(ih,'b',label='Human Infected')
plt.plot(rh,'k',label='Human Recovered')
plt.plot(sm,'g',label='Mosquito Susceptible')
plt.plot(im,'y',label='Mosquito Infected')
plt.plot(death,'c',label='Human death')
plt.xlabel('No. of days')
plt.ylabel('No. of people/mosquito')
plt.legend(loc='best')
plt.grid(True)
plt.show()
