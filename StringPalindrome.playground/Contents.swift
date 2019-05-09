import UIKit

/*
Is a string a palindrome?
Difficulty: Easy
Write a function that accepts a String as its only parameter, and returns true if the string reads
the same when reversed, ignoring case.
*/

func isPalindrome(_ string:String)->Bool{
	
	return String(string.lowercased().reversed()) == string
}


isPalindrome("rotator")
isPalindrome("potato")
