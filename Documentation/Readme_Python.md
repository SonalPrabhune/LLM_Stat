# **Single Parameter Regression Analysis and Prediction**

## **Project Overview**

This project involves generating synthetic data, performing Monte Carlo simulations for analysis, and making predictions using different Large Language Models (LLMs). The key tasks include:

1. **Data Generation** - Using `DataGeneration.py` to create synthetic regression data.
2. **Analysis & Prediction** - Running analysis and making predictions using both OpenAI and Llama models.
   - **Analysis**: Conducts analysis with a focus on statistical and structural evaluations of the data.
   - **Prediction**: Performs interpolation and extrapolation for given inputs.
3. **Evaluation** - Assessing the accuracy and performance of different LLMs using the `EvaluateResponses` scripts.

---

## **Project Structure**

```
/Project_Root
│── DataGeneration.py                     # Generates synthetic data
│── requirements.txt                       # Dependencies for the project
│── Agent_GPT35_SingleParameterRegression_Analysis.py
│── Agent_GPT4_SingleParameterRegression_Analysis.py
│── Agent_GPT4o_SingleParameterRegression_Analysis.py
│── Agent_llama3_SingleParameterRegression_Analysis.py
│── Agent_GPT35_SingleParameterRegression_Prediction.py
│── Agent_GPT4_SingleParameterRegression_Prediction.py
│── Agent_GPT4o_SingleParameterRegression_Prediction.py
│── Agent_llama3_SingleParameterRegression_Prediction.py
│── EvaluateResponses_forAnalysisQuestions.py
│── EvaluateResponses_forPredictionQuestions.py
│── Data/
│   ├── SingleParameterRegression/         # Generated datasets
│   ├── Analysis_Answers/                  # Answers used for Evaluation
│   ├── Prediction_Answers/                # Answers used for Evaluation
│── Output/                                # Results of analysis and prediction
│   ├── SingleParameterRegression/         
│   │   ├── Analysis/                      # Raw Data from Analysis
│   │   ├── Prediction/                    # Raw Data from Prediction
│   │   │   ├── Extrapolation/
│   │   │   ├── Interpolation/
│── EvaluatedOutput/                       # Evaluation results of LLMs
│   ├── SingleParameterRegression/         
│   │   ├── Analysis/                      # Evaluated Data from Analysis
│   │   ├── Prediction/                    # Evaluated Data from Prediction
│   │   │   ├── Extrapolation/
│   │   │   ├── Interpolation/
```

---

## **Setup Instructions**

### **1. Install Dependencies**

Run the following command to install required dependencies:

```bash
pip install -r requirements.txt
```

---

### **2. Generate Data**

Run the `DataGeneration.py` script to generate synthetic regression data:
OR
Use the existing systhetic data generated in the Data path

```bash
python DataGeneration.py
```

This script generates a dataset under `Data/SingleParameterRegression/`.

---

### **3. Run Analysis & Prediction**

Run analysis and prediction using different models.

#### **For OpenAI GPT-3.5**

```bash
python Agent_GPT35_SingleParameterRegression_Analysis.py
python Agent_GPT35_SingleParameterRegression_Prediction.py
```

#### **For OpenAI GPT-4**

```bash
python Agent_GPT4_SingleParameterRegression_Analysis.py
python Agent_GPT4_SingleParameterRegression_Prediction.py
```

#### **For OpenAI GPT-4o**

```bash
python Agent_GPT4o_SingleParameterRegression_Analysis.py
python Agent_GPT4o_SingleParameterRegression_Prediction.py
```

#### **For Llama3 (Local)**

```bash
python Agent_llama3_SingleParameterRegression_Analysis.py
python Agent_llama3_SingleParameterRegression_Prediction.py
```

- **Llama models** are run locally or on a Linux cluster using the **Ollama framework**.
- **OpenAI models** are accessed via API (Ensure you set `OPENAI_API_KEY` in the environment variables).

---

### **4. Evaluate Model Performance**

Evaluate the generated responses using:

```bash
python EvaluateResponses_forAnalysisQuestions.py
python EvaluateResponses_forPredictionQuestions.py
```

These scripts compare model responses against ground truth and compute evaluation metrics.
- **For Prediction Questions** uncomment the appropriate sections based on whether Interpolation responses is evaluated or Extrapolation responses.

---

## **Code Explanations**

### **1. Data Generation**
- **`DataGeneration.py`**: Generates synthetic single-parameter regression data, defining a slope, intercept, and power to simulate real-world distributions. Saves the dataset as a CSV file.

### **2. Analysis Code**
- **`Agent_GPT35_SingleParameterRegression_Analysis.py`**: Performs similar analysis using OpenAI's `GPT-3.5` model for enhanced statistical evaluations.
- **`Agent_GPT4_SingleParameterRegression_Analysis.py`**: Performs the same analysis tasks but using OpenAI's `GPT-4` model for enhanced statistical evaluations.
- **`Agent_GPT4o_SingleParameterRegression_Analysis.py`**: Performs the same analysis tasks but using OpenAI's `GPT-4o` model for enhanced statistical evaluations.
- **`Agent_llama3_SingleParameterRegression_Analysis.py`**: Performs the same analysis tasks but using the `Llama3` model, running locally or on a Linux cluster via `Ollama`.

### **3. Prediction Code**
- **`Agent_GPT35_SingleParameterRegression_Prediction.py`**: Utilizes OpenAI's `GPT-3.5` model to perform predictions using training data trends. It applies PythonREPL tools to predict target values for unseen inputs. Supports both interpolation (predicting within the range of given data) and extrapolation (predicting beyond existing data points).
- **`Agent_GPT4_SingleParameterRegression_Prediction.py`**: Similar to the GPT-3.5 prediction script but uses `GPT-4` to generate regression-based predictions.
- **`Agent_GPT4o_SingleParameterRegression_Prediction.py`**: Similar to the GPT-3.5 prediction script but uses `GPT-4o` to generate regression-based predictions.
- **`Agent_llama3_SingleParameterRegression_Prediction.py`**: Similar to the GPT-3.5 prediction script but uses `Llama3` to generate regression-based predictions.

### **4. Evaluation Code**
- **`EvaluateResponses_forAnalysisQuestions.py`**: Compares model-generated responses with ground-truth answers using cosine similarity and statistical evaluation methods.
- **`EvaluateResponses_forPredictionQuestions.py`**: Evaluates prediction accuracy by computing residual errors between predicted values and actual data.

---

## **Additional Notes**
- The scripts use **LangChain** for LLM-based computations.
- Output files will be stored in the `/Output/` directory.
- Evaluation results will be saved in `/EvaluatedOutput/`.

---

## **License**
This project is licensed under the MIT License.
