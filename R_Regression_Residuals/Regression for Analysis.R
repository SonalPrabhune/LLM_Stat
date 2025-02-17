rm(list = ls())
path <- "<set_your_path>"
setwd(path)

# Load the libraries
library(ggplot2)
library(dplyr)
library(readxl)
library(stargazer)

# Read data from Excel file
data1 <- read_excel(".\\FinalAnalysisResponses.xlsx", sheet = "Response_1")
data2 <- read_excel(".\\FinalAnalysisResponses.xlsx", sheet = "Response_2")
data3 <- read_excel(".\\FinalAnalysisResponses.xlsx", sheet = "Response_3")
data4 <- read_excel(".\\FinalAnalysisResponses.xlsx", sheet = "Response_4")
data5 <- read_excel(".\\FinalAnalysisResponses.xlsx", sheet = "Response_5")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Models for Response_1

# Run logistic regression, excluding GPT35 and Prompt1 as they are baselines
log_model_baseline <- glm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3, 
                                           data = data1, family = "binomial")

# Summarize the model
summary(log_model_baseline)

# Run logistic regression with interaction all terms
log_model_interaction_all <- glm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3 + 
                              GPT4 * Temperature + GPT4o * Temperature + llama * Temperature +
                              Temperature * Prompt2 + Temperature * Prompt3, 
                             data = data1, family = "binomial")

# Summarize the model
summary(log_model_interaction_all)

# Run logistic regression with interaction terms for Temperature and Prompt variables
log_model_interaction_temp_prompt <- glm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3 + 
                                           Temperature * Prompt2 + Temperature * Prompt3, 
                                         data = data1, family = "binomial")

# Summarize the model
summary(log_model_interaction_temp_prompt)

stargazer(log_model_baseline, log_model_interaction_all, log_model_interaction_temp_prompt, digits = 2, type = "latex")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Models for Response_2

# Run logistic regression, excluding GPT35 and Prompt1 as they are baselines
log_model_baseline <- glm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3, 
                          data = data2, family = "binomial")

# Summarize the model
summary(log_model_baseline)

log_model_interaction_temp_prompt_full <- glm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3 + 
                                           Temperature * Prompt2 + Temperature * Prompt3, 
                                         data = data2, family = "binomial")

# Summarize the model
summary(log_model_interaction_temp_prompt_full)

#Removing the high p-value terms from the best model - GPT4 - This reduced the AIC
log_model_interaction_temp_prompt_reduced <- glm(Response ~ GPT4o + Prompt2 + Prompt3 + Temperature +
                                            Temperature * Prompt3, 
                                         data = data2, family = "binomial")

# Summarize the model
summary(log_model_interaction_temp_prompt_reduced)

stargazer(log_model_baseline, log_model_interaction_temp_prompt_full, digits = 2, type = "latex")
stargazer(log_model_interaction_temp_prompt_reduced, digits = 2, type = "latex")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Models for Response_3

# Run logistic regression, excluding GPT35 and Prompt1 as they are baselines
log_model_baseline <- glm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3, 
                          data = data3, family = "binomial")

# Summarize the model
summary(log_model_baseline)

log_model_interaction_temp_prompt_full <- glm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3 + 
                                        GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, 
                                      data = data3, family = "binomial")

# Summarize the model
summary(log_model_interaction_temp_prompt_full)

#Removing the high p-value terms from the best model - GPT4o*temp and GPT4*temp - This reduced the AIC 
log_model_interaction_LLM_temp_reduced <- glm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3 + 
                                        llama * Temperature, 
                                      data = data3, family = "binomial")

# Summarize the model
summary(log_model_interaction_LLM_temp_reduced)

stargazer(log_model_baseline, log_model_interaction_temp_prompt_full, digits = 2, type = "latex")
stargazer(log_model_interaction_LLM_temp_reduced, digits = 2, type = "latex")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Models for Response_4

# Run logistic regression, excluding GPT35 and Prompt1 as they are baselines
log_model_baseline <- glm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3, 
                          data = data4, family = "binomial")

# Summarize the model
summary(log_model_baseline)

log_model_interaction_temp_prompt_full <- glm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3 + 
                                                GPT4 * Temperature + GPT4o * Temperature + llama * Temperature, 
                                              data = data4, family = "binomial")

# Summarize the model
summary(log_model_interaction_temp_prompt_full)

#Removing the high p-value terms from the best model - llama - This reduced the AIC
log_model_baseline_reduced <- glm(Response ~ GPT4 + GPT4o + Temperature + Prompt2 + Prompt3, 
                                               data = data4, family = "binomial")

# Summarize the model
summary(log_model_baseline_reduced)

stargazer(log_model_baseline, log_model_interaction_temp_prompt_full, digits = 2, type = "latex")

stargazer(log_model_baseline_reduced, digits = 2, type = "latex")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# For question 5

# Run linear regression, excluding GPT35 and Prompt1 as they are baselines
model_GPT35baseline <- lm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3, data = data5)

# Summarize the model
summary(model_GPT35baseline)


# Run linear regression with interaction terms for Temperature and Prompt variables
model_interaction_temp_prompt <- lm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3 + 
                                      Temperature * Prompt2 + Temperature * Prompt3, data = data5)

# Summarize the model
summary(model_interaction_temp_prompt)

# Run linear regression with interaction all terms
model_interaction_all <- lm(Response ~ GPT4 + GPT4o + llama + Temperature + Prompt2 + Prompt3 + 
                              GPT4 * Temperature + GPT4o * Temperature + llama * Temperature +
                              Temperature * Prompt2 + Temperature * Prompt3, data = data5)

# Summarize the model
summary(model_interaction_all)

stargazer(model_GPT35baseline, model_interaction_temp_prompt, model_interaction_all, digits = 2, type = "latex")
