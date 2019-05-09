import UIKit

/*
Challenge 3: Do two strings contain the same characters?
Difficulty: Easy
Write a function that accepts two String parameters, and returns true if they contain the same
characters in any order taking into account letter case.
*/


func doesStringsMatch( _ stringOne:String, stringTwo:String)->Bool {
	
	return stringOne.sorted() == stringTwo.sorted()
	
}

/// This has a bigger O notation because we need to loop, although i don't know why i like it better.
func doesStringMatchBiggerONotation(_ stringOne:String, stringTwo:String)-> Bool{
	
	var holderString:String = stringTwo
	
	for letter in stringOne{
		
		if let index = holderString.firstIndex(of: letter){
			holderString.remove(at: index)
		}
	}
	
	return holderString.count == 0
}
