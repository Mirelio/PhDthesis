import numpy as np
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
import seaborn as sns
import pandas as pd

sns.set(style="white")
pp = PdfPages("normal_example.pdf")

# Generate a random correlated bivariate dataset
mean = [0, 0]
cov = [[1, 0], [0, 1]]
x1, x2 = np.random.multivariate_normal(mean, cov, 1000).T
x1 = pd.Series(x1, name="$X_1$")
x2 = pd.Series(x2, name="$X_2$")

# Show the joint distribution using kernel density estimation
g = (sns.jointplot(x1, x2, kind="kde", size=9, xlim=[-3,3], ylim=[-3,3], stat_func=None, space=0)).set_axis_labels("x", "y")
pp.savefig()
plt.close()
pp.close()
