import UIKit

//Challeng mode: Easy
/*
Write your own version of the contains() method on String that ignores letter case, and
without using the existing contains() method.
*/

extension String {
	
	func fussyContains(_ string:String)->Bool{
		
		//Lets create holders for the elements
		let selfLowered = self.lowercased()
		let compareStringLowered = string.lowercased()
		
		//Now we want to check string inside self
		if let _ = selfLowered.range(of: compareStringLowered) {
			return true
		}
		return false
	}
}


"Hello World".fussyContains("waza")
"Hello World".fussyContains("Hello")
