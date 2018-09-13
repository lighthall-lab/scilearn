
# coding: utf-8

# In[72]:


import os
import pandas as pd


# In[79]:


source_dir=os.path.join('..','sourcedata','qualtrics','comprehension')
derivs_dir=os.path.join('..','derivatives')

frame=pd.DataFrame()
for file in os.listdir(source_dir):
    df = pd.read_csv(os.path.join(source_dir,file))
    df['time']=os.path.basename(file)[14]
    frame=frame.append(df)


# # Filter & Sort

# In[80]:


frame=frame[frame['Finished']=='1']
frame=frame.rename(columns={'SC0':'score'})
frame.head()


# In[81]:


columns_to_drop=[
    'StartDate','EndDate','Status','IPAddress','Progress','Duration (in seconds)','Finished',
    'RecordedDate','ResponseId','RecipientLastName','RecipientFirstName','RecipientEmail',
    'ExternalReference','LocationLatitude','LocationLongitude','DistributionChannel','UserLanguage'
]
frame=frame.drop(columns=columns_to_drop)
frame.head()


# In[95]:


frame=frame.sort_values(['SSID','time']).set_index(['SSID','time'])
frame.head()


# # Output

# In[98]:


frame.to_csv(os.path.join(derivs_dir,'sub-all_task-comp_beh.csv'))


# 
# # ## Survey Blocks
# # ### Import
# 

# In[ ]:


source_dir = os.path.join(source_dir,'..','surveys')

frames = []
for file in os.listdir(source_dir):
    df = pd.read_csv(os.path.join(source_dir,file))
    df = df[df['Finished'] == 'True']
    df['SSID'] = df['SSID']+'\t'
    frames.append(df)

import os## Comprehension Tests### Setup & Importimport pandas as pd
source_dir=os.path.join('..','sourcedata','qualtrics','comprehension')frame=pd.DataFrame()
for file in os.listdir(source_dir):
    df = pd.read_csv(os.path.join(source_dir,file))
    df['version']=os.path.basename(file)[:2]
    frame=frame.append(df)### Filter & Sortframe=frame[frame['Finished']=='1']
frame=frame.rename(columns={'Q9':'ssid','SC0':'score'})
frame['ssid']=frame['ssid']+'\t'columns=[
    'ssid','version','score',
    '1a','2a','3c','4b','5a','6b','7a','8a','9c',
    '10a','11b','12c','13a','14a','15c','16b','17a',
    '1c','2b','3a','4a','5c','6a','7c','8c','9a',
    '10b','11a','12a','13b','14c','15a','16a','17c'
]frame=frame.sort_values(['ssid','version'])[columns].set_index('ssid')### Outputderivs_dir=os.path.join('..','derivatives')
try:os.mkdir(derivs_dir)
except OSError as e:
    print(e)frame.to_csv(os.path.join(derivs_dir,'sub-all_task-comp_beh.csv'))## Survey Blocks### Importsource_dir = os.path.join(source_dir,'..','surveys')frames = []
for file in os.listdir(source_dir):
    df = pd.read_csv(os.path.join(source_dir,file))
    df = df[df['Finished'] == 'True']
    df['SSID'] = df['SSID']+'\t'
    frames.append(df)