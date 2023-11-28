import csv
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

with open('resultados.csv', 'r') as csvfile:
    reader = csv.reader(csvfile)
    data = list(reader)

times = np.array([float(row[1]) for row in data[1:]])

mu, std = norm.fit(times)

plt.hist(times, bins=25, density=False, alpha=0.6, color=f'C{0}', label=f'Versão base')

xmin, xmax = plt.xlim()
x = np.linspace(xmin, xmax, 10000)
p = norm.pdf(x, mu, std)
plt.plot(x, p, f'C{0}', linewidth=2)

avg = np.mean(times)
median = np.median(times)
stdev = np.std(times)

plt.title(f'Tempos de execução\nMédia: {avg:.2f}, Mediana: {median:.2f}, StdDev: {stdev:.2f}')
plt.xlabel('Tempos de execução (nanosegundos)')
plt.ylabel('Frequência')
plt.legend()
plt.show()