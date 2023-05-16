import matplotlib.pyplot as plt
from matplotlib.ticker import StrMethodFormatter
import numpy as np
from scipy.stats import linregress

#dimensions = np.array([1000,2000,4000,8000,16000])
#times = np.array([0.00048400, 0.00274500, 0.00881000, 0.05405901, 0.21291602])

Nbasis = np.array([2,3,4,5,6,7,8,9,10])
E0 = np.array([9.718794, 9.717433, 9.717111, 9.717105, 9.717095, 9.717094, 9.717093, 9.717093, 9.717093])


#energies for V = mx E0 [5.432611, 5.432611, 5.432608, 5.432608, 5.432608, 5.432608, 5.432608, 5.432608, 5.432608]


# times for prgm_04_01: [0.0343,0.2168,1.7057,13.6725,110.5790]
# times for prgm_04_02: (all times increased x10): [0.00001200,0.00002800,0.00004100,0.00008000,0.00020200]
# times for prgm_04_03: [0.00048400, 0.00274500, 0.00881000, 0.05405901, 0.21291602]

#x = np.log(dimensions)
#y = np.log(times)
#slope, intercept = np.polyfit(x,y,1)
#equation = "y = {:.4f}x {:.4f}".format(slope,intercept)

plt.plot(Nbasis,E0,"ob")
plt.title("prgm_05_01 (V(x) = 10x)")
plt.xlabel("Nbasis")
plt.ylabel("E0")
#plt.ylim(5.432607,5.432612)
#plt.gca().yaxis.set_major_formatter(StrMethodFormatter('{x:,.6f}')) # 2 decimal places
#plt.text(7,-2,equation)
#plt.text(7,-1,"O(N$^2$)")
plt.show()
