import warnings
warnings.filterwarnings("ignore")
import matplotlib
import matplotlib.pyplot as plt
from matplotlib import style as style
from matplotlib.backends.backend_pdf import PdfPages
import seaborn.apionly as sns
plt.style.use('ggplot')
plt.rc('text', usetex=True)
plt.rc('font', family='sans-serif')
plt.rcParams['font.size'] = 10
plt.rcParams['axes.labelsize'] = 10
#plt.rcParams['axes.labelweight'] = 'bold'
plt.rcParams['xtick.labelsize'] = 8
plt.rcParams['ytick.labelsize'] = 8
plt.rcParams['legend.fontsize'] = 10
plt.rcParams['figure.titlesize'] = 12


#xs = [2.430935009429497597e+02, 1.224984737256802561e+02]
#ys = [1.120051558243352616e+02, 2.149912374483512281e+02]


pp = PdfPages("phase_DP.pdf")
fig, ax = plt.subplots()
plt.ylim([0, 500])
plt.xlim([0, 500])
#fft_axes = fig.add_subplot(111)
#fft_axes.set_ylim([0,500])
#fft_axes.set_xlim([0,500])
plt.xticks([0,100,200,300,400,500],['0','100','200','300','400','500'])
plt.yticks([0,100,200,300,400,500],['0','100','200','300','400','500'])
ax = plt.scatter(x=xs, y=ys, color='black')
sns.despine()
pp.savefig()
plt.close()
pp.close()