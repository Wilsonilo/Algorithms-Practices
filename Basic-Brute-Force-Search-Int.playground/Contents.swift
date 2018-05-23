// Binary Search
// By Wilson Muñoz

//import UIKit
import Foundation

var numberList : Array<Int> = [10, 2, 3, 4, 1, 6, 7, 8, 9, 8]

func binarySearch(key: Int, imin: Int, imax: Int) {
    
    let midIndex : Double = round(Double((imin + imax) / 2))
    let midNumber = numberList[Int(midIndex)]
    
    //reduce the range
    if midNumber > key {
        binarySearch(key: key, imin: imin, imax: Int(midIndex) - 1)
    }
    //increase the range
    else if (midNumber < key ) {
        binarySearch(key: key, imin: Int(midIndex) + 1, imax: imax)
    }
    else {
        print("value \(key) found..")
        return
    }
}
let max = numberList.count
binarySearch(key: 9, imin: 1, imax: 10)
