/************************************************************/
/* NAME: Elijah Morris */
/* ASGT: Activity 1 */
/* ORGN: CSUB - CMPS 3500 */
/* FILE: good.cpp */
/* DATE: 02/11/2022 */
/************************************************************/

#include <bits/stdc++.h>
using namespace std;

//Binary search function that uses recursion
int binarySearch(int arr[], int left, int right, int element)
{
    //If the right side is bigger than the left side, set the middle
    if (right >= left) {
        //Middle of array
        int middle = left + (right - left) / 2;
        //If the array is in the middle, return the element
        if (arr[middle] == element)
            return middle;
        //If the element is smaller than the middle value, search only the left side
        if (arr[middle] > element)
            return binarySearch(arr, left, middle - 1, element);
        //If the element is greater than the middle value, search only the right side 
        return binarySearch(arr, middle + 1, right, element);
    } 
    
    //Value was not found
    return -1;
}

int main(void)
{
    //Variables to be used
    int arr[] = { 2, 3, 4, 10, 40 };
    int element = 10;
    int size = sizeof(arr) / sizeof(arr[0]);
    int result = binarySearch(arr, 0, size - 1, element);

    //If the result returns false, print that the element is not in the array,
    //else, print that the element was found 
    (result == -1) 
    ? cout << "Element is not present in array \n"
    : cout << "Element is present at index \n" << result;

    return 0;
}
