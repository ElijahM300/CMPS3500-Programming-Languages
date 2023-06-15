# NAME: Elijah Morris
# ASGT: Activity 9
# ORGN: CSUB - CMPS 3500
# FILE: stack.py
# DATE: 5/17/2022

#CMPS 3500
#########################
#  Basic State Simulator
#########################

print("***********************************")
print("          Stack Simulator          ")
print("***********************************")
print("Please only use digits from 0 to 9 ")
print("***********************************")
print("Please enter 'pop' for popping")
print("Please enter 'push' for pushing")
print("Please enter 'print' to print")
print("Please enter 'end' to terminate the program")
stack = [] #make a list named 'stack'
while (True):
    val = input("...") #get input from the user
    if  (val == 'push'):
        while True: #To check if the input is a number or not
 
            a = input("Which number to push?... ")

            try:
                if( 48 <= ord(a) <= 57): #check ascii code for digits
                    stack.append(a)  #push the number
                    break
            # if the input is a number, terminate the nested while loop,
            except Exception:
                print("Please enter only 1 digit numbers")
            
            
    elif( val =='pop'):
        try: 
            print(stack.pop()) #pop, ie. remove and return
        except Exception:
            print("Can't pop from an empty list ")
    elif( val =='print'):
        print(stack) #print the list
    elif( val =='end'):
        break  #terminate the while loop
    else:
        print("Unknown command ")
print("Thank you") 