// Quick sort in C++

#include <iostream>
#include <time.h>
//#include "papito.h"
using namespace std;

#define DATA_SIZE 999999

// function to swap elements
void swap(int *a, int *b) {
  int t = *a;
  *a = *b;
  *b = t;
}

// function to print the array
void printArray(int array[], int size) {
  int i;
  for (i = 0; i < size; i++)
    cout << array[i] << " ";
  cout << endl;
}

// function to rearrange array (find the partition point)
int partition(int array[], int low, int high) {
    
  // select the rightmost element as pivot
  int pivot = array[high];
  
  // pointer for greater element
  int i = (low - 1);

  // traverse each element of the array
  // compare them with the pivot
  for (int j = low; j < high; j++) {
    if (array[j] <= pivot) {
        
      // if element smaller than pivot is found
      // swap it with the greater element pointed by i
      i++;
      
      // swap element at i with element at j
      swap(&array[i], &array[j]);
    }
  }
  
  // swap pivot with the greater element at i
  swap(&array[i + 1], &array[high]);
  
  // return the partition point
  return (i + 1);
}

void quickSort(int array[], int low, int high) {
  if (low < high) {
      
    // find the pivot element such that
    // elements smaller than pivot are on left of pivot
    // elements greater than pivot are on righ of pivot
    int pi = partition(array, low, high);

    // recursive call on the left of pivot
    quickSort(array, low, pi - 1);

    // recursive call on the right of pivot
    quickSort(array, pi + 1, high);
  }
}

// call this function to start a nanosecond-resolution timer
struct timespec timer_start(){
    struct timespec start_time;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
    return start_time;
}

// call this function to end a timer, returning nanoseconds elapsed as a long
long timer_end(struct timespec start_time){
    struct timespec end_time;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);
    long diffInNanos = (end_time.tv_sec - start_time.tv_sec) * (long)1e9 + (end_time.tv_nsec - start_time.tv_nsec);
    return diffInNanos;
}

// Driver code
int main() {
  //papito_init();
  int data[DATA_SIZE];

  srand(time(NULL));

  cout << "Generating data..." << endl;
    
  for (int i = 0; i < DATA_SIZE; i++) {
    data[i] = rand();
  }
  

  struct timespec start_time = timer_start();

  //cout << "Unsorted Array: \n";
  //printArray(data, DATA_SIZE);
  
  // perform quicksort on data
  //papito_start();
  quickSort(data, 0, DATA_SIZE - 1);
  //papito_end();
  //cout << "Sorted array in ascending order: \n";
  //printArray(data, DATA_SIZE);

  long time_taken = timer_end(start_time);

  cout << "Sorting " << DATA_SIZE << " elements took " << time_taken << " ns" << endl;

  for (int i = 0; i < DATA_SIZE - 1; i++) {
    if(data[i] > data[i + 1]) {
      cout << "Data consistency check failed!" << endl;
      return -1;
    }
  }

  return 0;
}
