#!/data/data/com.termux/files/usr/bin/python3
import json
from datetime import datetime

# Number of lines to get the total number of dialysis done.
with open('/data/data/com.termux/files/home/Scripts/dependencies/dialysis_counts.csv', mode = 'r') as file:
    no_of_dialysis_done = len(file.readlines())
    file.seek(0,0)
    last_dialysis = file.readlines()[-1].replace('\n','').split(',')

print(f"Last Dialysis:\nDate:{last_dialysis[0]}\nDay:{last_dialysis[1]}\nNumber of dialysis done: {last_dialysis[2]}\n")

query = input("Do you want to add a new dialysis? y/n:\n")
date = f"{datetime.today().year}-{datetime.today().month}-{datetime.today().day}"
data = []

if query == 'y':
    no_of_dialysis_done = no_of_dialysis_done + 1
    data.append(date)
    data.append(datetime.now().strftime("%a"))
    data.append(no_of_dialysis_done)
    with open('/data/data/com.termux/files/home/Scripts/dependencies/dialysis_counts.csv', mode = 'a') as file:
        file.write(f"{data[0]},{data[1]},{data[2]}\n")
    print(f"Last Dialysis:\nDate:{data[0]}\nDay:{data[1]}\nNumber of dialysis done:{data[2]}\n")
