/*
Today we'll go over a very common question asked in a software interview.  Given a sentence string, implement a function that returns this same sentence with every other word reversed.
i changed it to do every work, i mean you only need to use % to check every other word so instead i wanted to try to find a way to reverse every word/character without reversed()
*/
import Foundation
let sentence = "Me gustan los taco de pastor"
extension String {
	func reverse()->String{
		var wordReversed = [Character]()
		
		for char in self{
			wordReversed.insert(char, at: 0)
		}
		return String(wordReversed)
	}
}
func rever(sentence:String)->String{
	
	var finalResult = ""
	
	let words = sentence.components(separatedBy: " ")
	
	for word in words{
		if finalResult == "" {
			finalResult = word.reverse()
		} else {
			finalResult += " " + word.reverse()
		}
	}
	return finalResult
}

print(rever(sentence: sentence))


