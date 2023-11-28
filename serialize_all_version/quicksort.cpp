// Quick sort in C++

#include <iostream>
//#include "papito.h"
using namespace std;

void __attribute__((always_inline)) inline serialize(void) {
    asm (  
  "serialize\n\t");
}

// function to swap elements
void swap(int *a, int *b) {
  serialize();
  int t = *a;
  *a = *b;
  *b = t;
}

// function to print the array
void printArray(int array[], int size) {
  int i;
  serialize();
  for (i = 0; i < size; i++)
    cout << array[i] << " ";

  serialize();
  cout << endl;
}

// function to rearrange array (find the partition point)
int partition(int array[], int low, int high) {
    
  // select the rightmost element as pivot
  int pivot = array[high];
  serialize();
  
  // pointer for greater element
  int i = (low - 1);
  serialize();

  // traverse each element of the array
  // compare them with the pivot
  for (int j = low; j < high; j++) { 
    serialize();
    if (array[j] <= pivot) {
        
      // if element smaller than pivot is found
      // swap it with the greater element pointed by i
      i++;
      
      // swap element at i with element at j
      serialize();
      swap(&array[i], &array[j]);
    }
  }
  
  // swap pivot with the greater element at i
  serialize();
  swap(&array[i + 1], &array[high]);
  
  // return the partition point
  serialize();
  return (i + 1);
}

void quickSort(int array[], int low, int high) {
  serialize();
  if (low < high) {
      
    // find the pivot element such that
    // elements smaller than pivot are on left of pivot
    // elements greater than pivot are on righ of pivot
    serialize();
    int pi = partition(array, low, high);

    // recursive call on the left of pivot
    serialize();
    quickSort(array, low, pi - 1);

    // recursive call on the right of pivot
    serialize();
    quickSort(array, pi + 1, high);
  }
}

// Driver code
int main() {
  //papito_init();
  int data[] = {8, 7, 6, 1, 0, 9, 2};
  serialize();
  int n = sizeof(data) / sizeof(data[0]);
  serialize();  

  
  cout << "Unsorted Array: \n";
  serialize();
  printArray(data, n);
  serialize();

  // perform quicksort on data
  //papito_start();
  serialize();
  quickSort(data, 0, n - 1);
  serialize();
  //papito_end();
  cout << "Sorted array in ascending order: \n";
  serialize();
  printArray(data, n);
}
