import matplotlib.pyplot as plt
import numpy as np
import math
import random

x1 = np.linspace(0, 0.25, 250, endpoint=True)
pi=3.14159
y=[]

for i in x1:
	y.append((2*pi)*math.sin(4*pi*i))

n = int(input("Enter number of numbers to be generated: "))
x_acc=[]
y_acc=[]
for i in range(0,n):
        xi=random.uniform(0,0.25)
        yi=random.uniform(0,10)
        if yi <=  (2*pi)*math.sin(4*pi*xi) :
                x_acc.append(xi)
                y_acc.append(yi)


bin_size=int(input("Please enter the bin size: "))				
plt.hist(x_acc,bins=bin_size,density=True)
plt.xlabel("data points")
plt.ylabel("frequency")
plt.show()
