#!/usr/bin/env python
# NAME: Elijah Morris
# ASGT: Activity 7
# ORGN: CSUB - CMPS 3500
# FILE: transfersize.py
# DATE: 4/21/2022

#Generator function for finding the row total in the file
def getRowTotal():
    f = open("access.log", "r")
    #Loop the file, yielding each line to count the rows
    for line in f:
        yield line
    f.close()

#Generator function for finding the column total in the file
def getColumnTotal():
    f = open("access.log", "r")
    #Loop the file's rows 
    for line in f:
        #Split the row where there is a space
        row = line.split(" ")
        #Loop through the row to count how many columns there are 
        for column in row:
            yield column
    f.close()

#Generator function for finding the byte total in the file
def getByteTotal():
    f = open("access.log", "r")
    #Loop through each row in the file
    for line in f:
        #Try to split the lines where there is a double quote, then split the row
        #where the target column is and get the size from the column
        try:
            row = line.split("\"")
            column = row[2].split()
            size = column[1]
            yield size
        #Exception in case a line is formatted differently. Split at the status number that comes 
        #right before the byte size and then get the size 
        except:
            column = row[0].partition("400")
            tmp = column[2].split(" ")
            size = tmp[1]
            yield size
    f.close()

#Initialize variables
totalRows = 0
totalColumns = 0
totalSize = 0

#Count the rows as they get yielded 
for rows in getRowTotal():
    totalRows += 1

#Count the columns as they get yielded 
for columns in getColumnTotal():
    totalColumns += 1

#Count the byte size as they get yielded 
for size in getByteTotal():
    totalSize += int(size)

#Output
print("Total number of rows: %i" % totalRows)
print("Total number of columns: %i" % totalColumns)
print("Total byte count: %i" % totalSize)
