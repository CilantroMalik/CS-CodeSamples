import csv
import codecs
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sklearn
import locale
import scipy
import random
from scipy.stats import linregress
from scipy import stats

incomeSD = []
schoolDistrictDictionary = [[0, 0] for i in range(669)]

with codecs.open('./_OpioidDataGranularityIncrease/IncomeData-SD.csv', 'r', encoding='ascii', errors='ignore') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    counter = 0
    for row in plots:
        if counter >= 1:
            incomeSD.append(row)
        counter += 1
    print("read success")

rowCounter = 0
for row in incomeSD:
    schoolDistrictDictionary[rowCounter][0] = str(rowCounter)
    schoolDistrictDictionary[rowCounter][1] = row[0]
    rowCounter += 1


matches = [[28.9255, 300], [22.477603, 226], [13.791782, 323], [6.004965, 36], [15.905136, 356], [4.235234, 307], [22.078499, 226], [16.956392, 97], [42.426357, 290], [52.747511, 175], [7.269668, 409], [44.188848, 175], [10.930623, 16], [17.69903, 295], [7.803009, 5], [14.873694, 250], [3.813423, 310], [131.082753, 305], [12.571424, 100], [9.953386, 56], [38.16038, 162], [3.422068, 92], [4.071344, 180], [14.86523, 149], [34.051949, 103], [4.701722, 229], [17.114701, 101], [66.687241, 338], [50.205076, 382], [15.653341, 175], [22.302936, 340], [19.85951, 136], [6.18401, 69], [29.343708, 295], [13.768096, 192], [3.689433, 310], [23.189353, 340], [28.649317, 362], [2.041558, 212], [2.229002, 369], [105.165313, 382], [0.907931, 40], [1.67681, 263], [58.280577, 392], [9.300885, 208], [4.173527, 123], [5.586977, 385], [12.691356, 19], [6.656217, 49], [9.274769, 179], [5.590212, 102], [6.180643, 69], [11.572807, 250], [5.086013, 48], [55.171225, 151], [15.552436, 17], [14.582677, 102], [40.838331, 390], [1.843508, 229], [11.370639, 180], [0, 0]]
districts = []

for pair in matches:
    sd = pair[1]
    dictEntry = schoolDistrictDictionary[sd]
    sdName = dictEntry[1]
    districts.append(sdName)

gradrates = []
gradrateAllStudents = []

with codecs.open('./GradRateData-County.csv', 'r', encoding='ascii', errors='ignore') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    counter = 0
    for row in plots:
        gradrates.append(row)
    print("read success")


index = 0
adder = 0
for row in gradrates:
    if index % 3 == 0:
        adder += int(row[12][:-1])
    elif index % 3 == 1:
        adder += int(row[12][:-1])
    elif index % 3 == 2:
        adder += int(row[12][:-1])
        gradrateAllStudents.append(round(adder/3, 6))
        adder = 0
    index += 1

print(gradrateAllStudents)

deaths = []

with codecs.open('./DeathData-County.csv', 'r', encoding='ascii', errors='ignore') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    counter = 0
    for row in plots:
        if counter >= 1:
            deaths.append(int(row[3]))
        counter += 1
    print("read success")

print(deaths)
print(len(deaths))

def best_fit(X, Y):

    xbar = sum(X)/len(X)
    ybar = sum(Y)/len(Y)
    n = len(X) # or len(Y)

    numer = sum([xi*yi for xi,yi in zip(X, Y)]) - n * xbar * ybar
    denum = sum([xi**2 for xi in X]) - n * xbar**2

    b = numer / denum
    a = ybar - b * xbar

    print('best fit line:\ny = {:.2f} + {:.2f}x'.format(a, b))

    return a, b

a, b = best_fit(deaths, gradrateAllStudents)
print(linregress(deaths, gradrateAllStudents))


plt.scatter(deaths, gradrateAllStudents, label='Counties')
plt.xlabel("Opioid Deaths")
plt.ylabel("Graduation Percentage")
yfit = [a + b * xi for xi in deaths]
plt.plot(deaths, yfit, color='red', label="Line of Best Fit")
plt.title("Effect of Opioid Deaths on Graduation Rates of Schools")
plt.legend()
plt.show()

print(linregress(deaths, gradrateAllStudents))

print(stats.pearsonr(deaths, gradrateAllStudents))
