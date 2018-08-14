/*
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.
*/
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
		
	var bestCombination:[Int] = [0,0]
	for (i, num) in nums.enumerated() {
		
		if num < target {
			for (j, numo) in nums.enumerated(){
				if num + numo == target {
					bestCombination[0] = num
					bestCombination[1] = numo
				}
			}
		}
	}
	return bestCombination
}


print(twoSum([2, 7, 11, 15], 9))

//https://github.com/diwu/LeetCode-Solutions-in-Swift/blob/master/Solutions/Solutions/Medium/Medium_001_Two_Sum.swift
//I don't like to return index 1 = 2 and index 2 = 7
func twoSum(numbers: [Int], target: Int) -> [Int] {
	var hashMap = [Int: Int]()
	var result = [Int]()

	for i in 0..<numbers.count {
		let numberToFind: Int = target - numbers[i]
		if let numberToFindIndex = hashMap[numberToFind] {
			result.append(numberToFindIndex + 1)
			result.append(i + 1)
			return result
		} else {
			hashMap[numbers[i]] = i
		}
	}
	return result
}

print(twoSum(numbers: [2, 7, 11, 15], target: 9))


//Refactoring to return the numbers to sum instead of the indexes.
func twoSumRef(numbers: [Int], target: Int) -> [Int] {
	var hashMap = [Int: Int]()
	var result = [Int]()

	for i in 0..<numbers.count {
		let numberToFind: Int = target - numbers[i]
		if let numberToFindIndex = hashMap[numberToFind] {
			//why use the + 1 ???
			result.append(numberToFindIndex)
			result.append(i)
			return result
		} else {
			hashMap[numbers[i]] = i
		}
	}
	return result
}

print(twoSumRef(numbers: [2, 7, 11, 15], target: 9))
