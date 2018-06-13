
# coding: utf-8

# In[1]:


import os


# ## Comprehension Tests

# ### Setup & Import

# In[2]:


import pandas as pd
source_dir=os.path.join('..','sourcedata','qualtrics','comprehension')


# In[ ]:


frame=pd.DataFrame()
for file in os.listdir(source_dir):
    df = pd.read_csv(os.path.join(source_dir,file))
    df['version']=os.path.basename(file)[:2]
    frame=frame.append(df)


# ### Filter & Sort

# In[ ]:


frame=frame[frame['Finished']=='True']
frame=frame.rename(columns={'Q9':'ssid','SC0':'score'})
frame['ssid']=frame['ssid']+'\t'


# In[ ]:


columns=[
    'ssid','version','score',
    '1a','2a','3c','4b','5a','6b','7a','8a','9c',
    '10a','11b','12c','13a','14a','15c','16b','17a',
    '1c','2b','3a','4a','5c','6a','7c','8c','9a',
    '10b','11a','12a','13b','14c','15a','16a','17c'
]


# In[ ]:


frame=frame.sort_values(['ssid','version'])[columns].set_index('ssid')


# ### Output

# In[ ]:


derivs_dir=os.path.join('..','derivatives')
try:os.mkdir(derivs_dir)
except OSError as e:
    print(e)


# In[ ]:


frame.to_csv(os.path.join(derivs_dir,'sub-all_task-comp_beh.csv'))


# ## Survey Blocks

# ### Import

# In[3]:


source_dir = os.path.join(source_dir,'..','surveys')


# In[43]:


frames = []
for file in os.listdir(source_dir):
    df = pd.read_csv(os.path.join(source_dir,file))
    df = df[df['Finished'] == 'True']
    df['SSID'] = df['SSID']+'\t'
    frames.append(df)

