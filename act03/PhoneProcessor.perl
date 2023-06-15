#!/usr/bin/perl

#****************************************************************
# NAME: Elijah Morris
# ASGT: Activity 3
# ORGN: CSUB - CMPS 3500
# FILE: PhoneProcessor.perl
# DATE: 2/26/2022
#****************************************************************

# demonstrate Perl's support for regular expressions

$infile = "PhoneBook.txt";
$outfile = ">CleanPhoneBook.txt";
$correctCount = 0;
$correctTen = 0;
$droppedCount = 0;

# use '>' to overwrite existing file; use '>>' to append

open(INFILE, $infile);
open(OUTFILE, $outfile);

printf OUTFILE "%-15s %-16s %-18s %-12s %-14s %-13s\n", "First", 
               "Last", "Clean", "String", "Usable", "Formatted";
printf OUTFILE "%-15s %-16s %-18s %-12s %-14s %-13s\n", "Name", "Name", 
               "Phone Number", "Length", "Phone Number", "Phone Number";
printf OUTFILE "%-15s %-16s %-18s %-12s %-14s %-13s\n", "************", 
               "************", "****************", "******", "************", 
               "************";


printf "%-15s %-15s %-18s %-12s %-14s %-13s\n", "First", 
               "Last", "Clean", "String", "Usable", "Formatted";
printf "%-15s %-15s %-18s %-12s %-14s %-13s\n", "Name", "Name", 
               "Phone Number", "Length", "Phone Number", "Phone Number";
printf "%-15s %-15s %-18s %-12s %-14s %-13s\n", "************", 
               "************", "****************", "******", "************", 
               "************";

while(<INFILE>) {
   # remove CR or LF from $_
   chomp;                        

   #assign the default current line $_ to another string
   $line = $_;                   

   #remove '-' and returns and newlines from file
   $line =~ s/-//g;
   $line =~ s/\r//g;
   $line =~ s/\n//g;

   # split the line into 2 fields
   ($name, $phoneNumber) = split ',', $line;

   #split first name and last name
   ($firstName, $lastName) = split ' ', $name;

   #remove spaces from phone number
   $phoneNumber =~ s/ //g;
   $usablePhoneNum = $phoneNumber;

   #if-else statements to determine the length of numbers and modify them accordingly
   if(length($usablePhoneNum) == 10) {
      $strLength = 10;
      $correctTen++; 
      $correctCount++;
   }
 
   #append 661 to numbers with a length of 7
   if(length($usablePhoneNum) == 7){
      $strLength = 7;
      $correctCount++;
      $usablePhoneNum =~ s/^/661/;
   }
   #drop numbers with a length of 8 or 13
   elsif(length($usablePhoneNum) == 8 || length($usablePhoneNum) == 13){
      if(length($usablePhoneNum) == 8) {
         $strLength = 8;
      }
      else{
         $strLength = 13;
      }
      $droppedCount++;
      $usablePhoneNum =~ s/[0-9]*/Dropped/;
   }
   #replace 0 with 92 for numbers with a length of 9
   elsif(length($usablePhoneNum) == 9){
      $strLength = 9;  
      $correctCount++;
      $usablePhoneNum =~ s/^0/92/;  
   } 
   #drop the first number for numbers with a length of 11
   elsif(length($usablePhoneNum) == 11){
      $strLength = 11;
      $correctCount++;
      $usablePhoneNum =~ s/^[0-9]//;
   }
   #drop the first two numbers for numbers with a length of 12
   elsif(length($usablePhoneNum) == 12) {
      $strLength = 12;
      $correctCount++;
      $usablePhoneNum =~ s/^[0-9][0-9]//;
   }

   #if the number hasn't been dropped, format it, else, leave a blank space
   if($usablePhoneNum != "Dropped") {
      $formPhoneNum = $usablePhoneNum; 
      substr($formPhoneNum, 0, 0) = "(";
      substr($formPhoneNum, 4, 0) = ") ";
      substr($formPhoneNum, 9, 0) = " - ";
   }
   else{
      $formPhoneNum = "";
   }

   #print fields 
   printf "%-16s", $firstName;
   printf "%-16s", $lastName;
   printf "%-19s", $phoneNumber;
   printf "%-13s", $strLength; 
   printf "%-15s", $usablePhoneNum;
   printf "%-13s\n", $formPhoneNum; 

   # write all lines to the output file
   printf OUTFILE "%-15s %-16s %-18s %-12s %-14s %-13s\n", $firstName, 
                 $lastName, $phoneNumber, $strLength, $usablePhoneNum, 
                 $formPhoneNum;  
}

#print out phone number info
print "\n";
print "Phone numbers dropped: $droppedCount\n";
print "Phone numbers correctly identified: $correctCount\n";
print "Phone numbers with length 10: $correctTen\n";

close(INFILE);        
close(OUTFILE);   