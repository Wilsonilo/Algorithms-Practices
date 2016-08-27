//Using the lagorithm of Wayne Bishop, i just cleaned up
// from Swift 1.2 to 2 and i'm still trying to understand line 15.
// Update on 10/27/16: Using the approach by Matthijs Hollemans on:
// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Insertion%20Sort

//I found the loop for "clean" like this: while y > 0 && temp < a[y - 1] {


import UIKit

func insertionSort(numberList: Array<Int>) -> Array<Int> {
    
    var y, key : Int
    var numberList = numberList
    
    for x in 0..<numberList.count {
        
        //obtain a key to be evaluated
        key = numberList[x]
        //iterate backwards through the sorted portion
        for (y = x; y > -1; y -= 1) {
            
            print(y)
            
            if (key < numberList[y]) {
                //remove item from original position
                numberList.removeAtIndex(y + 1)
                //insert the number at the key position
                numberList.insert(key, atIndex: y)
                print(key)
            }
            
        }
    } //end for
    return numberList
} //end function

var numberList : Array<Int> = [10, 2, 3, 4, 1, 6, 7, 8, 9, 8]
insertionSort(numberList)



//Application by Matthijs Hollemans
//There is a better approach without Swaping, but i do not care for now using this one.
//For my level of understanding is enough otherwise i feel my head will explode.
func insertionSortNew(array: [Int]) -> [Int] {
    var a = array                             // Set Array
    for x in 1..<a.count {                    // Loop based on count
        var y = x
        while y > 0 && a[y] < a[y - 1] {      // Swap based on index and prev index
            swap(&a[y - 1], &a[y])
            y -= 1
        }
    }
    return a
}

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
insertionSortNew(list)