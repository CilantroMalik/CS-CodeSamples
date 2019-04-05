import csv
import codecs
import numpy as np
import pandas as pd
import seaborn as sb
import matplotlib.pyplot as plt
import sklearn
import locale
import scipy
import random

from pandas import Series, DataFrame
from pylab import rcParams
from sklearn import preprocessing
from sklearn.linear_model import LogisticRegression
from sklearn.linear_model import LinearRegression as lr
from sklearn.cross_validation import train_test_split
from sklearn import metrics 
from sklearn.metrics import classification_report
from scipy.stats import pearsonr

locale.setlocale(locale.LC_ALL, "en_US.UTF-8")

data = pd.read_csv("./ADEfor2016-10.6.18.csv")

#data.info()

age = []
ageOpioids = []
old = []
oldOpioids = []
countRace = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
countRaceOld = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
countGovernorRegion = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
countGovernorRegionOld = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

deathPopulation = []
highestDeaths = []
nySubtable = []
wvSubtable = []

census = []

gradrate = []

tests = []

# 0 = Asian-Pacific Islander Hispanic, 1 = Asian-Pacific Islander non-Hispanic
# 2 = Black Hispanic, 3 = Black non-Hispanic, 4 = Native American Hispanic
# 5 = Native American non-Hispanic, 6 = Other including 2 or more races Hispanic
# 7 = Other including 2 or more races non-Hispanic, 8 = White Hispanic, 9 = White non-Hispanic

with codecs.open('./ADEfor2016-10.6.18.csv', 'r', encoding='ascii', errors='ignore') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    counter = 0
    for row in plots:
        if row[3] == "17 and Under":
            age.append(row)
        else:
            old.append(row)

with codecs.open('./Census/Census2015-county.csv', 'r', encoding='ascii', errors='ignore') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    counter = 0
    for row in plots:
        census.append(row)

with codecs.open('/Volumes/Samsung USB/Science Research/gradrate_2016/GRAD_RATE_AND_OUTCOMES_2016.csv', 'r', encoding='ascii', errors='ignore') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    counter = 0
    for row in plots:
        gradrate.append(row)

with codecs.open('/Volumes/Samsung USB/Science Research/3-8-2015-16/3-8_ELA_AND_MATH_RESEARCHER_FILE_2016.csv', 'r', encoding='ascii', errors='ignore') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    counter = 0
    for row in plots:
        tests.append(row)

with codecs.open('./NCHS_-_Drug_Poisoning_Mortality_by_County__United_States.csv', 'r', encoding='ascii', errors='ignore') as csvfile:
    print("read successful")
    plots = csv.reader(csvfile, delimiter=',')
    counter = 0
    for row in plots:
        if counter >= 1:
            if row[1] == "2015":
                population = locale.atoi(row[5])
                if row[6] == "2-3.9":
                    desired = (population/100000) * 3
                elif row[6] == "4-5.9":
                    desired = (population/100000) * 5
                elif row[6] == "6-7.9":
                    desired = (population/100000) * 7
                elif row[6] == "8-9.9":
                    desired = (population/100000) * 9
                elif row[6] == "10-11.9":
                    desired = (population/100000) * 11
                elif row[6] == "12-13.9":
                    desired = (population/100000) * 13
                elif row[6] == "14-15.9":
                    desired = (population/100000) * 15
                elif row[6] == "16-17.9":
                    desired = (population/100000) * 17
                elif row[6] == "18-19.9":
                    desired = (population/100000) * 19
                elif row[6] == "20-21.9":
                    desired = (population/100000) * 21
                elif row[6] == "22-23.9":
                    desired = (population/100000) * 23
                elif row[6] == "24-25.9":
                    desired = (population/100000) * 25
                elif row[6] == "26-27.9":
                    desired = (population/100000) * 27
                elif row[6] == "28-29.9":
                    desired = (population/100000) * 29
                elif row[6] == "30+":
                    desired = (population/100000) * 31.5
                elif row[6] == "<2":
                    desired = (population/100000) * 1
                desiredInt = round(desired, 2)
                desiredStr = str(desiredInt)
                deathRatePer100K = row[6]
                county = row[4]
                year = row[1]
                toAppend = [year, county, deathRatePer100K, desiredStr, population]
                deathPopulation.append(toAppend)
                #if counter >= 32000:
                    #print(toAppend)
        counter += 1
            
for row in age:
    if row[1] == "Heroin" or row[1] == "Cocaine incl Crack" or row[1] == "Other Opioids":
        if row[2] == "Crisis":
            ageOpioids.append(row)

for row in old:
    if row[1] == "Heroin" or row[1] == "Cocaine incl Crack" or row[1] == "Other Opioids":
        if row[2] == "Crisis":
            oldOpioids.append(row)



