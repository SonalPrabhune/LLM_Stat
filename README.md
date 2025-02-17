# **LLM-Based Regression Analysis and Prediction: Project Overview**

## **Introduction**
This project explores the use of Large Language Models (LLMs) for statistical analysis, predictive modeling, and regression-based evaluation of residuals. The study assesses whether LLMs can autonomously perform data-driven tasks that traditionally require human expertise, aligning with ongoing research on AI-assisted decision-making.

This repository consists of:
1. **Python-based LLM Analysis & Prediction** – Using LLMs to analyze synthetic regression data and generate predictions.
2. **R-based Residual Regression Analysis** – Performing post-prediction residual analysis to evaluate LLM performance.

The results are consolidated into regression models to assess **decision accuracy, interpretability, and model-specific biases** in statistical and predictive tasks.

---

## **Repository Structure**
```
/Project_Root
│── Python_Analysis_Prediction/
│   │── DataGeneration.py                     # Generates synthetic data
│   │── requirements.txt                      # Dependencies for the project
│   │── Agent_GPT35_SingleParameterRegression_Analysis.py
│   │── Agent_GPT4_SingleParameterRegression_Analysis.py
│   │── Agent_GPT4o_SingleParameterRegression_Analysis.py
│   │── Agent_llama3_SingleParameterRegression_Analysis.py
│   │── Agent_GPT35_SingleParameterRegression_Prediction.py
│   │── Agent_GPT4_SingleParameterRegression_Prediction.py
│   │── Agent_GPT4o_SingleParameterRegression_Prediction.py
│   │── Agent_llama3_SingleParameterRegression_Prediction.py
│   │── EvaluateResponses_forAnalysisQuestions.py
│   │── EvaluateResponses_forPredictionQuestions.py
│   │── Data/
│   │   ├── SingleParameterRegression/         # Generated datasets
│   │   ├── Analysis_Answers/                  # Answers used for Evaluation
│   │   │   ├── Prediction_Answers/            # Answers used for Evaluation
│   │── Output/                                # Results of analysis and prediction
│   │   ├── SingleParameterRegression/         
│   │   │   ├── Analysis/                      # Raw Data from Analysis
│   │   │   ├── Prediction/                    # Raw Data from Prediction
│   │   │   │   ├── Extrapolation/
│   │   │   │   ├── Interpolation/
│   │── EvaluatedOutput/                       # Evaluation results of LLMs
│   │   ├── SingleParameterRegression/         
│   │   │   ├── Analysis/                      # Evaluated Data from Analysis
│   │   │   ├── Prediction/                    # Evaluated Data from Prediction
│   │   │   │   ├── Extrapolation/
│   │   │   │   ├── Interpolation/
│── R_Regression_Residuals/
│   ├── Regression for Analysis.R
│   ├── Regression for Predictions - Interpolation.R
│   ├── Regression for Predictions - Extrapolation.R
│   │── Data/
│   │   ├── FinalAnalysisResponses.xlsx
│   │   ├── FinalPredictionInterpolationResidualsResponses.xlsx
│   │   ├── FinalPredictionExtrapolationResidualsResponses.xlsx
│── Documentation/
│   ├── Readme_Python.md
│   ├── Readme_R_Regression.md
│   ├── Arxiv_DecisionMakingLLM.pdf
```

---

## **Summary of Components**

### **1. Python-Based LLM Analysis & Prediction** ([Readme_Python.md](./Documentation/Readme_Python.md))
- **Objective:** Perform statistical analysis and regression-based predictions using OpenAI GPT models (`GPT-3.5`, `GPT-4`, `GPT-4o`) and Meta’s `Llama3`.
- **Analysis Scripts:** Evaluate statistical trends using hypothesis tests, regression models (OLS, GLM), and statistical tests.
- **Prediction Scripts:** Perform **interpolation and extrapolation** using trained regression models to predict target values.
- **Evaluation Scripts:** Compare predicted values against ground truth using residual analysis and cosine similarity.
- **Execution:**
  ```bash
  pip install -r requirements.txt
  python DataGeneration.py  # Generate synthetic data
  python Agent_GPT35_SingleParameterRegression_Analysis.py  # Run analysis
  python Agent_GPT35_SingleParameterRegression_Prediction.py  # Run predictions
  python Agent_GPT4_SingleParameterRegression_Analysis.py  # Run analysis
  python Agent_GPT4_SingleParameterRegression_Prediction.py  # Run predictions
  python Agent_GPT4o_SingleParameterRegression_Analysis.py  # Run analysis
  python Agent_GPT4o_SingleParameterRegression_Prediction.py  # Run predictions
  python Agent_llama_SingleParameterRegression_Analysis.py  # Run analysis
  python Agent_llama_SingleParameterRegression_Prediction.py  # Run predictions
  python EvaluateResponses_forAnalysisQuestions.py  # Evaluate responses
  python EvaluateResponses_forPredictionQuestions.py  # Evaluate responses
  ```

### **2. R-Based Regression on Residuals** ([Readme_R_Regression.md](./Documentation/Readme_R_Regression.md))
- **Objective:** Assess LLM prediction accuracy using **logistic regression (analysis responses) and linear regression (prediction residuals)**.
- **Scripts:**
  - `Regression for Analysis.R`: Logistic regression on LLM-generated analysis responses.
  - `Regression for Predictions - Interpolation.R`: Regression on residuals for interpolation-based predictions.
  - `Regression for Predictions - Extrapolation.R`: Regression on residuals for extrapolation-based predictions.
- **Execution:**
  ```r
  source("Regression for Analysis.R")  # Analyze correctness probability
  source("Regression for Predictions - Interpolation.R")  # Assess interpolation residuals
  source("Regression for Predictions - Extrapolation.R")  # Assess extrapolation residuals
  ```

---

## **Research Insights from Arxiv Study**
This project aligns with findings from *"Can AI Replace the Data Scientist? Business Decision-Making with Large Language Models"* (Prabhune et al., University of South Florida), which assesses whether LLMs can replace traditional data scientists in decision-making scenarios.

### **Key Findings from the Study & Alignment with This Project:**
1. **Accuracy Sensitivity to Model and Temperature Settings:**
   - The study shows that **LLMs exhibit accuracy variation across different temperature settings**.
   - Our **residual regression models validate this**, demonstrating how **temperature** and **prompt phrasing** impact prediction accuracy.

2. **Interpolation vs. Extrapolation Performance:**
   - The research emphasizes that **LLMs struggle with extrapolation** due to the lack of trained examples outside the observed range.
   - Our **R-based residual regression confirms this**, showing significant errors in LLM extrapolations compared to interpolations.

3. **Decision Accuracy Dependent on Prompt Engineering:**
   - The study highlights that **the way a question is framed influences LLM response correctness**.
   - Our project evaluates this impact by analyzing different LLM responses to identical statistical questions framed in varying ways.

4. **Trust and Reliability in Decision-Making:**
   - Research shows that **LLM-based decision systems must be validated for reliability to build trust**.
   - Our project aims to provide **quantitative validation** through residual regression models to assess LLM-generated outputs.

---

## **Conclusion**
This project presents a structured methodology to assess LLM performance in **data-driven decision-making** by:
- **Utilizing Python** for LLM-based **statistical analysis and predictions**.
- **Applying R** for **regression on residuals** to validate prediction accuracy.
- **Comparing findings** with published research on LLM-based decision-making.

The combined Python and R workflows provide insights into **LLM capabilities, weaknesses, and optimization strategies** for statistical and predictive tasks.

---

## **License**
This project is licensed under the MIT License.

