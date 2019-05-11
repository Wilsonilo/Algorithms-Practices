import UIKit

/*
“Challenge 14: String permutations
Difficulty: Taxing

Write a function that prints all possible permutations of a given input string.

Tip: A string permutation is any given rearrangement of its letters, for example “boamtw” is a permutation of “wombat”.

”

“Sample input and output
The string “a” should print “a”.
The string “ab” should “ab”, “ba”.
The string “abc” should print “abc”, “acb”, “bac”, “bca”, “cab”, “cba”.
The string “wombat” should print 720 permutations.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
*/

//First try, but permutations were not complete
func stringPermutations(_ from:String, index:Int = 1){
	guard index < from.count else { return }
	let chars:[Character] = Array(from).sorted()
	
	let charWorking = chars[index]
	for (i, char) in chars.enumerated() {
		var temp = chars
		temp[i] = charWorking
		temp[index] = char
		print(String(temp))
	
	}
	stringPermutations(from, index: index+1)
}


//stringPermutations("ab")
//stringPermutations("wombat")


//Second try with all the hints.

func stringPermutationsTwo(_ from:String, index:Int = 0){
	guard index < from.count else { return }
	let from = Array(from)
	let chars:[Character] = Array(from).sorted()
	let leftSide = from[0 ..< index]
	let rightSide = from[index+1 ..< from.count]
	print(leftSide + rightSide)
}

func challenge14(string: String, current: String = "") {
	let length = string.count
	let strArray = Array(string)

	if (length == 0) {
		// there's nothing left to re-arrange; print the result
		print(current)
		print("******")
	} else {
		print(current)
		
		// loop through every character
		for i in 0 ..< length {
			// get the letters before me
			let left = String(strArray[0 ..< i])
			
			// get the letters after me
			let right = String(strArray[i+1 ..< length])
			
			// put those two together and carry on
			challenge14(string: left + right, current: current + String(strArray[i]))
		}
	}
}
challenge14(string: "wombat")
