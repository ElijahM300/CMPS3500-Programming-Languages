#!/usr/bin/env ruby
######################################
#NAME: Elijah Morris
#ASGT: Activity 6
#ORGN: CSUB - CMPS 3500
#FILE: act06.rb
#DATE: 4/2/2022
######################################

# Enable tail-call optimization here
RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

#Defining helper to implement a Tail-Call Recursive Implementation
def fibonacci_helper( a, b, count )
    if count == 0
      a
    else
      fibonacci_helper( b, a + b , count - 1 )
    end
end

def fibonacci_tailrec( n )
    fibonacci_helper( 0, 1, n )
end

#Defining fibonacci (Binet,s implementation) method
def fibonacci_binnet(n)
    #Binets Formula
    sqrt5 = Math.sqrt(5); 
    fibonacci_binnet = ( ((1 + sqrt5)**n) - ((1  - sqrt5)**n) ) / ((2**n) * sqrt5)
end

def fibonacci_rec(n)
    #If n is 1, output 1
    if n == 1
        1
    #If n is 2, output 1	
    elsif n == 2
        1
    #If n > 2, the output will be the sum the previous two values
    else
        fibonacci_rec(n-1) + fibonacci_rec(n-2) 
    end
end

#cache first two values of the sequence
@cache = {}; @cache[1] = 1; @cache[2] = 1 

#Defining fibonacci (Cached Recursive Implementation) method
def fibonacci_cached(n)
	#fibonacci sequence constructor 
	@cache[n] ||= fibonacci_cached(n-1) + fibonacci_cached(n-2)
end

#Function for determining up to what fib number Binnet's formula is accurate
def binet_accuracy()
    #Test the first 100 fib numbers 
    for n in 1..100 do
        #The error is determined by taking the abs value of 
        #Binnet recursion - tail recursion 
        error = (fibonacci_binnet(n).round() - fibonacci_tailrec(n))
        error.abs()
        #If the error is not 0, return the fib number where Binnet's formula  
        #is no longer accurate
        if error != 0
            return n
        end
    end 
end

#Function for determining which function is the fastest for finding 
#the sum of the first 25 fib numbers
def fib_fastest()
    #sum variables 
    rec_sum = 0
    cached_sum = 0
    tailrec_sum = 0

    #start the clock and find the sum using regular recursion
    starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    for n in 1..25
        rec_sum += fibonacci_rec(n)
    end
    #end the clock and find the time
    ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    rec_time = ending - starting
    puts "The sum of the first 25 Fibonacci numbers calculated by fibonacci_rec.rb is: #{rec_sum}"
    puts "Execution time: #{rec_time} seconds."
    puts ""

    #start the clock and find the sum using cached recursion
    starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    for n in 1..25
        cached_sum += fibonacci_cached(n)
    end
    #end the clock and find the time
    ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    cached_time = ending - starting
    puts "The sum of the first 25 Fibonacci numbers calculated by fibonacci_cached.rb is: #{cached_sum}"
    puts "Execution time: #{cached_time} seconds."
    puts ""

    #start the clock and find the sum using tail recursion
    starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    for n in 1..25
        tailrec_sum += fibonacci_tailrec(n)
    end
    #end the clock and find the time
    ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    tailrec_time = ending - starting
    puts "The sum of the first 25 Fibonacci numbers calculated by fibonacci_tailrec.rb is: #{tailrec_sum}"
    puts "Execution time: #{tailrec_time} seconds."
    puts ""

    #If the regular recursion function time is less than the other 
    #two, it's the fastest
    if rec_time < cached_time && rec_time < tailrec_time
        return "fibonacci_rec.rb"
    #Else if the cached recursion function time is less than the other 
    #two, it's the fastest
    elsif cached_time < rec_sum && cached_time < tailrec_time
        return "fibonacci_cached.rb"
    #Else, the tail recursion function is the fastest
    else
        return "fibonacci_tailrec.rb"
    end
end

