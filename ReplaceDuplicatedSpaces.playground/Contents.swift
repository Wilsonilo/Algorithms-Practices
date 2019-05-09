import UIKit

/*
Challenge 7: Condense whitespace
Difficulty: Easy
Write a function that returns a string with any consecutive spaces replaced with a single space.
*/


func condenseWhitspaceFrom(_ string:String)->String {
	var mutString = string
	for _ in mutString {
		mutString = mutString.replacingOccurrences(of: "  ", with: " ")

	}
	return mutString
}


condenseWhitspaceFrom("a    b         c")

//Paul Hudson Solution with regular expressions

func challenge7b(input: String) -> String {
	return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}
challenge7b(input:"a    b         c")