opioid = pd.DataFrame(ageOpioids)

oldOpioid = pd.DataFrame(oldOpioids)

censusDF = pd.DataFrame(census)
#censusDF.info()

gradrateDF = pd.DataFrame(gradrate)
#gradrateDF.info()

testDF = pd.DataFrame(tests)
#testDF.info()

# ID (unused), state, county, population, men, women,
# hispanic, white, black, native american, asian, pacific,
# citizens, income, income Error (UNUSED), income per capita, income per capita Error (UNUSED),
# poverty, child poverty, professional jobs, service jobs, office jobs, construction jobs, production jobs,
# people drive, people carpool, people transit, people walk, people other transport,
# people work at home, commute, employed, private work, public work, self-employed, family work, unemployed


for row in ageOpioids:
    if row[0] == "Asian-Pacific Islander Hispanic":
        countRace[0] += 1
    elif row[0] == "Asian-Pacific Islander non-Hispanic":
        countRace[1] += 1
    elif row[0] == "Black Hispanic":
        countRace[2] += 1
    elif row[0] == "Black non-Hispanic":
        countRace[3] += 1
    elif row[0] == "Native American Hispanic":
        countRace[4] += 1
    elif row[0] == "Native American non-Hispanic":
        countRace[5] += 1
    elif row[0] == "Other including 2 or more races Hispanic":
        countRace[6] += 1
    elif row[0] == "Other including 2 or more races non-Hispanic":
        countRace[7] += 1
    elif row[0] == "White Hispanic":
        countRace[8] += 1
    elif row[0] == "White non-Hispanic":
        countRace[9] += 1

for row in oldOpioids:
    if row[0] == "Asian-Pacific Islander Hispanic":
        countRaceOld[0] += 1
    elif row[0] == "Asian-Pacific Islander non-Hispanic":
        countRaceOld[1] += 1
    elif row[0] == "Black Hispanic":
        countRaceOld[2] += 1
    elif row[0] == "Black non-Hispanic":
        countRaceOld[3] += 1
    elif row[0] == "Native American Hispanic":
        countRaceOld[4] += 1
    elif row[0] == "Native American non-Hispanic":
        countRaceOld[5] += 1
    elif row[0] == "Other including 2 or more races Hispanic":
        countRaceOld[6] += 1
    elif row[0] == "Other including 2 or more races non-Hispanic":
        countRaceOld[7] += 1
    elif row[0] == "White Hispanic":
        countRaceOld[8] += 1
    elif row[0] == "White non-Hispanic":
        countRaceOld[9] += 1

for row in ageOpioids:
    if row[4] == " Western NY ":
        countGovernorRegion[0] += 1
    elif row[4] == " Finger Lakes ":
        countGovernorRegion[1] += 1
    elif row[4] == " Southern Tier ":
        countGovernorRegion[2] += 1
    elif row[4] == " Central NY ":
        countGovernorRegion[3] += 1
    elif row[4] == " North Country ":
        countGovernorRegion[4] += 1
    elif row[4] == " Mohawk Valley ":
        countGovernorRegion[5] += 1
    elif row[4] == " Capital Region ":
        countGovernorRegion[6] += 1
    elif row[4] == " Mid-Hudson ":
        countGovernorRegion[7] += 1
    elif row[4] == " New York City ":
        countGovernorRegion[8] += 1
    elif row[4] == " Long Island ":
        countGovernorRegion[9] += 1

for row in oldOpioids:
    if row[4] == " Western NY ":
        countGovernorRegionOld[0] += 1
    elif row[4] == " Finger Lakes ":
        countGovernorRegionOld[1] += 1
    elif row[4] == " Southern Tier ":
        countGovernorRegionOld[2] += 1
    elif row[4] == " Central NY ":
        countGovernorRegionOld[3] += 1
    elif row[4] == " North Country ":
        countGovernorRegionOld[4] += 1
    elif row[4] == " Mohawk Valley ":
        countGovernorRegionOld[5] += 1
    elif row[4] == " Capital Region ":
        countGovernorRegionOld[6] += 1
    elif row[4] == " Mid-Hudson ":
        countGovernorRegionOld[7] += 1
    elif row[4] == " New York City ":
        countGovernorRegionOld[8] += 1
    elif row[4] == " Long Island ":
        countGovernorRegionOld[9] += 1

#year, county, rate per 100000, absolute number, population

for row in deathPopulation:
    county = row[1]
    if county[-2:] == "NY":
        nySubtable.append(row)
    if county[-2:] == "WV":
        wvSubtable.append(row)

westchesterYear = []
westchesterDeaths = []
for row in deathPopulation:
    if row[1] == "Westchester County, NY":
        year = row[0]
        deaths = float(row[3])
        westchesterYear.append(year)
        westchesterDeaths.append(deaths)

