# -*- coding: utf-8 -*-
"""
Created on Thu Dec 17 12:45:37 2020

@author: Tijana
"""
import numpy as np
import pandas as pd
from IPython import get_ipython
get_ipython().run_line_magic('matplotlib', 'inline')
#%matplotlib inline
import matplotlib.pyplot as plt

from scipy import stats
from scipy.stats import norm, skew

import seaborn as sns
color = sns.color_palette()
sns.set_style('darkgrid')

import warnings
def ignore_warn(*args, **kwargs):
    pass
warnings.warn = ignore_warn #ignore warning from sklearn and seaborn

import os
print(os.listdir("."))   #this is for accessing directories

#import data
train = pd.read_csv('data.csv')
print("Number of rows in data =",train.shape[0])
print("Number of columns in data =",train.shape[1])
print("\n")
print("**Sample data:**")
train.head()

#display first five rows
train.head().transpose()
print(train.head().transpose())

corrmat = train.corr()
f, ax = plt.subplots(figsize=(55,55))
sns.heatmap(corrmat, square = True)

#cat_col = ['Wilderness_Area1']
#for col in cat_col:
#    sns.set()
#    cols = ['Elevation', 'Aspect','Slope', 'Horizontal_Distance_To_Hydrology',
#            'Vertical_Distance_To_Hydrology', 'Horizontal_Distance_To_Roadways'
#            ,'Hillshade_9am', 'Hillshade_Noon', 'Hillshade_3pm',
#            'Horizontal_Distance_To_Fire_Points']
#    plt.figure()
#    sns.pairplot(train[cols], size=3.0, hue=col)
#    plt.show()