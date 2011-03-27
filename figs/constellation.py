# -*- coding:utf-8 -*-
"""
Created on May 25, 2010

@author: Jesus Espinoza Hernandez

Description: Draws the QPSK and BPSK constellation
"""
import matplotlib
matplotlib.use('macosx')
import numpy as np
from pylab import *

def PolarToCartesian(theta, radius):
    x = []
    y = []
    i = 0
    for angle in theta:
        x.append(radius[i] * cos((angle)))
        y.append(radius[i] * sin((angle)))
        i = i + 1
    return x, y

def DrawCircle(center, radius, points):
    theta = linspace(0, 2 * np.pi, points)
    rho = np.ones(points) * r
    x, y = PolarToCartesian(theta, rho)
    x = x + center[0]
    y = y + center[1]
    return x, y

#===============================================================================
# Draw the unit circle
#===============================================================================
center = np.array([0, 0])
r = 1
fig = figure()
ax = fig.add_subplot(111, frame_on = False)
ax.set_xticks([])
ax.set_yticks([])
x, y = DrawCircle(center, r, 200)
plot(x, y, 'b', zorder = 1)
hold(True)

#===============================================================================
# Draw the constellation circles
#===============================================================================
center = np.array([-0.7, 0.7])
r = 0.1
x, y = DrawCircle(center, r, 200)
fill(x, y, 'g', zorder = 2)

center = np.array([0.7, 0.7])
x, y = DrawCircle(center, r, 200)
fill(x, y, 'g', zorder = 2)

center = np.array([-0.7, -0.7])
x, y = DrawCircle(center, r, 200)
fill(x, y, 'g', zorder = 2)

center = np.array([0.7, -0.7])
x, y = DrawCircle(center, r, 200)
fill(x, y, 'g', zorder = 2)

#===============================================================================
# Draw the axes arrows
#===============================================================================
x = 1.5
y = 1.5

arrow(-x, 0, 2 * x, 0, edgecolor = 'black', facecolor = 'black', head_width = 0.1)
arrow(0, -y, 0, 2 * y, edgecolor = 'black', facecolor = 'black', head_width = 0.1)
ax.text(1.5, -0.2, "$I$", size = 15)
ax.text(0.1, 1.5, "$Q$", size = 15)
ax.text(0.8, 0.8, "11", size = 15)
ax.text(-0.95, 0.8, "01", size = 15)
ax.text(-1.0, -0.8, "00", size = 15)
ax.text(0.85, -0.8, "10", size = 15)

axis([-1.7, 1.7, -1.7, 1.7])
ax.set_aspect(1. / ax.get_data_ratio())

savefig('qpsk.png')

#===============================================================================
# Draw the BPSK constellation for comparison
# Same stuff as above
#===============================================================================
fig2 = figure()
ax2 = fig2.add_subplot(111, frame_on = False)
ax2.set_xticks([])
ax2.set_yticks([])

r = 0.1
center = np.array([-1, 0])
x, y = DrawCircle(center, r, 200)
fill(x, y, 'g', zorder = 2)
hold(True)

center = np.array([1, 0])
x, y = DrawCircle(center, r, 200)
fill(x, y, 'g', zorder = 2)

x = 1.5
y = 1.5

arrow(-x, 0, 2 * x, 0, edgecolor = 'black', facecolor = 'black', head_width = 0.1)
arrow(0, -y, 0, 2 * y, edgecolor = 'black', facecolor = 'black', head_width = 0.1)
ax2.text(1.5, -0.2, "$I$", size = 15)
ax2.text(0.1, 1.5, "$Q$", size = 15)
ax2.text(-1 - 0.02, 0.2, "0", size = 15)
ax2.text(1 - 0.02, 0.2, "1", size = 15)

axis([-1.7, 1.7, -1.7, 1.7])
ax2.set_aspect(1. / ax.get_data_ratio())

savefig('bpsk.png')
show()