#Recursive Function for QuickSort
#QuickSort algorith sorts in in O(n * lg(n)) time
def quicksort(array, from=0, to=nil)
    if to == nil
        # Sort the whole array, by default
        to = array.count - 1
    end

    if from >= to
        # Done sorting
        return
    end

    # Take a pivot value, at the far left
    pivot = array[from]

    # Min and Max pointers
    min = from
    max = to

    # Current free slot
    free = min

    while min < max
        if free == min # Evaluate array[max]
            if array[max] <= pivot # Smaller than pivot, must move
                array[free] = array[max]
                min += 1
                free = max
            else
                max -= 1
            end
        elsif free == max # Evaluate array[min]
            if array[min] >= pivot # Bigger than pivot, must move
                array[free] = array[min]
                max -= 1
                free = min
            else
                min += 1
            end
        else
            raise "Inconsistent state"
        end
    end

    array[free] = pivot

    quicksort array, from, free - 1
    quicksort array, free + 1, to
end

#Partition function for tail recursive quicksort 
def partition(array, min, max) 
    pivot = array[max]
    i = min - 1

    #Loop through the array, swapping values if they're less than the pivot
    for j in min..max - 1 do
        if array[j] <= pivot
            i += 1
            tmp = array[i]
            array[i] = array[j] 
            array[j] = tmp
        end
    end

    #Swap the element at array[i + 1] with the max element 
    tmp = array[i + 1]
    array[i + 1] = array[max]
    array[max] = tmp
    return i + 1 
end 


#Tail Recursive Helper Function for QuickSort
#QuickSort algorith sorts in in O(n * lg(n)) time
def quicksort_helper(array, min, max)
    while min < max  
        pivot = partition(array, min, max)

        #If pivot - min is less than max - pivot, do a recursive call 
        #with the max being pivot - 1
        if (pivot - min < max - pivot)
            quicksort_helper(array, min, pivot - 1)
            min = pivot + 1
        #Else, do a recursive call with the min being pivot + 1
        else 
            quicksort_helper(array, pivot + 1, max)
            max = pivot - 1 
        end
    end
end

#Tail Recursive Quicksort Function
def quicksort_tailrec(array) 
    quicksort_helper(array, 0, array.count - 1) 
end 

#Function for reading in files to an array
def readFile(list, file) 
    #read the lines from a file into an array
    array = IO.readlines(file)
    #convert the elements in the array to integer 
    list = array.map(&:to_i)
    return list 
end 

#Output 
puts "Part 1:"
puts "*******"
puts "Ruby's implementation of Binet's formula is accurate until n = #{binet_accuracy()}"
puts ""
puts "Part 2:"
puts "*******"
fastest = fib_fastest()
puts "The fastest algorithm is: #{fastest}"
puts ""
puts "Part 3:"
puts "*******"
#Read in the files for both list arrays
list1 = readFile(list1, "list1.txt")
list2 = readFile(list2, "list2.txt")

#Sort list 1 and record how long it takes with regular quicksort
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
quicksort list1
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
list1_time = ending - starting

#Sort list 2 and record how long it takes with regular quicksort
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
quicksort list2
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
list2_time = ending - starting

#Read in the files again so both lists are unsorted 
list1 = readFile(list1, "list1.txt")
list2 = readFile(list2, "list2.txt")

#Sort list 1 and record how long it takes with tail recursion quicksort
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
quicksort_tailrec list1
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
list1_tailrec_time = ending - starting

#Sort list 1 and record how long it takes with tail recursion quicksort
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
quicksort_tailrec list2
ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
list2_tailrec_time = ending - starting

puts "             Time to sort in seconds      Time to sort in seconds"
puts "List         Recursive QuickSort          Recursive Tail QuickSort"
puts "********     ************************     *******************************"
puts "List 1       %0.13f seconds." % [list1_time]+"     %0.13f seconds." % [list1_tailrec_time]
puts "List 2       %0.13f seconds." % [list2_time]+"     %0.13f seconds." % [list2_tailrec_time]

