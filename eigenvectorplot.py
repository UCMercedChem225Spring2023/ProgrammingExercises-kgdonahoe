import matplotlib.pyplot as plt
from matplotlib.ticker import StrMethodFormatter
import numpy as np
from scipy.stats import linregress

L = 1
x = np.linspace(0,L,num=1000, endpoint=True)


# V = mx, m = 1
ac1 = 0.999926
ac2 = 0.012165
ac3 = 0.000061
ac4 = 0.000195

# V = 10x
bc1 = 0.992776
bc2 = 0.119818
bc3 = 0.005978
bc4 = 0.002093
bc5 = 0.000225
bc6 = 0.000238
bc7 = 0.000033
bc8 = 0.000054


# V = mx, m = 10
cc1 = -0.746506
cc2 = -0.613818
cc3 = -0.245723
cc4 = -0.071525
cc5 = -0.020213
cc6 = -0.006650
cc7 = -0.002589
cc8 = -0.001190
cc9 = -0.000600
cc10 = -0.000338
cc11 = -0.000198
cc12 = -0.000126
cc13 = -0.000079


y1 = np.sin(np.pi*x/L)
y2 = np.sin(2*np.pi*x/L)
y3 = np.sin(3*np.pi*x/L)
y4 = np.sin(4*np.pi*x/L)
y5 = np.sin(5*np.pi*x/L)
y6 = np.sin(6*np.pi*x/L)
y7 = np.sin(7*np.pi*x/L)
y8 = np.sin(8*np.pi*x/L)
y9 = np.sin(9*np.pi*x/L)
y10 = np.sin(10*np.pi*x/L)
y11 = np.sin(11*np.pi*x/L)
y12 = np.sin(12*np.pi*x/L)
y13 = np.sin(13*np.pi*x/L)


#x = np.zeros_like(x1)
#y = np.zeros_like(y1)


ay = ac1*y1 + ac2*y2 + ac3*y3 + ac4*y4

by = bc1*y1 + bc2*y2 + bc3*y3 + bc4*y4 + bc5*y5 + bc6*y6 + bc7*y7 + bc8*y8

cy = cc1*y1 + cc2*y2 + cc3*y3 + cc4*y4 + cc5*y5 + cc6*y6 + cc7*y7 + cc8*y8 + cc9*y9 + cc10*y10 + cc10*y10 + cc11*y11 + cc12*y12 + cc13*y13



plt.plot(x,ay,label="V = mx, m = 1")
plt.plot(x,by,label="V = 10x, m = 1")
plt.plot(x,cy,label="V = mx, m = 10")
plt.legend()
plt.show()



# V = mx, m = 1
#c1 = 0.999926
#c2 = 0.012165
#c3 = 0.000061
#c4 = 0.000195

# V = 10x
#c1 = 0.992776
#c2 = 0.119818
#c3 = 0.005978
#c4 = 0.002093
#c5 = 0.000225
#c6 = 0.000238
#c7 = 0.000033
#c8 = 0.000054

#V = mx, m = 10
