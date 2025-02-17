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
data <- read_excel(".\\FinalPredictionInterpolationResidualsResponses.xlsx")

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
# Predictions for Sq.Ft = 3444

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_3444 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_3444 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_3444 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

stargazer(model_GPT35baseline, model_temp_sq, model_interaction_LLM_temp, digits = 2, type = "latex")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 3874

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_3874 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_3874 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_3874 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

stargazer(model_GPT35baseline, model_temp_sq, model_interaction_LLM_temp, digits = 2, type = "latex")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 6124

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_6124 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_6124 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_6124 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 1475

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_1475 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_1475 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_1475 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 6572

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_6572 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_6572 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_6572 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

stargazer(model_GPT35baseline, model_temp_sq, model_interaction_LLM_temp, digits = 2, type = "latex")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 6650

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_6650 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_6650 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_6650 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 6614

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_6614 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_6614 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_6614 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Predictions for Sq.Ft = 5961

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_5961 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_5961 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_5961 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 2166

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_2166 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_2166 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_2166 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Predictions for Sq.Ft = 2229

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response_Sqft_2229 ~ GPT4 + GPT4o + llama + Temperature, data = data)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression, adding Temperature squared
model_temp_sq <- lm(Response_Sqft_2229 ~ GPT4 + GPT4o + llama + Temperature + I(Temperature^2), data = data)

# Summarize the model
summary(model_temp_sq)

# Run linear regression with interaction terms for Temperature and model variables
model_interaction_LLM_temp <- lm(Response_Sqft_2229 ~ GPT4 + GPT4o + llama + Temperature + 
                                   GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, data = data)

# Summarize the model
summary(model_interaction_LLM_temp)