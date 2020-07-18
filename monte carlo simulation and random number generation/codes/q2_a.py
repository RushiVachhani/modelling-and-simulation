import numpy as np
import matplotlib.pyplot as plt
from matplotlib import colors
from random import random
import math


n = int(input("Enter number of numbers to be generated: "))
x1=[]
x2=[]
for i in range(0,n):
    y1=random()
    y2=random()
    x1.append(math.sqrt(-2*math.log(y1))*math.cos(2*3.14159*y2))
    x2.append(math.sqrt(-2*math.log(y1))*math.sin(2*3.14159*y2))


plt.hist(x1,density=True,bins=30)
plt.xlabel("data points")
plt.ylabel("frequency")
plt.show()

