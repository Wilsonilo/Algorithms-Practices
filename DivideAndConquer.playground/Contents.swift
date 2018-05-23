import UIKit
//The premise on devide on conquer is to divide in half to look for an specific number
//either to the left or to the right depending on the number we are looking.

//Start with you array of number
let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

//Ray Wender Club // https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Search
func divideAndConquer<T: Comparable>(lookFor: T, elements:[T], range: Range<Int>)-> Int? {

	//Base case, if the lower
	if range.lowerBound >= range.upperBound {
		return nil
	} else {

		//Get the index of the half of the array so we can start looking
		let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2

		//Look for maybe is on left side
		if elements[midIndex] > lookFor {
			return divideAndConquer(lookFor: lookFor, elements: elements, range: range.lowerBound ..< midIndex)

		//Maybe is on the right side
		} else if elements[midIndex] < lookFor {

			return divideAndConquer(lookFor: lookFor, elements: elements, range: midIndex + 1 ..< range.upperBound)

		} else {
			//Not found
			return midIndex
		}

	}


}


divideAndConquer(lookFor: 19, elements: numbers, range: 0..<numbers.count)



// My approach, just didn't want to use the range built in option from swift.
func divideAndConquerTwo<T: Comparable>(lookFor: T, elements: [T], lowerIndex:Int, upperIndex:Int)->Int?{
	
	if lowerIndex >= upperIndex {
		return nil
	}
	//Let's get mid
	let midIndex = lowerIndex + (upperIndex - lowerIndex) / 2
	//print(midIndex, elements[midIndex], lowerIndex, upperIndex)
	//Look on the left
	if elements[midIndex] > lookFor {
		//print("Checking on left: ", elements[lowerIndex..<midIndex])
		return divideAndConquerTwo(lookFor: lookFor, elements: elements, lowerIndex: lowerIndex, upperIndex:midIndex - 1)
	} else if elements[midIndex] < lookFor {
		//print("Checking on right: ", elements[midIndex+1..<upperIndex])
		return divideAndConquerTwo(lookFor: lookFor, elements: elements, lowerIndex:midIndex + 1, upperIndex:upperIndex)
	} else {
		return midIndex
	}

}
divideAndConquerTwo(lookFor: 19, elements: numbers, lowerIndex:0, upperIndex: numbers.count-1)