for row in deathPopulation:
    deaths = float(row[3])
    if deaths >= 100:
        highestDeaths.append(row)

for row in highestDeaths:
    pass
    #print(row)

incomeNY = []
incNY = []
povertyNY = []
childPovertyNY = []
absDeathsNY = []
absoluteDeathsNY = []
incomeWV = []
incWV = []
povertyWV = []
childPovertyWV = []
absDeathsWV = []
absoluteDeathsWV = []
income = []
absoluteDeaths = []

for row in nySubtable:
    if row[0] == "2015":
        absoluteDeathsNY.append(int(float(row[3])))
        absDeathsNY.append(row[3])

for row in wvSubtable:
    if row[0] == "2015":
        absoluteDeathsWV.append(int(float(row[3])))
        absDeathsWV.append(row[3])

for row in census:
    if row[1] == "New York":
        temp001 = row[13]
        incNY.append(int(float(temp001)))
        incomeNY.append([temp001])
        povertyNY.append(float(row[17]))
        childPovertyNY.append(float(row[18]))
    if row[1] == "West Virginia":
        temp001 = row[13]
        incWV.append(int(float(temp001)))
        incomeWV.append([temp001])
        povertyWV.append(float(row[17]))
        childPovertyWV.append(float(row[18]))

'''
print("Race, 17U")
print(countRace)
print("Race, 18+")
print(countRaceOld)
print("Governor's Region, 17U")
print(countGovernorRegion)
print("Governor's Region, 18+")
print(countGovernorRegionOld)

print("")
print(westchesterYear)
print(westchesterDeaths)
'''
#print(incNY)
#print(absoluteDeathsNY)
#print(str(len(incNY)) + "   " + str(len(absoluteDeathsNY)))
'''
x = scipy.array(incNY)
y = scipy.array(absoluteDeathsNY)
'''

print("------------NY--------------")
x1 = scipy.array(incNY)
x2 = scipy.array(povertyNY)
x3 = scipy.array(childPovertyNY)
y = scipy.array(absoluteDeathsNY)

r_row1, p_value1 = pearsonr(x1, y)
r_row2, p_value2 = pearsonr(x2, y)
r_row3, p_value3 = pearsonr(x3, y)
print("income")
print(r_row1)
print(p_value1)
print("poverty")
print(r_row2)
print(p_value2)
print("child poverty")
print(r_row3)
print(p_value3)

print("------------WV--------------")
x4 = scipy.array(incWV)
x5 = scipy.array(povertyWV)
x6 = scipy.array(childPovertyWV)
y2 = scipy.array(absoluteDeathsWV)

r_row4, p_value4 = pearsonr(x4, y2)
r_row5, p_value5 = pearsonr(x5, y2)
r_row6, p_value6 = pearsonr(x6, y2)
print("income")
print(r_row4)
print(p_value4)
print("poverty")
print(r_row5)
print(p_value5)
print("child poverty")
print(r_row6)
print(p_value6)

plt.subplot(2, 1, 1)
plt.scatter(povertyNY, absoluteDeathsNY, c='r', marker='x')
plt.scatter(childPovertyNY, absoluteDeathsNY, c='b', marker='s')
plt.xlabel("Poverty")
plt.ylabel("Drug deaths per year")
plt.xticks(rotation=45)
plt.subplot(2, 1, 2)
plt.scatter(povertyWV, absoluteDeathsWV, c='r', marker='x')
plt.scatter(childPovertyWV, absoluteDeathsWV, c='b', marker='s')
plt.xlabel("Poverty")
plt.ylabel("Drug deaths per year")
plt.xticks(rotation=45)
plt.show()

'''
predictor = lr(n_jobs=-1)
predictor.fit(X=incomeNY, y=absDeathsNY)

xTest = [[39000.0]]
outcome = predictor.predict(X=xTest)
coefficients = predictor.coef_

print('Outcome: {}\nCoefficients: {}'.format(outcome, coefficients))
'''


#plt.bar(["API-hisp", "API-non hisp", "Black-hisp", "Black non-hisp", "NA-hisp", "NA-non hisp", "Other-hisp", "Other-non hisp", "White-hisp", "White-non hisp"], countRace, label="17 and Under")
#plt.bar(["API-hisp", "API-non hisp", "Black-hisp", "Black non-hisp", "NA-hisp", "NA-non hisp", "Other-hisp", "Other-non hisp", "White-hisp", "White-non hisp"], countRaceOld, label="18 and Older", color="g")
#plt.legend()
#plt.xlabel("Race")
#plt.xticks(rotation=35)
#plt.ylabel("Number")
#plt.title("Number of people in opioid abuse assistance by race")
#plt.show()

plt.scatter(westchesterYear, westchesterDeaths)
plt.xticks(rotation=45)
#plt.show()
