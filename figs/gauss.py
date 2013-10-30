# -*- coding: utf-8 -*-
"""
Spyder Editor

This temporary script file is located here:
C:\Users\Haysoos\.spyder\.temp.py
"""
import matplotlib
matplotlib.use('macosx')
from pylab import *
import numpy as np

n = 100
sigma = 1
mu = 0
x = np.linspace(-4,4,n)
y = (1.0/sigma*sqrt(2*np.pi))*np.exp((-0.5)*(mu - x/sigma)**(2.0))
subplot(111, frame_on = False)
plot(x,y,'k')
ylim((-0.2,3))

yticks([])

x = 4
y = 3

arrow(-x,0,2*x,0,edgecolor='black',facecolor='black', head_width=0.0)
arrow(0,-0.1,0,2*y,edgecolor='black',facecolor='black', head_width=0.0)

axvline(mu+1, ymin=0.03, ymax=0.52,linestyle='-',dashes=(5,10))
axvline(mu+2, ymin=0.03, ymax=0.17,linestyle='-',dashes=(5,10))

annotate("$\sigma$",xy=(0.0,0.8), xytext=(1,0.76), 
         arrowprops=dict(arrowstyle='<->'), size=20)
annotate("$2 \sigma$",xy=(0.0,0.1), xytext=(2,0.04), 
         arrowprops=dict(arrowstyle='<->'), size=20)

text(0.5,2.5,r"$p(n)=\frac{1}{\sigma\sqrt{2\pi}}\exp\left[-\frac{1}{2}\left(\frac{n}{\sigma}\right)^2\right]$", size=20)
savefig('gauss.png')
show()
