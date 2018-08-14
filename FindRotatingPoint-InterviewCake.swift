/*
I want to learn some big words so people think I'm smart.

I opened up a dictionary to a page in the middle and started flipping through, looking for words I didn't know. I put each word I didn't know at increasing indices in a huge array I created in memory. When I reached the end of the dictionary, I started from the beginning and did the same thing until I reached the page I started at.

Now I have an array of words that are mostly alphabetical, except they start somewhere in the middle of the alphabet, reach the end, and then start from the beginning of the alphabet. In other words, this is an alphabetically ordered array that has been "rotated." For example:

  var words = [
	"ptolemaic",
	"retrograde",
	"supplant",
	"undulate",
	"xenoepist",
	"asymptote",  // <-- rotates here!
	"babka",
	"banoffee",
	"engender",
	"karpatka",
	"othellolagkage",
]
*/
public func findRotationPoint(in words: [String]) -> Int {
	let firstWord = words[0]

	var floorIndex = 0
	var ceilingIndex = words.count - 1

	while floorIndex < ceilingIndex {

		// guess a point halfway between floor and ceiling
		let guessIndex = floorIndex + ((ceilingIndex - floorIndex) / 2)

		// if guess comes after first word or is the first word
		if words[guessIndex] >= firstWord {
			// go right
			floorIndex = guessIndex
		} else {
			// go left
			ceilingIndex = guessIndex
		}

		// if floor and ceiling have converged
		if (floorIndex + 1) == ceilingIndex {

			// between floor and ceiling is where we flipped to the beginning
			// so ceiling is alphabetically first
			break
		}

	}
	return ceilingIndex
}