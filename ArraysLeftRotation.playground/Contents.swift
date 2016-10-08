//: Playground - noun: a place where people can play

import UIKit

/*
 *** SAME AS LEFT, this only changes to Right Shift
 Given an array of N integers and a number, D , perform D RIGHT rotations on the array. Then print the updated array as a single line of space-separated integers.
 */



//based on: http://stackoverflow.com/questions/33264959/swift-shift-elements-in-array-by-index by: Nate Cook

extension Array {

    func shiftRight(Rotate: Int = 1) -> [Element]{
        

        return Array(self[count - Rotate ..< count] + self[0 ..< count - Rotate])


    }
}

Array(1...10).shiftRight(Rotate: 2)
Array(["wilson", "muñoz", "sanchez", "eduardo"]).shiftRight(Rotate: 2)
