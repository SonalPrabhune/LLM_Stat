# Import Libraries
import numpy as np
import numpy.random as rnd
import pandas as pd 
import time
import random
import os

base_path = os.getcwd()
data_path = base_path + '\\Data\\'

# Configuration
s = 1000 # number of samples
mean = 0
std_dev = 1
intercept = 50
slope = 5.25
low = 300
high = 10000
power = 1.0
# power = 1.01
# power = 1.05
# power = 1.01
# power = 1.02
# power = 1.03
# power = 1.04
# power = 1.05
x_col_name = 'sq_ft'
y_col_name = 'price'

# Generate data for single parameter linear regression
def single_parameter_regression(mean, std_dev, samples, low, high, power, slope, intercept, x_col_name, y_col_name):
    e = []
    for _ in range(samples):
        e.append(rnd.normal(mean, std_dev))
    e = np.round(np.array(e),decimals = 2)
    x = np.array(random.sample(range(low, high), samples))
    y = np.add(e, slope * pow(x, power)) + intercept
   
    df = pd.DataFrame({x_col_name:x, y_col_name:y})
    return df

# Generate data for single parameter linear regression
print("Starting data generation for single parameter linear regression")
df = single_parameter_regression(mean,std_dev,s, low, high, power, slope, intercept, x_col_name, y_col_name)
print(df)
file_name = data_path+"\\SingleParameterRegression\\SingleParameterRegression_Power_"+str(power)+"_y.csv"
df.to_csv(file_name, index=False)
print("Data generation complete")

#**************************************************************************
# Future Work
#**************************************************************************

# # Generate data for exponetial relationship of x to y
# def exponential_x(mean, std_dev, samples, low, high, slope, intercept, x_col_name, y_col_name):
#     e = []
#     for _ in range(samples):
#         e.append(rnd.normal(mean, std_dev))
#     e = np.round(np.array(e),decimals = 2)
#     x = np.linspace(low, high, num=samples)
#     e_x = np.exp(x)
#     y = np.add(e, slope * e_x) + intercept
   
#     df = pd.DataFrame({x_col_name:x, y_col_name:y})
#     return df

# # Generate data for reciprocal relationship of x to y
# def reciprocal_x(mean, std_dev, samples, low, high, slope, intercept, x_col_name, y_col_name):
#     e = []
#     for _ in range(samples):
#         e.append(rnd.normal(mean, std_dev))
#     e = np.round(np.array(e),decimals = 2)
#     x = np.linspace(low, high, num=samples)
#     y = np.add(e, slope * (1/x)) + intercept

#     df = pd.DataFrame({x_col_name:x, y_col_name:y})
#     return df

# # Generate data for squared relationship of x to y
# def squared_x(mean, std_dev, samples, low, high, slope, intercept, x_col_name, y_col_name):
#     e = []
#     for _ in range(samples):
#         e.append(rnd.normal(mean, std_dev))
#     e = np.round(np.array(e),decimals = 2)
#     x = np.linspace(low, high, num=samples)
#     y = np.add(e, slope * x * x) + intercept
       
#     df = pd.DataFrame({x_col_name:x, y_col_name:y})
#     return df

# # Generate data for exponetial relationship of x to y
# print("Starting data generation for exponetial relationship of x to y")
# df = exponential_x(mean, std_dev, s, low, high, slope, intercept, 'x', 'y')
# print(df)
# file_name = data_path+"\\SingleParameterRegression\\x_exponential_y.csv"
# df.to_csv(file_name, index=False)
# print("Data generation complete")

# # Generate data for reciprocal relationship of x to y
# print("Starting data generation for reciprocal relationship of x to y")
# df = reciprocal_x(mean, std_dev, s, low, high, slope, intercept, 'x', 'y')
# print(df)
# file_name = data_path+"\\SingleParameterRegression\\x_reciprocal_y.csv"
# df.to_csv(file_name, index=False)
# print("Data generation complete")

# # Generate data for squared relationship of x to y
# print("Starting data generation for squared relationship of x to y")
# df = squared_x(mean, std_dev, s, low, high, slope, intercept, 'x', 'y')
# print(df)
# file_name = data_path+"\\SingleParameterRegression\\x_squared_y.csv"
# df.to_csv(file_name, index=False)
# print("Data generation complete")

# # Configuration
# num_samples = 1000 # number of samples
# mean_noise = 0
# std_dev_noise = 10
# intercept = 50
# low_sq_ft = 300
# high_sq_ft = 10000
# slope_sq_ft = 5.25
# low_age = 0
# high_age = 75
# slope_age = -0.21
# low_rooms = 1
# high_rooms = 12
# slope_rooms = 3.336

# def multi_parameter_regression(mean_noise, std_dev_noise, num_samples, \
#               low_sq_ft, high_sq_ft, slope_sq_ft, \
#               low_age, high_age, slope_age, \
#               low_rooms, high_rooms, slope_rooms, intercept):
#     e = []
#     for _ in range(num_samples):
#         e.append(rnd.normal(mean_noise, std_dev_noise))
#     e = np.round(np.array(e),decimals = 2)
#     sqft = np.array(random.choices(range(low_sq_ft, high_sq_ft), k=num_samples))
#     age_of_house = np.array(random.choices(range(low_age, high_age), k=num_samples))
#     rooms = np.array(random.choices(range(low_rooms, high_rooms), k=num_samples))
    
#     temp = sum([np.array(slope_sq_ft * sqft), np.array(slope_age * age_of_house), np.array(slope_rooms * rooms)]) 
#     prices = np.add(e, temp) + intercept
   
#     df = pd.DataFrame({'sqft':sqft, 'age_of_house':age_of_house, 'rooms':rooms, 'temp':temp, 'e':e, 'prices':prices})
#     return df
# # Generate data for multi parameter linear regression
# print("Starting data generation for multi parameter linear regression")
# df = multi_parameter_regression(mean_noise, std_dev_noise, num_samples, \
#               low_sq_ft, high_sq_ft, slope_sq_ft, \
#               low_age, high_age, slope_age, \
#               low_rooms, high_rooms, slope_rooms, intercept)
# print(df)
# file_name = data_path+"\\MultiParameterRegression\\MultiParameterRegression_sqft_age_rooms_price.csv"
# df.to_csv(file_name, index=False)
# print("Data generation complete")

#**************************************************************************