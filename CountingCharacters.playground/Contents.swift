import UIKit
/*
Count the characters
Difficulty: Easy
Write a function that accepts a string, and returns how many times a specific character appears,
taking case into account.
Tip: If you can solve this without using a for-in loop, you can consider it a Tricky challenge.
*/

/// I created this for a relation of each character because i misread the question
func countCharacters(_ string:String){
	
	var characterCounter:[Character:Int] = [Character:Int]()
	
	for character in string {
		if characterCounter[character] != nil {
			characterCounter[character] = characterCounter[character]! + 1 // At this point i realize i misread the questions so i stopped trying to avoid the forcing unwrap.
		} else {
			characterCounter[character] = 1
		}
	}
	print(characterCounter)
}


countCharacters("The rain in Spain")


//normal answer
func countCharacters(input: String, count: Character) -> Int {
	return input.reduce(0) {
		$1 == count ? $0 + 1 : $0
	}
}
countCharacters(input: "The rain in Spain", count: "a")
