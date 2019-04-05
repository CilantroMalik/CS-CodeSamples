import numpy as np
import pandas as pd
import seaborn as sb
import matplotlib.pyplot as plt
import sklearn
import csv

from pandas import Series, DataFrame
from pylab import rcParams
from sklearn import preprocessing
from sklearn.linear_model import LogisticRegression
from sklearn.cross_validation import train_test_split
from sklearn import metrics 
from sklearn.metrics import classification_report

rcParams['figure.figsize'] = 10, 8
sb.set_style('whitegrid')

X = []
y = []

with open('./games.csv','r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    counter = 0
    for row in plots:
        counter += 1
        if counter >= 2:
            if str(row[5]) == "mate":
                average = (int(row[9]) + int(row[11])) / 2
                turns = int(row[4])
                openingPly = int(row[15])
                X.append([turns, openingPly])
                if str(row[6]) == "white":
                    y.append(1)
                else:
                    y.append(0)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = .3, random_state=25)

LogReg = LogisticRegression()
LogReg.fit(X_train, y_train)
y_pred = LogReg.predict(X_test)
from sklearn.metrics import confusion_matrix
confusion_matrix = confusion_matrix(y_test, y_pred)
print(confusion_matrix)
print(classification_report(y_test, y_pred))
