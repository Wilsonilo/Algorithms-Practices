import UIKit

/*
“Challenge 9: Find pangrams
Difficulty: Tricky

Write a function that returns true if it is given a string that is an English pangram, ignoring letter case.

Tip: A pangram is a string that contains every letter of the alphabet at least once.

Sample input and output
The string “The quick brown fox jumps over the lazy dog” should return true.
The string “The quick brown fox jumped over the lazy dog” should return false, because it’s missing the S.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
*/

//Naive. Let's create a dictionary of all letters, check if all are inside the string with a for loop and check if they match
//Naive 2? : order the string and create an equal check

func findPangramFrom( _ string:String)->Bool {
	let string = string.uppercased()
	var stringArray:[Character] = Array(Set(string)).sorted()
	if let space = stringArray.firstIndex(of: " ") {
		stringArray.remove(at: space)
	}
	let aToZ:[Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"].sorted()
	guard stringArray.count == aToZ.count else { return false }
	return stringArray == aToZ
}

findPangramFrom("The quick brown fox jumps over the lazy dog")
findPangramFrom("The quick brown fox jumped over the lazy dog")


//Pauld HUdson Solution

func challenge9(input: String) -> Bool {
	let set = Set(input.lowercased())
	let letters = set.filter { $0 >= "a" && $0 <= "z" }
	return letters.count == 26
}

challenge9(input: "The quick brown fox jumps over the lazy dog")
