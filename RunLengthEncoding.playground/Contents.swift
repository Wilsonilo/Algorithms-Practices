import UIKit

/*
“Challenge 13: Run-length encoding
Difficulty: Taxing

Write a function that accepts a string as input, then returns how often each letter is repeated in a single run, taking case into account.

Tip: This approach is used in a simple lossless compression technique called run-length encoding.

Sample input and output
The string “aabbcc” should return “a2b2c2”.
The strings “aaabaaabaaa” should return “a3b1a3b1a3”
The string “aaAAaa” should return “a2A2a2”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
*/

//My Solution.
func lengthEncoding(_ from:String)->String{
	var from:[Character] = Array(from)
	var result = ""
	var counter = 0
	for (i, char) in from.enumerated() {
		counter += 1
		if from.indices.contains(i+1) {
			if char != from[i+1] {
				result += String(char) + "\(counter)"
				counter = 0
			}
		} else {
			result += String(char) + "\(counter)"
		}
		
	}
	
	return result
}

lengthEncoding("aabbcc")
lengthEncoding("aaabaaabaaa")
lengthEncoding("aaAAaa")


//Paul Hudson (Naive)
func challenge13a(input: String) -> String {
	var currentLetter: Character?
	var returnValue = ""
	var letterCounter = 0
	
	for letter in input {
		if letter == currentLetter {
			letterCounter += 1
		} else {
			
			//Is about to change append and reset
			if let current = currentLetter {
				returnValue.append("\(current)\(letterCounter)")
			}
			
			currentLetter = letter
			letterCounter = 1
		}
	}
	
	//We do this for the last part of, because current letter and the counter is declared put not yet added to the result.
	if let current = currentLetter {
		returnValue.append("\(current)\(letterCounter)")
	}
	
	return returnValue
}
challenge13a(input: "aabbcc")
