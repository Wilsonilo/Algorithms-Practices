import UIKit

/*
Remove duplicate letters from a string
Difficulty: Easy
Write a function that accepts a string as its input, and returns the same string just with
duplicate letters removed.
Tip: If you can solve this challenge without a for-in loop, you can consider it “tricky” rather
than “easy”.
*/

// Created this solution which is no good but came to my mind.
func removeCharactersDuplicatedIn(_ string:String)->String{
	
	var holder = string
	for char in holder {
		let count = holder.filter({$0 == char})
		if count.count > 1 {
			if let index = holder.firstIndex(of: char){
				holder.remove(at: index)
			}
		}
	}

	return holder
}

removeCharactersDuplicatedIn("Mississippi")



//Using NSOrderedSet
func removeCharactersDupIn(_ string:String)->String {
	
	let array = string.map({$0})
	let set = NSOrderedSet(array: array)
	let arrayOfUniqueLetters = Array(set) as! Array<String>
	return arrayOfUniqueLetters.joined()
	
}
removeCharactersDuplicatedIn("Mississippi")
