/*
You are a renowned thief who has recently switched from stealing precious metals to stealing cakes because of the insane profit margins. You end up hitting the jackpot, breaking into the world's largest privately owned stock of cakes—the vault of the Queen of England.

While Queen Elizabeth has a limited number of types of cake, she has an unlimited supply of each type.

Each type of cake has a weight and a value, stored in objects of a CakeType struct:

	struct CakeType {
		let weight: UInt
		let value: UInt
}
Swift
For example:

// weighs 7 kilograms and has a value of 160 shillings
CakeType(weight: 7, value: 160)

// weighs 3 kilograms and has a value of 90 shillings
CakeType(weight: 3, value: 90)

You brought a duffel bag that can hold limited weight, and you want to make off with the most valuable haul possible.

Write a function maxDuffelBagValue() that takes an array of cake type structs and a weight capacity, and returns the maximum monetary value the duffel bag can hold.

For example:

	let cakeTypes = [
		CakeType(weight: 7, value: 160),
		CakeType(weight: 3, value: 90),
		CakeType(weight: 2, value: 15)
]

let capacity = 20

// Returns 555 (6 of the middle type of cake and 1 of the last type of cake)
maxDuffelBagValue(for: cakeTypes, with: capacity)
*/


enum CakeThiefError: Error, CustomStringConvertible {

	case infinity

	var description: String {
		return "Max value is infinity!"
	}
}

func maxDuffelBagValue(for cakeTypes: [CakeType], withCapacity weightCapacity: UInt) throws -> UInt {

	// we make an array to hold the maximum possible value at every
	// duffel bag weight capacity from 0 to weightCapacity
	// starting each index with value 0
	var maxValuesAtCapacities: [UInt] = Array(repeating: 0, count: Int(weightCapacity) + 1)

	for currentCapacity in 0...weightCapacity {

		// set a variable to hold the max monetary value so far for currentCapacity
		var currentMaxValue: UInt = 0

		for cakeType in cakeTypes {

			// if a cake weighs 0 and has a positive value the value of our duffel bag is infinite!
			if cakeType.weight == 0 && cakeType.value != 0 {
				throw CakeThiefError.infinity
			}

			// if the current cake weighs as much or less than the current weight capacity
			// it's possible taking the cake would get a better value
			if cakeType.weight <= currentCapacity {

				// so we check: should we use the cake or not?
				// if we use the cake, the most kilograms we can include in addition to the cake
				// we're adding is the current capacity minus the cake's weight. we find the max
				// value at that integer capacity in our array maxValuesAtCapacities
				let maxValueUsingCake = cakeType.value 
					+ maxValuesAtCapacities[Int(currentCapacity - cakeType.weight)]


				// now we see if it's worth taking the cake. how does the
				// value with the cake compare to the currentMaxValue?
				currentMaxValue = max(maxValueUsingCake, currentMaxValue)
			}
		}

		// add each capacity's max value to our array so we can use them
		// when calculating all the remaining capacities
		maxValuesAtCapacities[Int(currentCapacity)] = currentMaxValue
	}

	return maxValuesAtCapacities[Int(weightCapacity)]
}