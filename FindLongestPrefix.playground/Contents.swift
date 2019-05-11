import UIKit

/*
“Challenge 12: Find longest prefix
Difficulty: Tricky

Write a function that accepts a string of words with a similar prefix, separated by spaces, and returns the longest substring that prefixes all words.

Sample input and output
The string “swift switch swill swim” should return “swi”.
The string “flip flap flop” should return “fl”.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
*/

//Failed
func longestPrefix(_ from:String)->String {
	
	let words = from.components(separatedBy: " ")
	var prefix = ""
	for word in words {
		for char in word {
			if word.hasPrefix(String(char)) {
				prefix = prefix + String(char)
			}
		}
	}
	return prefix
}

print(longestPrefix("swift switch swill swim"))

//Paul Hudson
func challenge12(input: String) -> String {
	let parts = input.components(separatedBy: " ")
	guard let first = parts.first else { return "" }
	
	var currentPrefix = ""
	var bestPrefix = ""
	
	for letter in first {
		currentPrefix.append(letter)
	
		for word in parts {
			if !word.hasPrefix(currentPrefix) {
				return bestPrefix
			}
		}
		
			bestPrefix = currentPrefix
	}
	
	return bestPrefix
}
