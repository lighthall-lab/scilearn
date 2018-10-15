
# coding: utf-8

# In[1]:

from os.path import join
from requests import request
from time import sleep
import zipfile, io, os, pandas as pd


# In[2]:


debug = False


# # Setting user & survey parameters
# Assumes user has api token generated and stored in text file at 'U:\keys\qualtrics-api-token.txt'
# 
# List as many or as few qualtrics survey IDs as needed in surveyIdList
# 
# Currently requires re-executing the script for each survey, as the zipfile extract fails out once per survey. I do not understand the zipfile functionality enough to troubleshoot at the moment.

# In[3]:


apiToken = open(join('u:\\','keys','qualtrics-api-token.txt'),'r').read()
surveyIdList = list(filter(None,open('0.1.qualtrics-request-list.txt').read().split('\n')))
fileFormat = "csv"
dataCenter = 'ca1'
output_dir = os.path.join('..','sourcedata','qualtrics')


# # Setting static parameters

# In[4]:


requestCheckProgress = 0
progressStatus = "in progress"
baseUrl = "https://{0}.qualtrics.com/API/v3/responseexports/".format(dataCenter)
headers = {
    "content-type": "application/json",
    "x-api-token": apiToken,
    }


# # Executing Request
# If executing in Jupyter, this is the cell that will throw an error for each survey.
# 
# Simply re-execute until it stops throwing errors...

# In[5]:


i=1
for surveyId in surveyIdList:
    print('survey {} of {}'.format(i,len(surveyIdList)));i+=1
    print('surveyId',surveyId)
    
    # Step 1: Creating Data Export
    downloadRequestUrl = baseUrl
    downloadRequestPayload = '{"format":"' + fileFormat + '","surveyId":"' + surveyId + '"}'
    downloadRequestResponse = request("POST", downloadRequestUrl, data=downloadRequestPayload, headers=headers)
    progressId = downloadRequestResponse.json()["result"]["id"]
    
    if debug == True:
        print('downloadRequestUrl',downloadRequestUrl)
        print('downloadRequestPayload',downloadRequestPayload)
        print('downloadRequestResponse',downloadRequestResponse)
        print('progressId',progressId)
    
    # Step 2: Checking on Data Export Progress and waiting until export is ready
    while requestCheckProgress < 99 and progressStatus is not "complete":
        requestCheckUrl = baseUrl + progressId
        requestCheckResponse = request("GET", requestCheckUrl, headers=headers)
        requestCheckProgress = requestCheckResponse.json()["result"]["percentComplete"]
        print("Download is " + str(requestCheckProgress) + "% complete")
    print("Download is " + str(requestCheckProgress) + "% complete")
    
    if debug == True:
        print('requestCheckUrl',requestCheckUrl)
        print('requestCheckResponse',requestCheckResponse)
        print('requestCheckProgress',requestCheckProgress)
        
    # Step 3: Downloading file
    requestDownloadUrl = baseUrl + progressId + '/file'
    sleep(2)
    requestDownload = request("GET", requestDownloadUrl, headers=headers, stream=True)
        
    if debug == True:
        print('requestDownloadUrl',requestDownloadUrl)
        print('requestDownload',requestDownload)
    
    # Step 4: Unzipping the file
    zipfile.ZipFile(io.BytesIO(requestDownload.content)).extractall(output_dir)


# # Read outputs, clean and re-write

# In[6]:


columns_to_drop=[
    'StartDate','EndDate','Status','IPAddress','Finished',
    'RecipientLastName','RecipientFirstName','RecipientEmail',
    'LocationLatitude','LocationLongitude','LocationAccuracy',
    'ResponseID','ResponseSet','ExternalDataReference',
    'Score-weightedAvg','Score-weightedStdDev'
]


# In[7]:


for f in os.listdir(output_dir):
    fpath = os.path.join(output_dir,f)
    if os.path.isfile(fpath):
        print('cleaning {}'.format(fpath))
        df = pd.read_csv(fpath)
        df = df[df['Finished'] == '1']
        df = df[[
            c for c in df.columns
            if not c.startswith('DO-')
            and not c.startswith('RO-')
            and not c in columns_to_drop
        ]]
        df.to_csv(fpath,index=False)
        print('done')
input('all done!')

