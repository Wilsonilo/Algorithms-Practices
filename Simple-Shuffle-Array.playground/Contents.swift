//Simple Shuffle Array - by Wilson Muñoz

import UIKit


var arrayInt = (0...18).map{_ in Int(arc4random_uniform(19))}

func shuffle(elements: Array<Int>)-> Array<Int> {
    
    var finalArray = elements
    
    for i in 0..<(finalArray.count - 1) {
        let j = Int(arc4random_uniform( UInt32( finalArray.count - 1 ) ) ) + 1
        swap(&finalArray[i], &finalArray[j])
    }
    
    return finalArray
}

shuffle(arrayInt)
