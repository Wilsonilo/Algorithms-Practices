import UIKit

/*
“Challenge 17: Generate a random number in a range
Difficulty: Easy

Write a function that accepts positive minimum and maximum integers, and returns a random number between those two bounds, inclusive.

Sample input and output
Given minimum 1 and maximum 5, the return values 1, 2, 3, 4, 5 are valid.
Given minimum 8 and maximum 10, the return values 8, 9, 10 are valid.
Given minimum 12 and maximum 12, the return value 12 is valid.
Given minimum 12 and maximum 18, the return value 7 is invalid.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
*/


func ramdomNumber(min:Int, max:Int)->Int{
	// Slice the max with the min givving you a number betweern 0 and min and then add the min to go above the range, we use + 1 to jump the 0
	return Int(arc4random_uniform(UInt32(max - min + 1))) + min
	
}

ramdomNumber(min: 50, max: 100)

//Paul Hudson, this is sexy.
func randomNumberNormal(min:Int, max:Int)->Int{
	return Int.random(in: min...max)
}
