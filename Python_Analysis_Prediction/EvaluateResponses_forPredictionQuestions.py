from langchain_openai import ChatOpenAI
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.output_parsers import StrOutputParser
import os
import pandas as pd
import re
from sklearn.metrics.pairwise import cosine_similarity
from nltk.corpus import stopwords
from langchain_openai import OpenAIEmbeddings
import re
from scipy.stats import binom 
import scipy.stats as st 
import numpy as np 
import math
#----------------------------------------------------------------------------------------------

# Parameter Settings 
append_path = 'SingleParameterRegression\\Prediction\\Extrapolation\\GPT4\\'
# append_path = 'SingleParameterRegression\\Prediction\\Extrapolation\\GPT4o\\'
# append_path = 'SingleParameterRegression\\Prediction\\Extrapolation\\GPT35\\'
# append_path = 'SingleParameterRegression\\Prediction\\Extrapolation\\llama\\'

# append_path = 'SingleParameterRegression\\Prediction\\Interpolation\\GPT4\\'
# append_path = 'SingleParameterRegression\\Prediction\\Interpolation\\GPT4o\\'
# append_path = 'SingleParameterRegression\\Prediction\\Interpolation\\GPT35\\'
# append_path = 'SingleParameterRegression\\Prediction\\Interpolation\\llama\\'

# Settings
base_path = os.getcwd()
input_path = base_path + '\\Output\\' + append_path
output_path = base_path + '\\EvaluatedOutput\\' + append_path
answers_path = base_path + '\\Data\\SingleParameterRegression\\Prediction_Answers\\Extrapolation\\'
# answers_path = base_path + '\\Data\\SingleParameterRegression\\Prediction_Answers\\Interpolation\\'

iterations = 1

api_key = os.getenv("OPENAI_API_KEY")

input_files = []
for input_file in os.listdir(input_path):
    input_files.append(input_path+input_file)

print("Starting response generation for bias questions test...")
print("-----------------------------------------------")

output_file = input_path.split('\\')[-2]
output_file = output_path+output_file+'_Residuals.csv'
row_eval=1
df_out = pd.DataFrame()
df_answers = pd.read_csv(answers_path+'SingleParameterRegression_Power_1.0_y.csv')
for i, input_file in enumerate(input_files):    
    df_out.loc[i,"Index"] = i+1
    if os.path.isfile(input_file):     
        df_out.loc[i, "File Name"] = os.path.split(input_file)[-1]

        print("Evaluation for "+ input_file)
        df_in = pd.read_excel(input_file) 
        for index, row in df_in.iterrows():
            text1 = row.loc['price']
            text2 = df_answers.loc[index,'price']
            if ('$' in str(text1)):
                text1=str(text1).replace('$', '')
            if (',' in str(text1)):
                text1=str(text1).replace(',', '')
            dollar_amount_cleaned = text1 #.replace('$', '').replace(',', '')
            dollar_amount_float = float(dollar_amount_cleaned)
            actual_price = float(text2)
            if not math.isnan(dollar_amount_float):          

                dollar_amount_answer = round(actual_price - float(text1),2)
                
                df_out.loc[i, "Sqft = "+ str(row.loc['sq_ft'])] = dollar_amount_answer      
                
            else:
                df_out.loc[i, "Sqft = "+ str(row.loc['sq_ft'])] = ''

            print("Completed evaluation of " + input_file)
            print("-----------------------------------------------")

        df_out.to_csv(output_file, index=False)
       
print("All the evaluations have completed successfully")    
print("-----------------------------------------------")