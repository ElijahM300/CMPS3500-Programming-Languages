#!/usr/bin/env python
# NAME: Elijah Morris
# ASGT: Activity 7
# ORGN: CSUB - CMPS 3500
# FILE: transfersize.py
# DATE: 4/21/2022
"""
CMPS 3500 act07

Execute with:

    ./act07.py act07.data

act07.data is structured like this:

      10
      15
      20
      0
      17
"""

import sys
from sys import argv

"""  
my_map takes a function and a list, and returns the result of the
function applied to the every element in the list; e.g.,

    my_map(lambda x: x + 1, [1, 2, 3]) 

returns [2, 3, 4]
"""
#my_map function for taking in a function as an argument 
#and returning a new list with modified values
def my_map(func, list):
  new_list = []
  for item in list:
    new_list.append(func(item))
  return new_list

#my_mean function for taking in a function as an argument
#and returning the mean of a list while ignoring 0 values 
def my_mean(func, list):
  sum = 0.0
  count = 0.0
  #Loop through the list to see if the value is above 0, if so
  #add it to the sum 
  for item in list:
    if(func(item)):
      sum += int(item)
    count += 1
  mean = sum / count
  return mean

#my_filter function that takes in a function as an argument and returns
#a new list of only even numbers 
def my_filter(func, list):
  new_list = []
  #Loop through the list to see if the value is even, if so
  #append it to the new list
  for item in list:
    if(func(item)):
      new_list.append(item)
  return new_list

#Function for printing the requested job 
def printjob(items):
  print(','.join(str(item) for item in items)),

"""
+  CONSUMER 
+  'yield stuff' passes stuff back to the producer; when control resumes a 
+  message (it may be empty) is available from the producer as the return 
+  value from yield; note: cannot remove everything from the list since
+  the dereference to jobs[i] in yield is invalid
"""
def consumer(jobs):
  i = -1 

  # as long as something is in the jobs list keep processing requests
  while jobs:
    i = (i + 1) % len(jobs)
    # yield passes control back to producer with the ith job name
    getRequest = yield jobs[i]    # waits for request from producer

    if getRequest:    # if getRequest is not empty process it
      request, name, id = getRequest
      if request == "add":
        jobs.append((name, id))
        print("\nADD "),
      elif request == "remove" and (name, id) in jobs:
        jobs.remove((name, id))
        buf = "\nREMOVE " + name + "," + str(id) + "\n"
        print(buf),

  print ("\nNo jobs left to do!\n") 

#Producer function to add or remove jobs from the 2-tuple and send it
#to the consumer function
def producer(jobs, n):
  print("Producer started.")
  con = consumer(jobs)           # start the consumer
  print("Consumer started.") 

  buf = "Initial job list (" + str(len(jobs)) + "): "
  sys.stdout.write(buf)
  for i in range(len(jobs)): 
    printjob(con.next())         # next sends job to consumer w/ no msg 

  printjob(con.send(("add", "iron", 44 + n)))  # send sends job to consumer w/ msg
  sys.stdout.write("\n")
  for i in range(len(jobs)): 
    printjob(con.next())               

  printjob(con.send(("add", "mend", 55 + n)))   
  sys.stdout.write("\n")
  for i in range(len(jobs)): 
    printjob(con.next())               

  con.send(("remove","fold", 33 + n))         
  for i in range(len(jobs)): 
    printjob(con.next())

  con.send(("remove","wash", 11 + n))
  for i in range(len(jobs)): 
    printjob(con.next())

  print ("\nProducer Done.") 


"""
+ MAIN 
+ acts as the producer coroutine
+ next passes a job to the consumer with no message passing
+ send passes a job to the consumer with a message 
"""
if __name__ == "__main__":             # this means initialize once only
  #If the user enters less than 3 arguments, show usage statement
  if len(argv) < 3:
    print("Usage: %s <filename> <id>" % argv[0])
  #Else, run part 2 and 3 
  else: 
    input = file(argv[1])
    n = int(argv[2])
    values = []
    for line in input:
      values.append(int(line))

    #PART 2
    print("Part 2")
    print("********************")
    #Print the original list
    print("original list: "), 
    print(values) 
    #Square all the values of the list
    squared = my_map(lambda x: x * x, values)
    print("squared: "),
    print(squared)
    #Add 1 to all the values of the list
    successor = my_map(lambda x: x + 1, values)
    print("successor: "), 
    print(successor)
    #Find the mean of the list for values above 0
    mean = my_mean(lambda x: x > 0, values)
    print("mean: "), 
    print(mean)
    #Find the evens of the list
    evens = my_filter(lambda x: (x % 2) == 0, values)
    print("evens: "), 
    print(evens) 
    print(" ")

    #PART 3
    print("Part 3")
    print("********************")
    # mutable list
    jobs = [("wash", 11 + n),("dry", 22 + n),("fold", 33 + n)]        
    producer(jobs, n)
 
