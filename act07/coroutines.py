#!/usr/bin/env python
# CMPS 3500
# demonstrate coroutines in Python 

"""
+  implements a typical producer/consumer algorithm 
+  the consumer is a subroutine and main() is the producer
+  producer sends a job request to consumer; waits for consumer to receive it
+  the consumer waits for job request, does job, waits again
+  keywords: 
+  yield waits on producer - passes argument to producer at handoff
+  next() sends job to consumer w/o msg
+  send() sends job to consumer with msg 
"""

import sys

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

   print "\nNo jobs left to do!\n" 

def producer(jobs):
   print("Producer started.")
   con = consumer(jobs)               # start the consumer
   print("Consumer started.") 

   buf = "Initial job list (" + str(len(jobs)) + "): "
   sys.stdout.write(buf)
   for i in range(len(jobs)): 
      printjob(con.next())            # next sends job to consumer w/ no msg 

   printjob(con.send(("add", "iron", 44)))  # send sends job to consumer w/ msg
   sys.stdout.write("\n")
   for i in range(len(jobs)): 
      printjob(con.next())               

   printjob(con.send(("add", "mend", 55)))   
   sys.stdout.write("\n")
   for i in range(len(jobs)): 
      printjob(con.next())               

   con.send(("remove","fold", 33))         
   for i in range(len(jobs)): 
      printjob(con.next())

   con.send(("remove","wash", 11))
   for i in range(len(jobs)): 
      printjob(con.next())

   print "\nProducer Done." 

"""
+ MAIN 
+ acts as the producer coroutine
+ next passes a job to the consumer with no message passing
+ send passes a job to the consumer with a message 
"""
if __name__ == "__main__":             # this means initialize once only

   jobs = [("wash", 11),("dry", 22),("fold", 33)]        # mutable list
   producer(jobs)

   
