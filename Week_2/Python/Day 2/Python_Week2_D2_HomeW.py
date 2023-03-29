#!/usr/bin/env python
# coding: utf-8

# # 1. Create a vector with values ranging from 15 to 55 and print all values except the first and last.import numpy as np

# In[3]:



import numpy as np
v = np.arange(15,55)
print("Original vector:")
print(v)
print("After:")
print(v[1:-1])


# # 2. Create a 3X4 array using np.full().
# 

# In[6]:


a = np.arange(10,22).reshape((3, 4))
print(a)


# # 3. Create a 3x3 matrix filled with values from 10 to 18. Use np.arange() and np.reshape().

# In[7]:


x =  np.arange(2, 11).reshape(3,3)
print(x)


# # 4. Create a 5x5 zero matrix with elements on the main diagonal equal to 1, 2, 3, 4, 5 using np.diag().

# In[14]:


np.zeros(5)
x = np.diag([1, 2, 3, 4, 5])
print(x)


# # 5. Create a null vector of size 10 using np.zeros() and update sixth value to 11.

# In[15]:


x = np.zeros(10)
print(x)
print("After:")
x[6] = 11
print(x)


# # 6. Convert an array to a float type using np.asfarray().

# In[16]:


a = [1, 2, 3, 4]
print(a)
x = np.asfarray(a)
print("After:")
print(x)


# # 7. Swap columns in a given array. Such as:

# In[40]:


x = np.arange(12).reshape(4, 3)
print(x)

x[:, [2, 0]] = x[:, [0, 2]]
print(x)


# # 8. Capitalize the first letter, lowercase, uppercase, swapcase, title-case of all the elements of a
# given array. Use np.char.capitalize(), np.char.lower(), np.char.upper(),
# np.char.swapcase(), np.char.title().

# In[43]:


x = np.array(['python', 'PHP', 'java', 'C++'], dtype=str)
print(x)
capitalized_case = np.char.capitalize(x)
lowered_case = np.char.lower(x)
uppered_case = np.char.upper(x)
swapcased_case = np.char.swapcase(x)
titlecased_case = np.char.title(x)
print("\n Capitalized: ", capitalized_case)
print("Lowered: ", lowered_case)
print("Uppered: ", uppered_case)
print("Swapcased: ", swapcased_case)
print("Titlecased: ", titlecased_case)


# # 9. Get the dates of yesterday, today and tomorrow using np.datetime64() and np.timedelta64().

# In[44]:


yesterday = np.datetime64('today', 'D') - np.timedelta64(1, 'D')
print("Yestraday: ",yesterday)
today     = np.datetime64('today', 'D')
print("Today: ",today)
tomorrow  = np.datetime64('today', 'D') + np.timedelta64(1, 'D')
print("Tomorrow: ",tomorrow)


# # 10.Append values to the end of an array using np.append().

# In[45]:


x = [10, 20, 30]
print(x)
x = np.append(x, [[40, 50, 60], [70, 80, 90]])
print("After:")
print(x)


# # cars = pd.read_excel('cars.xlsx')

# In[79]:


import pandas as pd
import seaborn as sns
import numpy as np
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')


# Variable dictionary is listed below:
# Manufacturer: manufacturer name
# Model: model name
# Displ: engine displacement, in litres
# Year: year of manufacture
# Cyl: number of cylinders
# Trans: type of transmission
# Drv: the type of drive train, where f = front-wheel drive, r = rear wheel drive,
# 4 = 4wd
# Cty: city miles per gallon
# Hwy: highway miles per gallon
# Fl: fuel type
# Class: "type" of car

# # 

# In[69]:


cars = pd.read_excel('cars.xlsx')
cars


# # Show relationship between highway and city miles per gallon.

# In[78]:


x = np.array(['cty'])
y = np.array(['hwy'])

plt.scatter(x, y)
plt.show()


# In[81]:


df = cars[['cty','hwy']]

sns.pairplot(df, kind="scatter")


# #  2 Show distributions and scatters between all variables. While hue equals to type of drive train which variables have the lowest and the highest correlation? Find according to scatterplot.

# In[88]:


sns.pairplot(cars, kind="scatter" , hue="drv");


# # 3. Which type of car is most frequent in dataset? Show by using countplot.

# In[99]:


sns.countplot(data=cars, x="class");


# # 4. Display number of cylinders for each drive train in bar chart. Which drive train is the most frequent?

# In[100]:


sns.countplot(data=cars, x="cyl");


# # 5. Visualize engine displacement by each class using boxplot. Do the same thing in violinplot.

# In[118]:


cars.plot.box(x='class',y='displ', grid='True');


# In[128]:


sns.violinplot(data=cars, x="displ", y="class")

