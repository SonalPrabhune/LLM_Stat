rm(list = ls())
path <- "<set_your_path>"
setwd(path)

# Load the libraries
library(ggplot2)
library(dplyr)
library(broom)
library(readxl)
library(stargazer)

# Read data from Excel file
data <- read_excel(".\\FinalPredictionExtrapolationResidualsResponses.xlsx")

# Display the first few rows of the data to check
head(data)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Regression Results of Fraction of times the LLM was able to answer the question - Log Ratio of Receiving Answer

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_baseline <- lm(LogAnswer ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_baseline)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(LogAnswer ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp_nollama <- lm(LogAnswer ~ GPT4 + GPT4o + llama + Temperature + 
                                           GPT4 * Temperature + GPT4o * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp_nollama)

stargazer(model_baseline, model_interaction_LLM_temp, model_interaction_LLM_temp_nollama, digits = 2, type = "latex")


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Regression Results of Fraction of times the LLM was able to answer the question

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_baseline <- lm(Answered ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_baseline)


# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Answered ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp_nollama <- lm(Answered ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp_nollama)

stargazer(model_baseline, model_interaction_LLM_temp, model_interaction_LLM_temp_nollama, digits = 2, type = "latex")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Predictions for Sq.Ft = 250

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_250 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_250 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_250 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

stargazer(model_GPT35baseline, model_temp_sq, model_interaction_LLM_temp, digits = 2, type = "latex")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 275

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_275 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_275 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_275 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 11000

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_11000 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_11000 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_11000 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 10500

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_10500 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_10500 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_10500 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

stargazer(model_GPT35baseline, model_temp_sq, model_interaction_LLM_temp, digits = 2, type = "latex")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 280

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_280 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_280 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_280 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

stargazer(model_GPT35baseline, model_temp_sq, model_interaction_LLM_temp, digits = 2, type = "latex")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 20000

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_20000 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_20000 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_20000 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 150

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_150 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_150 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_150 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Predictions for Sq.Ft = 50000

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_50000 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_50000 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_50000 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 100000

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_100000 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_100000 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_100000 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 102

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_102 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_102 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_102 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)