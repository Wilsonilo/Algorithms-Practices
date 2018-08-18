/*
Given a list of people with their birth and end years (all between 1900 and 2000), find the year with the most number of people alive.
*/

import Foundation

//Let's create an object for a person just to make it "easier" in a real interview you don't do this, you get maybe two arrays one for birth year and another for death years.
//But just for fun let's conform an struct.

struct Person {
	
	var yearBirth:Int
	var deathYear:Int
	var	name:String // Just to have name although again, this makes more information that you can cut off, but meh, let's have fun
	
	init(yearBirth:Int, deathYear:Int, name:String){
		
		self.yearBirth = yearBirth
		self.deathYear = deathYear
		self.name	   = name
	}
	
}

//Let's create the elements to resolve the problem
let bob = Person(yearBirth: 1990, deathYear: 2018, name: "Bob")
let jhon = Person(yearBirth: 1920, deathYear: 2010, name: "Jhon" )
let karla = Person(yearBirth: 1950, deathYear: 2015, name: "Karla")

//Lets create more "extreme ranges"
let ruth = Person(yearBirth: 1760, deathYear: 1840, name: "Ruth")
let michael = Person(yearBirth: 1830, deathYear: 1910, name: "Michael")
let pedro = Person(yearBirth: 1890, deathYear: 1990, name: "Pedro")
let carlos = Person(yearBirth: 1900, deathYear: 1950, name: "Carlos")

//Lets group them
let people = [bob, jhon, karla, ruth, michael, pedro, carlos]



//Create the method to resolve the question, start with brute force
func whichYearMostPeopleAlieve(_ from:[Person])->(Int,Int){
	
	//Create the properties need it.
	var comparator:(alieve:Int, year:Int) = (0, 0)
	var alive = 0
	
	//Loop each person an check eah birth year and check who was alive
	for person in from {
		
		alive += 1
		
		for personCheck in from {
			
			//Avoid duplicating skiping same person
			if person.name == personCheck.name{
				continue
			}
			
			if personCheck.deathYear < person.yearBirth {
				alive += 1
			}
			
		}
		
		//Check if
		if comparator.alieve < alive {
			comparator = (alive, person.yearBirth)
		}
		
		//reset
		alive = 0
		
	}
	
	return comparator
}
//This is O(n2)
print(whichYearMostPeopleAlieve(people))



//Ok, how do we make this more "optimal".
//Gayle McDowell says that we can go linear using a counter an incrementing an decrementing based on the births and deaths.
//So we have a range of the earlist birth year and a ceiling of the farest death year and in between we change the counter.
//https://vimeo.com/158532188

