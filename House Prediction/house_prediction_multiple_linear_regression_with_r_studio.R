# Import Library
library(caTools)

# Load the data
df = read.csv('kc_house_data.csv')

# Train test split
set.seed(123)
split = sample.split(df$price, SplitRatio=0.7)
training_set = subset(df,split==TRUE)
test_set = subset(df,split==FALSE)

# Regression
reg = lm(formula = price ~ bedrooms + bathrooms + sqft_living + sqft_lot + floors
         + waterfront + view + condition + grade + sqft_above + sqft_basement +
           yr_built + yr_renovated + zipcode + lat + long + sqft_living15 + 
           sqft_lot15,data = training_set)

# Prediction
y_pred = predict(reg, newdata = test_set)
result = cbind(test_set$price,y_pred)


               