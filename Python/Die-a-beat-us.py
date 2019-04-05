import matplotlib.pyplot as plt
import numpy as np
from sklearn import datasets, linear_model
from sklearn.metrics import mean_squared_error, r2_score

diabetes = datasets.load_diabetes()

diabetesX = diabetes.data[:, np.newaxis, 2]
diabetesXtrain = diabetesX[:-20]
diabetesXtest = diabetesX[-20:]

diabetesYtrain = diabetes.target[:-20]
diabetesYtest = diabetes.target[-20:]

regr = linear_model.LinearRegression()

regr.fit(diabetesXtrain, diabetesYtrain)

diabetesYpred = regr.predict(diabetesXtest)
print(diabetesXtest)
print('Coefficients: \n', regr.coef_)
print('Mean squared error: %.2f' % mean_squared_error(diabetesYtest, diabetesYpred))
print('Variance score: %.2f' % r2_score(diabetesYtest, diabetesYpred))

plt.scatter(diabetesXtest, diabetesYtest, color='black')
plt.plot(diabetesXtest, diabetesYpred, color='blue', linewidth=3)
rounded = []
for item in diabetesXtest:
    new = round(item[0], 2)
    rounded.append(new)
plt.xticks(rounded)
plt.yticks(())

plt.show()
      
