import numpy as np
import matplotlib.pyplot as plt
from random import random
import math


n = int(input("Enter number of numbers to be generated: "))
x1=[]
lamda=float(input("Enter the value of lambda"))
for i in range(0,n):
    y1=random()
    x1.append((-1/lamda)*math.log(1-y1))


plt.hist(x1,density=True,bins=300)
plt.xlabel("data points")
plt.ylabel("frequency")
plt.show()

