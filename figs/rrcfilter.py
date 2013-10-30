# -*- coding: utf-8 -*-

"""

Spyder Editor



Caracterizacion del filtro RRC. Traducido a python de matlab.

"""

from __future__ import division

from numpy import *

import matplotlib

matplotlib.use('macosx')

from pylab import *



fs= 10.0

t = arange(-fs, fs, 1/fs)



sincNum=sin(pi*t)

sincDen=pi*t

sincDenZero= argwhere(abs(sincDen) < 10**-10)

sincOp= sincNum/sincDen

sincOp[sincDenZero]=1



alpha = 0

cosNum = cos(alpha*pi*t)

cosDen = (1-(2*alpha*t)**2)

cosDenZero = argwhere(abs(cosDen) < 10**-10)

cosOp = cosNum/cosDen

cosOp[cosDenZero] = pi/4

gt_alpha0 = sincOp*cosOp

GF_alpha0 = fft(gt_alpha0, 1024)



alpha = 0.5

cosNum = cos(alpha*pi*t)

cosDen = (1-(2*alpha*t)**2)

cosDenZero = argwhere(abs(cosDen) < 10**-10)

cosOp = cosNum/cosDen

cosOp[cosDenZero] = pi/4

gt_alpha5 = sincOp*cosOp

GF_alpha5 = fft(gt_alpha5, 1024)



alpha = 1

cosNum = cos(alpha*pi*t)

cosDen = (1-(2*alpha*t)**2)

cosDenZero = argwhere(abs(cosDen) < 10**-10)

cosOp = cosNum/cosDen

cosOp[cosDenZero] = pi/4

gt_alpha1 = sincOp*cosOp

GF_alpha1 = fft(gt_alpha1, 1024)



figure()

plot(t, gt_alpha0, 'bs-', t, gt_alpha5, 'm^-.', t, gt_alpha1, 'co-')

legend(('alpha=0', 'alpha=0.5', 'alpha=1'))

grid(True)

xlabel('tiempo, t', size=20)

ylabel('amplitud, g(t)', size=20)

axis([-4,4,-0.4,1.2])

xticks(linspace(-3,3,7,endpoint=True), (r"$-3T$",r"$-2T$", r"$-T$", r"", r"$T$", r"$2T$", r"$3T$"), size=20)

#title('Time domain waveform of raised cosine pulse shaping filters')

#title('Forma de onda en el dominio del tiempo para filtros de coseno elevado')



savefig('rrctime.png')



figure()

fft_t = arange(-512,512)/1024*fs

plot(fft_t, abs(fftshift(GF_alpha0)), 'bs-', fft_t, abs(fftshift(GF_alpha5)), 'm^-', fft_t, abs(fftshift(GF_alpha1)), 'co-')

legend(('alpha=0', 'alpha=0.5', 'alpha=1'))

axis([-1, 1, 0, 14])

xticks(linspace(-1,1,5,endpoint=True), (r"$-\frac{1}{T}$", r"$-\frac{1}{2T}$", "", r"$\frac{1}{2T}$", r"$\frac{1}{T}$"), size=25)

grid(True)

xlabel('frecuencia, f', size=20)

ylabel('amplitud, |G(f)|', size=20)

#title('Frequency domain representation of raised cosine pulse shaping filters')

#title('Representacion en el dominio de la frecuencia de filtros coseno elevado')



savefig('rrcfreq.png')

show()