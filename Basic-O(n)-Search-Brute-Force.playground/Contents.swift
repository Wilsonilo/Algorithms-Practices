//Linear Search

import UIKit

let numberList : Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

func linearSearch(key: Int) {
//check all possible values - O(n) 
    for number in numberList {
    if (number == key) {
        print("value \(key) found..")
        break
        }
    }
}

linearSearch(key: 4)

























