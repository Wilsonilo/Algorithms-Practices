//Mix of random functions and implementations.

import UIKit

//Recreate the sort() function using and algorith (Pending)
let animals = ["fish", "cat", "chicken", "dog"]

animals.sort()

//Rereate Equatable Algorithm in deep (Pending)
func areTheyEqual<T: Equatable>(x: T, _ y: T) -> Bool {
    return x == y
}

areTheyEqual(1, 2)


//Swap with Generics
func swapTwoValues<T>(inout a: T, inout _ b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
print(someString)