//Using the lagorithm of Wayne Bishop, i just cleaned up
// from Swift 1.2 to 2 and i'm still trying to understand line 15.

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