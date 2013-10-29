# -*- coding: utf-8 -*-
"""
Created on Wed May 12 02:03:12 2010

@author: Jesus Espinoza

Description: Plots a figure illustrating a continuous and discrete signal.
"""

import matplotlib
matplotlib.use('macosx')
from numpy import arange, pi
from scipy import sin
from pylab import plot, xlabel, ylabel, stem, annotate, grid, show, savefig

fs = 200.0 #Hz
ts = 1.0 / fs

fs2 = 10.0
ts2 = 1.0 / fs2

t = arange(0, 1, ts);
t2 = arange(0, 1, ts2);
x = sin(2 * pi * t);
x2 = sin(2 * pi * t2);
plot(t, x)
stem(t2, x2)
xlabel('Tiempo')
ylabel('Amplitud')

annotate(u'Señal continua', xy = (0.36, 0.75), xytext = (0.5, 0.8),
arrowprops = dict(facecolor = 'black', shrink = 0.05))

annotate(u'Señal discreta', xy = (0.6, -0.26), xytext = (0.34, -0.49),
arrowprops = dict(facecolor = 'black', shrink = 0.05))

grid(True)
savefig('sine.png')
show()
