import UIKit

/*
“Challenge 10: Vowels and consonants
Difficulty: Tricky

Given a string in English, return a tuple containing the number of vowels and consonants.

Tip: Vowels are the letters, A, E, I, O, and U; consonants are the letters B, C, D, F, G, H, J, K, L, M, N, P, Q, R, S, T, V, W, X, Y, Z.

Sample input and output
The input “Swift Coding Challenges” should return 6 vowels and 15 consonants.
The input “Mississippi” should return 4 vowels and 7 consonants.”

Excerpt From: Paul Hudson. “Swift Coding Challenges.” Apple Books.
*/

//Naive/Brute force.
func vowelsAndConsonantsFrom(_ input:String)->(vowels: Int, letters: Int){
	let input = input.uppercased()
	var holder = [String:Int]()
	let vowels:[Character] = ["A", "E", "I", "O", "U"]
	let letters:[Character] = ["B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"]
	
	for char in input {
		if vowels.contains(char) {
			if var holderVowels = holder["vowels"]{
				holderVowels += 1
				holder["vowels"] = holderVowels
			} else {
				holder["vowels"] = 1
			}
		}else if letters.contains(char){
			if var holderLetters = holder["letters"]{
				holderLetters += 1
				holder["letters"] = holderLetters
			} else {
				holder["letters"] = 1
			}
		}
		
	}
	return (holder["vowels"]!, holder["letters"]!)
	
}

print(vowelsAndConsonantsFrom("Swift Coding Challenges"))


//Try with filter twice
func vowelsAndConsonantsFromTwo(_ input:String)->(vowels: Int, letters: Int){
	let input = input.uppercased()
	let vowels:[Character] = ["A", "E", "I", "O", "U"]
	let letters:[Character] = ["B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"]
	let vowerlsNumber = input.filter({vowels.contains($0)}).count
	let lettersNumber = input.filter({letters.contains($0)}).count
	return (vowerlsNumber, lettersNumber)
}
print(vowelsAndConsonantsFromTwo("Swift Coding Challenges"))
