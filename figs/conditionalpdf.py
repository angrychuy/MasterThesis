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
mu = 1
mu2 = -1
x = np.linspace(-4,4,n)
y = (1.0/sigma*sqrt(2*np.pi))*np.exp((-0.5)*(mu - x/sigma)**(2.0))
y2 = (1.0/sigma*sqrt(2*np.pi))*np.exp((-0.5)*(mu2 - x/sigma)**(2.0))
subplot(111, frame_on = False)
plot(x,y,'k',x,y2,'k')
ylim((-1,3))

xticks([])
yticks([])

x = 4
y = 3

arrow(-x,0,2*x,0,edgecolor='black',facecolor='black', head_width=0.0)
arrow(0,-0.1,0,2*y,edgecolor='black',facecolor='black', head_width=0.0)

axvline(mu, ymin=0.25, ymax=0.87,linestyle='-',dashes=(5,10))
axvline(mu2, ymin=0.25, ymax=0.87,linestyle='-',dashes=(5,10))

text(-1.29,2.7,"$p(z|s2)$", size=25)
text(0.70,2.7,"$p(z|s1)$", size=25)
text(-1.1,-0.2,"$a_2$", size=25)
text(0.9,-0.2,"$a_1$", size=25)
text(-0.1,-0.3,"$\gamma_0$", size=25)
text(3.5,-0.2,"$z(T)$", size=20)
savefig('condpdf.png')
show()
