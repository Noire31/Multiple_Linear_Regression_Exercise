# Import Library
library(caTools)

# Load the data
df = read.csv('Fish.csv')

# Train test split
set.seed(123)
split = sample.split(df$Weight, SplitRatio=0.7)
training_set = subset(df,split==TRUE)
test_set = subset(df,split==FALSE)

# Count the categorical data
count(df$Species)

# Map the data
df$Species = recode(df$Species, "'Bream'=1; 'Parkki'=2; 'Perch'=3; 'Pike'=4; 
                    'Roach'=5; 'Smelt'=6; 'Whitefish'=7 ")

# Regression
reg = lm(formula = Weight ~ Species + Length1 + Length2 + Length3 + Height
         + Width, data = training_set)

# Prediction
y_pred = predict(reg, newdata = test_set)

result = cbind(test_set$Weight,y_pred)
