import numpy as np
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
import seaborn as sns

d2_e = [0.1, 0.05, 0.01, 0.005, 0.001, 0.0005, 0.0001, 0.00005, 0.00001, 0.000005]
d2_acc = [0.7692, 0.7692, 0.7692, 0.7143, 0.7143, 0.4167, 0.303, 0.3226, 0.1163, 0.0437]

d1_e = [0.1, 0.05, 0.01]
d1_acc = [0.625, 0.625, 0.02]

pp = PdfPages("accept_rate_2d_1d.pdf")
f, ax = plt.subplots(figsize=(7, 7))
sns.set(style="white", palette="muted", color_codes=True)
plt.plot(d2_e, d2_acc, 'ro', color='g', label='2D')
plt.plot(d1_e, d1_acc, 'bs', color='b', label='1D')

ax.set(xscale="log")
#plt.ylim([0, 0.5])
#plt.xlim([0.0008, 11])
plt.xlabel('Final epsilon')
plt.ylabel('Acceptance rate')
plt.legend(loc='upper left')
pp.savefig()
plt.close()
pp.close()
