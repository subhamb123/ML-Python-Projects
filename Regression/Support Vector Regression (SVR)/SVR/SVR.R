dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


library('e1071')
regressor = svm(formula = Salary ~ ., data = dataset, type = 'eps-regression')

y_pred = predict(regressor, data.frame(Level = 6.5))

library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')