#!/usr/bin/env ruby
##CMPS 3500
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

#Defining an array to sort
nums = Array.[](11, 2, 3, 14, 5, 17, 1, 13, 4, 1, 3)


# Quicksort operates inplace (i.e. in "a" itself)
# There's no need to reassign
quicksort nums
puts("the sorted list using quicksort is:")
puts(nums)
