//Binary Search

let array = [1, 2, 3, 4, 7, 8, 9, 14, 19, 23]


//Brute force
func lookFor(_ value: Int, from:[Int])->Bool{
	for element in from {
		if element == value {
			return true
		}
	}
	return false
}

//Divide and conquer / Binary Search

func lookForBin(_ value:Int, from:[Int])->Bool{
	let middle:Int = from[from.count/2]
	if middle == value {
		return true
	} else if from.count == 1{
		
		return false
		
	} else {

		if value < middle{
			//left
			return lookForBin(value, from: Array(from[0..<from.count/2]))
			
		} else {
			//right
			return lookForBin(value, from: Array(from[from.count/2+1...from.count-1]))
		}
	}
	
}

print(lookForBin(4, from: array))
//print(lookFor(8, from: array))