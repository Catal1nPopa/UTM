import pandas as pd
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
####1
data_info = pd.read_csv('lending_club_info.csv', index_col='LoanStatNew')
print(data_info.loc['revol_util']['Description'])

def feat_info(col_name):
  print(data_info.loc[col_name]['Description'])

feat_info('mort_acc')

######2 Loading the data and other imports

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


file_path = 'lending_club_loan_two.csv'
df = pd.read_csv(file_path)

######3
df.info()

#df.corr()
###sectiona 1 In 9,10 exploratory data analysis
def In9():
  sns.countplot(x="loan_status", data=df, palette={"Fully Paid": "blue", "Charged Off": "orange"}, legend=False)
  plt.show()
#In9()

##### In 11,12
def In10():
  plt.figure(figsize=(12,6))
  sns.distplot(df['loan_amnt'], kde=False, bins=60)
  plt.show()
#In10()

#In 12
def In12():
  numeric_columns = df.select_dtypes(include=[np.number])
  # Calculam matricea de corelatie
  correlation_matrix = numeric_columns.corr()
  # Afisam heatmap
  plt.figure(figsize=(16, 6))
  sns.heatmap(correlation_matrix, annot=True)
  plt.show()
#In12()

def In13():
  #In13
  sns.scatterplot(x="installment", y="loan_amnt", data=df)
  plt.show()
#In13()

def In14():
  #In 14
  sns.boxplot(x = "loan_status", y = "loan_amnt", data=df,)
  plt.show()
#In14()

#In 15
loan_amount_summary = df.groupby('loan_status')['loan_amnt'].describe()
print(loan_amount_summary)

#In 16
unique_grades = df['grade'].unique()
print(unique_grades)

#In 17
unique_subgrades = df['sub_grade'].unique()
print(unique_subgrades)

#In 18
def In18():
  sns.countplot(x = "grade", hue="loan_status", data=df)
  plt.show()
#In18()

#In 19
def In19():
  plt.figure(figsize=(12, 5))
  sns.countplot(x='sub_grade', data=df, hue='loan_status', order=sorted(df['sub_grade'].unique()))
  plt.show()
#In19()

# In 20
f_and_g = df[(df['grade']=='G') | (df['grade']=='F')]

def In20():
  plt.figure(figsize=(12,4))
  subgrade_order = sorted(f_and_g['sub_grade'].unique())
  sns.countplot(x='sub_grade',data=f_and_g,order = subgrade_order,hue='loan_status')
  plt.show()
#In20()

#In 21
df['loan_repaid'] = df['loan_status'].apply(lambda x:1 if x=="Fully Paid" else 0 )
#In 22
print(df['loan_repaid'])

#In 23
def In23():
  df.corr()['loan_repaid'].sort_values().drop('loan_repaid').plot(kind='bar')
  plt.show()
#In23()
#Section 2 : Data PreProcessing
#In 24
df.isnull().sum()

#Missing Data

#In 25
print(df.shape)

#In 26

print(df.isnull().sum())
#In 27

print((df.isnull().sum()/len(df))*100)

#In 28
feat_info('emp_title')

#In 29
feat_info('emp_length')

#In 30
print(df['emp_title'].nunique())

#In 31
print(df['emp_title'].value_counts())

#In 32
df = df.drop('emp_title',axis=1)

#In 33
print(df.columns)

#In 34
def In34():
  plt.figure(figsize=(12,5))
  sns.countplot(x='emp_length',data=df, palette="hls", order=sorted(df['emp_length'].dropna().unique()))
  plt.show()
#In34()

#In 35
def In35():
  plt.figure(figsize=(12, 5))
  sns.countplot(x='emp_length', data=df, hue='loan_status', order=sorted(df['emp_length'].dropna().unique()))
  plt.show()
In35()
#In35()

#In 36
def In36():
  ChargedOff = df[df['loan_status']=="Charged Off"].groupby("emp_length").count()['loan_status']
  FullyPaid = df[df['loan_status']=="Fully Paid"].groupby("emp_length").count()['loan_status']
  emp_len = ChargedOff/ FullyPaid
  emp_len.plot(kind='bar')
  plt.show()

