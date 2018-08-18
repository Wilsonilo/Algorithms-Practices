func getFibonacci(of:Int)->[Int]{
	
	//Get base sequence
	var baseSequence = [0, 1]
	
	//Just to avoid edge case
	if of <= 1{
		return baseSequence
	}
	
	//Loop to create the array
	for _ in 0...of {
		let first = baseSequence[baseSequence.count-2]
		let second = baseSequence[baseSequence.count-1]
		baseSequence.append(first + second)
	}
	
	return baseSequence
}

//print(getFibonacci(of: 0))


//Recursion

func getFibonacciRecusrive(of:Int, first:Int, second:Int)->[Int]{
	if of == 0{
		return []
	}
	print(first, second)
	return [first + second] + getFibonacciRecusrive(of: of - 1 , first: second, second: first + second )
}
print(getFibonacciRecusrive(of: 9, first: 0, second: 1))