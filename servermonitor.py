#!/usr/bin/env python3

import requests
import datetime 
import ping3


Date=datetime.datetime.now()
print("date:  ",Date) 

def get_website_status(url):
  try:
    response = requests.get(url)
    return response.status_code
  except requests.exceptions.RequestException as e:
    pass
    return None

url = ["http://127.0.0.1"]   
 
for i in url :
    status_code = get_website_status(i)
    if status_code == 200 :
       print ("website ok :", i)
    else :
       print ("website nok :", i)



hosts=["127.0.0.1","192.168.1.2"]

for i in hosts:
    rrt=ping3.ping(i)
    if rrt is not None:
       print("server is running:",i)
    else:
       print("server is down:",i)
