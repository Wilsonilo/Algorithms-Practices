//Factorial with recursion

func factorial(num:Int)->Int{
	if num > 0 {
		return num * factorial(num: num-1)
	} else {
		return 1
	}
}

print(factorial(num: 10))