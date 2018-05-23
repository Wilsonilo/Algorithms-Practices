// Get an Array with all the Max Numbers of all the passing arrays by Wilson Muñoz

import UIKit

let stringOfArrays = [[4, 5, 1, 3], [13, 27, 18, 26], [32, 35, 37, 39], [1000, 1001, 857, 1]]

func arrayOrder(array: Array<Array<Int>>)-> Array<Int>{
    var finalArray:Array<Int> = []
    for arrayInt in array{
        let maxnumber = arrayInt.max()
        finalArray.append(maxnumber!)
    }
    
    return finalArray
}

arrayOrder(array: stringOfArrays)