#In 38
df = df.drop('emp_length', axis=1)

#In 39
print(df.columns)

#In 40
print(df['purpose'].head(10))

#In 41
print(df['title'].head(10))

#In 42
df = df.drop('title',axis=1)

#In 43
print(df.columns)

feat_info('mort_acc')

df.corr()['mort_acc'].sort_values()

df.groupby('total_acc').mean()

total_acc_mean = df.groupby('total_acc').mean()['mort_acc']

df['mort_acc'] = df.apply(lambda x : total_acc_mean[x['total_acc']] if (np.isnan(x['mort_acc'])) else x['mort_acc'],axis=1)
#In 52
df = df.dropna()
print(df.isnull().sum())

df = df.dropna()
df.isnull().sum()
#In 54
#Categorical Variables and Dummy Variables
print(df.select_dtypes(['object']).columns)

#In 55
df['term'] = df['term'].apply(lambda term: int(term[:3]))

print(df)

#In 57
df =df.drop('grade',axis =1)

#In 58
dummies = pd.get_dummies(df['sub_grade'],drop_first=True)
print(dummies)

#In 59
df = pd.concat([df.drop('sub_grade',axis=1),dummies],axis=1)
print(df.columns)

dummies = pd.get_dummies(df[['verification_status', 'application_type','initial_list_status','purpose' ]],drop_first=True)
df = df.drop(['verification_status', 'application_type','initial_list_status','purpose'],axis=1)
df = pd.concat([df,dummies],axis=1)

df['home_ownership'].value_counts()


df['home_ownership']=df['home_ownership'].replace(['NONE', 'ANY'], 'OTHER')

dummies = pd.get_dummies(df['home_ownership'],drop_first=True)
df = df.drop('home_ownership',axis=1)
df = pd.concat([df,dummies],axis=1)
df.columns


df['zip_code'] = df['address'].apply(lambda x:x.split(' ')[-1])
df['zip_code'].value_counts()

dummies = pd.get_dummies(df['zip_code'],drop_first=True)
df = df.drop(['zip_code','address'],axis=1)
df = pd.concat([df,dummies],axis=1)

df = df.drop('issue_d',axis=1)
#Train Test Split
#In 72
from sklearn.model_selection import train_test_split
df = df.drop('loan_status',axis=1)
print(df.columns)

#In 74
X= df.drop('loan_repaid',axis=1).values
y= df['loan_repaid'].values

#Optional
#In 76
sample = df.sample(frac=0.1,random_state=101)
print(len(df))

#In 76
X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.2)

from sklearn.preprocessing import MinMaxScaler
scaler = MinMaxScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

#model data

import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense,Dropout

model = Sequential()
model.add(Dense(78,  activation='relu'))
model.add(Dropout(0.2))
model.add(Dense(39, activation='relu'))
model.add(Dropout(0.2))
model.add(Dense(19, activation='relu'))
model.add(Dropout(0.2))
model.add(Dense(units=1,activation='sigmoid'))
model.compile(loss='binary_crossentropy', optimizer='adam')

model.fit(x=X_train,
          y=y_train,
          epochs=25,
          batch_size=256,
          validation_data=(X_test, y_test),
          )
from tensorflow.keras.models import load_model
model.save('keras.h5')

#evaluare

loss = pd.DataFrame(model.history.history)
loss[['loss','val_loss']].plot()

predictions = model.predict_classes(X_test)
from sklearn.metrics import classification_report,confusion_matrix
print(classification_report(y_test,predictions))

print(confusion_matrix(y_test,predictions))

import random
random.seed(101)
random_ind = random.randint(0,len(df))

new_customer = df.drop('loan_repaid',axis=1).iloc[random_ind]
new_customer

new_customer.values

# CODE HERE
model.predict_classes(new_customer.values.reshape(1,78))

df.iloc[random_ind]['loan_repaid']