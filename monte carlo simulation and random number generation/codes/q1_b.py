import numpy as np
import matplotlib.pyplot as plt
from random import random
from matplotlib.offsetbox import AnchoredText
n=int(input("The number of points to be generated"))
countin=0
inptx=[]
inpty=[]
outptx=[]
outpty=[]
for i in range(0,n):
	ptx =random()
	pty =random()
	#print(ptx," ",pty)
	sqptx=ptx*ptx;
	sqpty=pty*pty;
	if sqptx+sqpty <= 1:
		countin=countin + 1
		outptx.append(ptx)
		outpty.append(pty)
	else:
		inptx.append(ptx)
		inpty.append(pty)
ratio=countin/n
my_title="Number of points = "+str(n)
calc_value="Calculated value of pi: "+str(ratio*4)+"\n"
real_value="Actual value of pi: 3.14159"
fig, ax1 = plt.subplots()
plt.plot(outptx,outpty,'.b',label="Points inside the area")
plt.plot(inptx,inpty,'.r',label="Points inside the area")
plt.title(my_title)
at = AnchoredText(calc_value+real_value,prop=dict(size=10), frameon=True, loc='upper left')
at.patch.set_boxstyle("round,pad=0.,rounding_size=0.2")
ax1.add_artist(at)
plt.xlabel("X - label")
plt.ylabel("Y - label")
plt.legend(loc="best")
plt.show()	
input()
