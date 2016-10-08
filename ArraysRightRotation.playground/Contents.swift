//: Playground - noun: a place where people can play

import UIKit

/*
 Given an array of N integers and a number, D , perform D left rotations on the array. Then print the updated array as a single line of space-separated integers.
 */

//based on: http://stackoverflow.com/questions/33264959/swift-shift-elements-in-array-by-index by: Nate Cook

extension Array {
    
    func shiftLeft(Rotate: Int = 1) -> [Element]{
        
        print(self[0 ..< Rotate])
        
        /*
         
         We take from Array[Rotate] TO array[COUNT]
         and we append then first part Array[0] TO array Array[Rotate]
         
         */
        
        return Array(self[Rotate ..< count] + self[0 ..< Rotate])
        
        
    }
}

Array(1...10).shiftLeft(Rotate: 2)
