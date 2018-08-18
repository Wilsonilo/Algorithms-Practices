//Rotate array based from element

let tracks = ["a", "b", "c", "d", "e"]

//We need to array to return ["d", "e", "a", "b", "c"] is we select "d" as the rotation point

//Using brute force

func rotateBrute(_ array:[String], num:String)->[String] {
	
	var finalArray = [String]()
	var elementsPrev = [String]()
	
	for element in array{
		if element == num || finalArray.count > 0 {
			finalArray.append(element)
		} else {
			elementsPrev.append(element)
		}
	}
	
	return finalArray + elementsPrev
}

print(rotateBrute(tracks, num: "d"))


//Binary Search to find index and the create a new array, this is "dirty"
//1. take advantage that the array is ordered, this is important you know you can pivot from left or right
//2. Use divide and conquer to make O(n) effective.

func rotate(_ array:[String], from:String, midIndex:Int? = nil) -> [String]{
	
	//Set out array as variable in the scope so we can return it with changes
	var array = array
	var midIndex = midIndex
	
	//Just to check if we at least have the element we are looking for	
	var floorIndex = 0
	var ceilingIndex = array.count - 1
	
	if from == array.first!{
		return array
	}
	
	//Start getting the mid section
	if midIndex == nil {
		midIndex = floorIndex + ((ceilingIndex - floorIndex) / 2)
	}
	
	//Start checking and moving around depending on the index
	//have we found it?
	if from == array[midIndex!]{
		
		return Array(array[midIndex!...ceilingIndex]) + Array(array[floorIndex ... midIndex!-1])
		
	}
	
	
	//Check left and right side
	if from < array[midIndex!]{
		
		//Word if less that the one on the middle work the half from the left side
		return rotate(array, from: from, midIndex: midIndex! / 2)
		
	} else {
		//Word is major that the one on index work the right side
		return rotate(array, from: from, midIndex: midIndex! + ceilingIndex / 2)
	}
	
}

print(rotate(tracks, from: "e"))