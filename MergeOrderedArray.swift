/*
In order to win the prize for most cookies sold, my friend Alice and I are going to merge our Girl Scout Cookies orders and enter as one unit.

Each order is represented by an "order id" (an integer).

We have our lists of orders sorted numerically already, in arrays. Write a function to merge our arrays of orders into one sorted array.
For example:


let myArray = [3, 4, 6, 10, 11, 15]
let alicesArray = [1, 5, 8, 12, 14, 19]

print(mergeArrays(myArray, alicesArray))
// logs [1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19]
*/

//My Solution
//I consider that each array has the same amount of elements
//Also consider that each array is already ordered.
func mergeArrays(_ arrayOne:[Int], _ arrayTwo:[Int])->[Int]{
	
	//Base array for result
	var mergeArray:[Int] = []
	
	//Which array is the biggest
	for num in 0...arrayOne.count-1{
		
		var maxNumber = 0
		var minNumber = 0
		var pivotNumber = 0
		
		//Get the less of each array
		if arrayOne[num] < arrayTwo[num]{
			minNumber = arrayOne[num]
			maxNumber = arrayTwo[num]
		} else {
			minNumber = arrayTwo[num]
			maxNumber = arrayOne[num]
		}
		if mergeArray.count == 0 {
			mergeArray.append(minNumber)
			mergeArray.append(maxNumber)
			continue
		} else {
			pivotNumber = mergeArray[mergeArray.count - 1]
			if  minNumber < pivotNumber{
				
				mergeArray[mergeArray.count - 1] = minNumber
				
				if maxNumber < pivotNumber {
					mergeArray.append(maxNumber)
					mergeArray.append(pivotNumber)
				} else {
					mergeArray.append(pivotNumber)
					mergeArray.append(maxNumber)
				}
				
			} else {
				mergeArray.append(minNumber)
				mergeArray.append(maxNumber)
			}
		}

		
	}
	
	return mergeArray
}
let myArray = [3, 4, 6, 10, 11, 15]
let alicesArray = [1, 5, 8, 12, 14, 19]
print(mergeArrays(myArray, alicesArray))


//Cake Interview solution
func mergeArrays(_ myArray: [Int], _ alicesArray: [Int]) -> [Int] {

	// set up our mergedArray
	var mergedArray = Array(repeating: 0, count: myArray.count + alicesArray.count)

	var currentIndexAlices = 0
	var currentIndexMine = 0
	var currentIndexMerged = 0

	while currentIndexMerged < mergedArray.count {

		let isMyArrayExhausted = currentIndexMine >= myArray.count
		let isAlicesArrayExhausted = currentIndexAlices >= alicesArray.count

		// case: next comes from my array
		// my array must not be exhausted, and EITHER:
		// 1) alice's array IS exhausted, or
		// 2) the current element in my array is less
		//    than the current element in alice's array
		if !isMyArrayExhausted &&
			(isAlicesArrayExhausted || myArray[currentIndexMine] < alicesArray[currentIndexAlices]) {

			mergedArray[currentIndexMerged] = myArray[currentIndexMine]
			currentIndexMine += 1

			// case: next comes from alice's array
		} else {
			mergedArray[currentIndexMerged] = alicesArray[currentIndexAlices]
			currentIndexAlices += 1
		}

		currentIndexMerged += 1
	}

	return mergedArray
}