import UIKit

/*
“Challenge 15: Reverse the words in a string
Difficulty: Taxing

Write a function that returns a string with each of its words reversed but in the original order, without using a loop.

Sample input and output
The string “Swift Coding Challenges” should return “tfiwS gnidoC segnellahC”.
The string “The quick brown fox” should return “ehT kciuq nworb xof”.
”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.

*/

//I swear did not see any hint or the answer, challenge 14 was way more challenging for me that this one.
func reverseEachWordNoLoop(_ input:String)->String {
	let split = input.split(separator: " ")
	let converted = split.map({
		$0.reversed()
	})
	return String(converted.joined(separator: " "))
}

reverseEachWordNoLoop("Swift Coding Challenges")

//Paul Hudson:
func challenge15(input: String) -> String {
	let parts = input.components(separatedBy: " ")
	let reversed = parts.map { String($0.reversed()) }
	return reversed.joined(separator: " ")
}
