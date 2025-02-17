# **Regression Analysis on Residuals of LLM Predictions**

## **Project Overview**
This project applies regression analysis to evaluate the residuals from previous Large Language Model (LLM) predictions (Refer to Python Code). The regression models aim to assess the influence of different models, temperature settings, and prompts on the predictive accuracy of LLMs.

The analysis is divided into:
1. **Regression for Analysis Responses** - Evaluates LLM responses to analysis-based questions.
2. **Regression for Prediction Residuals** - Assesses LLM performance in interpolation and extrapolation tasks.

---

## **Project Structure**
```
/Project_Root
│── Regression for Analysis.R                        # Logistic regression for analysis responses
│── Regression for Predictions - Interpolation.R    # Regression for interpolation-based residuals
│── Regression for Predictions - Extrapolation.R    # Regression for extrapolation-based residuals
│── Data/
│   ├── FinalAnalysisResponses.xlsx                 # Consolidated responses for analysis evaluation
│   ├── FinalPredictionInterpolationResidualsResponses.xlsx  # Residuals from interpolation tests
│   ├── FinalPredictionExtrapolationResidualsResponses.xlsx  # Residuals from extrapolation tests
```

---

## **Setup Instructions**
### **1. Install Dependencies**
Ensure you have the required R libraries installed before running the scripts:

```r
install.packages(c("ggplot2", "dplyr", "broom", "readxl", "stargazer"))
```

---

### **2. Run Regression Analyses**

#### **Analysis-Based Response Regression**
Run logistic regression on responses from various LLMs to analysis-based questions:

```r
source("Regression for Analysis.R")
```
- Evaluates LLM performance across different prompts and temperature settings.
- Uses **logistic regression** to predict correctness probabilities.
- Generates LaTeX-ready regression summaries.

#### **Prediction Residuals Regression (Interpolation & Extrapolation)**
Run regression on residuals for interpolation tasks:

```r
source("Regression for Predictions - Interpolation.R")
```
- Models the fraction of correctly answered interpolation-based predictions.
- Evaluates interactions between LLMs, temperature, and other parameters.

Run regression on residuals for extrapolation tasks:

```r
source("Regression for Predictions - Extrapolation.R")
```
- Similar to interpolation, but for out-of-range predictions.
- Uses linear regression to assess error trends.

---

## **Script Explanations**

### **1. `Regression for Analysis.R`**
- Reads responses from `FinalAnalysisResponses.xlsx`.
- Runs **logistic regression** on responses.
- Models interactions between LLMs, temperature settings, and prompt types.
- Summarizes models using `stargazer` for LaTeX output.

### **2. `Regression for Predictions - Interpolation.R`**
- Reads interpolation residuals from `FinalPredictionInterpolationResidualsResponses.xlsx`.
- Applies **linear regression** to predict accuracy rates.
- Examines interaction effects between temperature and model choice.

### **3. `Regression for Predictions - Extrapolation.R`**
- Similar to the interpolation script, but analyzes extrapolation errors.
- Evaluates prediction performance for **out-of-range** input values.
- Uses temperature squared terms to model non-linear effects.

---

## **Additional Notes**
- The scripts generate **summary statistics** for each regression model.
- All regression results are formatted using `stargazer` for easy report generation.
- Outputs provide insights into how LLMs handle different types of regression tasks.

---

## **License**
This project is licensed under the MIT License.

