import json

# Opening the file
with open('dependencies/sms_list.json', mode = 'r', encoding = 'utf8') as file:
    mylist = file.read()
my_list = mylist.replace('\n', '')
my_list = my_list.replace('\\n', '')

# Cleaning text to make python objects and 
# Making a list of dictionaries.
broken_dict = my_list.split('},')
new_dict_list = []
for i in broken_dict:
    new_dict_list.append(i+'}')
new_dict_list[-1] = new_dict_list[-1].replace('}}', '}')

dict_list = []
for i in new_dict_list:
    dict_list.append(json.loads(i))

# Importing old list ID's
with open('dependencies/sms_list_id.txt', mode = 'r') as file:
    old_list_id = file.read()
old_list_id = old_list_id.split(',')

# Adds the read message ID to list_id
# Every cash in goes into an individual_dict first
# Then goes into list_csv and individual_dict is replaced with another dict.
list_id = []
list_csv = []
individual_dict = []

# Does the job.
for dictionary in dict_list:
    if dictionary['number'] == 'bKash':
        if dictionary['_id'] not in old_list_id:
            list_id.append(str(dictionary['_id'])) #If it's read, then no need to read it again.
            if (dictionary['body'][0:17] == "You have received"):
                if (dictionary['body'][18:25] == "deposit"): #iBanking
                    individual_dict.append(dictionary['received'].split()[0])
                    individual_dict.append(dictionary['received'].split()[1])
                    individual_dict.append(dictionary['body'].split()[8].replace(',', ''))
                    list_csv.append(individual_dict)
                    individual_dict = []
                else: #Send Money
                    individual_dict.append(dictionary['received'].split()[0])
                    individual_dict.append(dictionary['received'].split()[1])
                    individual_dict.append(dictionary['body'].split()[4].replace(',', ''))
                    list_csv.append(individual_dict)
                    individual_dict = []
            elif dictionary['body'][0:7] == 'Cash In': #Cash in
                individual_dict.append(dictionary['received'].split()[0])
                individual_dict.append(dictionary['received'].split()[1])
                individual_dict.append(dictionary['body'].split()[3].replace(',', ''))
                list_csv.append(individual_dict)
                individual_dict = []   

# Write to the main table:
with open('dependencies/bkash_received_data.csv', mode = 'a') as outfile:
    for i in list_csv:
        outfile.write(f"{','.join(i)}\n")

# Write the new list ID's to the main list ID file.
with open('dependencies/sms_list_id.txt', mode = 'a') as file:
    file.write(",".join(list_id))
