# Import Libraries
import pandas as pd 
import numpy as np
from langchain.agents.agent_types import AgentType
from langchain_openai import ChatOpenAI
from langchain_experimental.agents.agent_toolkits import create_pandas_dataframe_agent,create_csv_agent
from langchain_core.prompts import ChatPromptTemplate
from langchain_experimental.tools import PythonAstREPLTool, PythonREPLTool
import os
import time

# Settings
base_path = os.getcwd()
input_path = base_path + '\\Input\\Questions_SingleParameterData.xlsx'
data_path = base_path + '\\Data\\SingleParameterRegression\\'
output_path = base_path + '\\Output\\SingleParameterRegression\\Analysis\\GPT35\\'

iterations = 10
model = 'gpt-3.5-turbo'   
temperatures=[0, 0.25, 0.5, 0.75, 1] 
max_tokens=4096

api_key = os.getenv("OPENAI_API_KEY")

system_template = """You analyze data present in .csv files, understand trends, and answer the question in single word. 
Answer only Yes or No. DO NOT give answers more than one word.
If asked for a number just give number. 
Never add backticks "`" around the action input.
Perform detailed statistical analysis including but not limited to decriptive analysis, 
predictive analysis such as regression OLS or GLM or logistic regression, 
t-tests, hypothesis testing etc.
Plot the data if needed or find the regression coefficients if needed.
Start by examining the contents of the uploaded CSV file provided to the agent, 
to identify what type of data it contains. Use only the second column. Ignore the index.
"""
prompt_template = ChatPromptTemplate.from_messages(
    [("system", system_template), ("user", "{question}")]
)

data_file_list = []
for f in os.listdir(data_path):    
    if os.path.isfile(data_path+f):
        data_file_list.append(f)
print(data_file_list)


print("Starting response generation for Single Parameter Regression questions test...")
print("-----------------------------------------------")

for i in range(iterations): 
    for temperature in temperatures: 
        print("Iteration - "+str(i+1))
        print("-----------------------------------------------")

        for file in data_file_list:
            data_file = data_path+file

            input_file = file.rsplit( ".", 1 )[ 0 ]
            # Read CSV file
            data = pd.read_csv(data_file)

            print("File - "+file)
            print(data.head(3))
            print("-----------------------------------------------")

            # Writing the input to output file to create a copy with new columns and then reading that in df
            filename = output_path+'Responses_SingleParameterData_ChatGPT35_Analysis_iter_'+str(i+1)+'_temp_'+str(temperature)+'.xlsx'

            if os.path.isfile(filename):
                df = pd.read_excel(filename)
            else:
                df = pd.read_excel(input_path)
                df.columns = ['Index','Question']
                df["Response"] = ""
                df["intermediate_steps"]=""
                df.to_excel(filename, index=False)
                df = pd.read_excel(filename)
        
            for index, row in df.iterrows():  
                # Get the next question from the excel
                question = row['Question']      
                print(str(row['Index']))    

                llm = ChatOpenAI(model_name=model, 
                temperature=temperature,
                max_tokens=max_tokens,
                api_key = api_key)

                pd_agent = create_pandas_dataframe_agent(llm=llm, 
                                            df=data, 
                                            tool=[PythonAstREPLTool(), PythonREPLTool()], 
                                            agent_type=AgentType.OPENAI_FUNCTIONS,
                                            verbose=True,
                                            return_intermediate_steps=True,
                                            allow_dangerous_code=True)
                
                print("Run started")
                # Chat with the DataFrame using the provided query and langchain agent
                result = pd_agent.invoke(question)  

                prn = ''
                if pd.isna(df.loc[index, "Response"]) :
                    prn = "Generating Response for question - " + str(row['Index'])
                    print(prn)

                    # If an assistant message is found, print it
                    if result is not None:
                        print(f"{result['output']} \n")
                        df.loc[index, "Response"] = ''
                        df.loc[index, "Response"] = result['output']
                        df.loc[index, "intermediate_steps"]  = ''
                        print(result["intermediate_steps"])
                        df.loc[index, "intermediate_steps"]  = str(result["intermediate_steps"])
                        df.to_excel(filename, index=False)
                        prn += str(result)

                        # Delay of 1 min to clear any buffered data
                        time.sleep(60)

                    print("Completed generation of " + str(index+1))
                    print("-----------------------------------------------")                
                else:
                    print("Generation of " + prn + " already exits in excel")            
                    
                print("The responses for question " + str(index+1) + ": " + question + " have been written successfully to output excel")    
                print("-----------------------------------------------")

    print("Iteration - "+str(i+1)+" completed")
    print("-----------------------------------------------")

print("All the responses for all questions in excel have completed successfully")    
print("-----------------------------------------------")




