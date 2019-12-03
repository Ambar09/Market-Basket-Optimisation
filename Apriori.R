#Market Basket Optimisation

#Data Preperation
#Using arules package to create a sparse matrix
install.packages('arules')
library("arules")
dataset = read.csv("Market_Basket_Optimisation.csv", header = FALSE) #Since there were no titles for columns, header = False
dataset = read.transactions("Market_Basket_Optimisation.csv", sep = ",", rm.duplicates = TRUE) #arules package giving sparse matrix
summary(dataset) #Summary of all the transactions
itemFrequencyPlot(dataset, topN = 25)

#Traning the dataset 
rules = apriori(data = dataset, parameter = list(support =  0.004,confidence = 0.2 ))

#Visualizing the result
inspect(sort(rules, by = 'lift')[1:10])