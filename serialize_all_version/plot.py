import csv
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm
import os


def plot_histogram(file_path, label):
    with open(file_path, 'r') as csvfile:
        reader = csv.reader(csvfile)
        data = list(reader)

    times = np.array([float(row[0]) for row in data])

    mu, std = norm.fit(times)

    plt.hist(times, bins=25, density=True, alpha=0.6, label=label)
    
    xmin, xmax = plt.xlim()
    x = np.linspace(xmin, xmax, 10000)
    p = norm.pdf(x, mu, std)
    plt.plot(x, p, linewidth=2)

    avg = np.mean(times)
    median = np.median(times)
    stdev = np.std(times)

    plt.title(f'Tempos de execução - Versão serializada\nMédia: {avg:.2f}, Mediana: {median:.2f}, StdDev: {stdev:.2f}')
    plt.xlabel('Tempos de execução (nanosegundos)')
    plt.ylabel('Frequência')

csv_directory = "."

for filename in os.listdir(csv_directory):
    if filename.endswith(".csv"):
        file_path = os.path.join(csv_directory, filename)
        label = f'{filename.split("_")[0]} elementos'
        plot_histogram(file_path, label)
        plt.legend()
        plt.show()


