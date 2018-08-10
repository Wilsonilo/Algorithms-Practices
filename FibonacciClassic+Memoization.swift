func fib(_ n: Int) -> Int {
	if n == 0 || n == 1 {
			return n
	}
	return fib(n - 2) + fib(n - 1)
}

print(fib(4))

  enum FibberError: Error, CustomStringConvertible {
	case negativeIndex

	var description: String {
		return "Index was negative. No such thing as a negative index in a series."
	}
}

class Fibber {

	private var memo: [Int: Int] = [:]

	func fib(_ n: Int) throws -> Int {

		guard n >= 0 else {
			throw FibberError.negativeIndex
		}

		// base cases
		guard n != 0 && n != 1 else {
			return n
		}

		// see if we've already calculated this
		if let memoValue = memo[n] {
			print("grabbing memo[\(n)]")
			return memoValue
		}

		print("computing fib(\(n))")
		let result = try fib(n - 1) + fib(n - 2)

		// memoize
		memo[n] = result

		return result
	}
}