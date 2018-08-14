/*
Today we'll go over a very common question asked in a software interview.  Given a sentence string, implement a function that returns this same sentence with every other word reversed.
*/
import Foundation
let sentence = "Me gustan los taco de pastor"
extension String {
	func reverse()->String{
		var wordReversed = ""
		
		for index in 0...self.count-1 {
			var letterIndex = self.index(endIndex, offsetBy: index)
			print(self[letterIndex])
		}
		return ""
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


