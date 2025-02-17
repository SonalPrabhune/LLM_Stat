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
#----------------------------------------------------------------------------------------------

# Parameter Settings
append_path = 'SingleParameterRegression\\'

# Uncomment appropriately for the model to be tested
# append_path_input = append_path+'Analysis\\GPT4\\'
# append_path_input = append_path+'Analysis\\GPT4o\\'
# append_path_input = append_path+'Analysis\\GPT35\\'
append_path_input = append_path+'Analysis\\llama\\'

# Settings
base_path = os.getcwd()
input_path = base_path + '\\Output\\' + append_path_input
output_path = base_path + '\\EvaluatedOutput\\' + append_path_input 
answers_path = base_path + '\\Data\\' + append_path + 'Analysis_Answers\\'
summary_path = base_path + '\\EvaluatedOutput\\' + append_path_input + '\\Summary\\'

iterations = 1

api_key = os.getenv("OPENAI_API_KEY")

#----------------------------------------------------------------------------------------------

def get_embedding(text, model="text-embedding-ada-002"):
    text = text.replace("\n", " ")
    text = text.lower()
    text = re.sub(r'[^\w\s]', '', text) 
    embeddings = OpenAIEmbeddings(api_key=api_key, model=model)
    return embeddings.embed_query(text)


def cos_sim_eval(text1, text2):  
           
    text1_embeddings = get_embedding(text1)
    text2_embeddings = get_embedding(text2)

    # Calculate the cosine similarity between all words
    cos = cosine_similarity([text1_embeddings], [text2_embeddings])

    return cos

input_files = []
for input_file in os.listdir(input_path):
    input_files.append(input_path+input_file)

print("Starting response generation for bias questions test...")
print("-----------------------------------------------")

output_file = input_path.split('\\')[-2]
output_file = output_path+output_file+'.csv'
row_eval=1
df_out = pd.DataFrame()
df_answers = pd.read_excel(answers_path+'Answers.xlsx')
for i, input_file in enumerate(input_files):    
    df_out.loc[i,"Index"] = i+1
    if os.path.isfile(input_file):     
        df_out.loc[i, "File Name"] = os.path.split(input_file)[-1]

        print("Evaluation for "+ input_file)
        df_in = pd.read_excel(input_file) 
        for index, row in df_in.iterrows():
            response_index = df_answers['Index']
            text1 = row.loc['Response']
            text2 = df_answers.loc[index,'Response']
            if index > 11:
                df_out.loc[i, "Response_"+str(response_index[index])+"_"+str(index+1)] = cos_sim_eval(text1, text2)
            elif index > 8 and index < 12:
                try:
                    # If the response is correct within one decimal place after rounding it will be 1 otherwise 0
                    if round(float(text1),1) == round(float(text2), 1):
                        df_out.loc[i, "Response_"+str(response_index[index])+"_"+str(index+1)]=1
                    else:
                        df_out.loc[i, "Response_"+str(response_index[index])+"_"+str(index+1)]=0
                except ValueError:
                    df_out.loc[i, "Response_"+str(response_index[index])+"_"+str(index+1)]=0
            else:
                if text1 == text2:
                    df_out.loc[i, "Response_"+str(response_index[index])+"_"+str(index+1)]=1
                else:
                    df_out.loc[i, "Response_"+str(response_index[index])+"_"+str(index+1)]=0

            print("Completed evaluation of " + input_file)
            print("-----------------------------------------------")

        df_out.to_csv(output_file, index=False)  
       
print("All the evaluations have completed successfully")    
print("-----------------------------------------------")

print ("Summary Results")
print("-----------------------------------------------")

files_for_summary = []
for file in os.listdir(output_path):
    files_for_summary.append(output_path+file)


df_summary = pd.DataFrame()
for i, eval_file in enumerate(files_for_summary):    
    df_summary.loc[i,"Index"] = i+1
    if os.path.isfile(eval_file):     
        df_summary.loc[i, "File Name"] = os.path.split(eval_file)[-1]

        print("Evaluation for "+ eval_file)
        df_eval = pd.read_csv(eval_file) 
        n = df_eval.shape[0]
        col = df_eval.columns[2:]
        for ind, c in enumerate(col):
            print(c)
            if ind >= 12:
                mean, var = df_eval[c].mean(numeric_only=True), df_eval[c].var(numeric_only=True)
                low_CI, high_CI = st.norm.interval(confidence=0.90,
                                                    loc=mean, 
                                                    scale=st.sem(df_eval[c])) 
                # print(mean, var)
                df_summary.loc[i, str(c)+"_mean"] = mean
                df_summary.loc[i, str(c)+"_variance"] = var
                df_summary.loc[i, str(c)+"_lower_90%ConfidenceInterval"] = low_CI
                df_summary.loc[i, str(c)+"_upper_90%ConfidenceInterval"] = high_CI
            else:
                # Count the occurrences of values in column using a dictionary
                counts = {}
                for value in df_eval[c]:
                    counts[value] = counts.get(value, 0) + 1
                    p = counts.get(1, 0)/n
                mean= binom.mean(n, p, loc=0)/n
                var= binom.var(n, p, loc=0)     
                df_summary.loc[i, str(c)+"_perc_correct"] = mean
                df_summary.loc[i, str(c)+"_variance"] = var

        df_summary.to_excel(summary_path+"Summary_Analysis.xlsx", index=False)  

print("Summary for all the evaluations has completed successfully")    
print("-----------------------------------------------")