import UIKit
import Foundation
//func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
//	for (index, value) in array.enumerated() {
//		if value == valueToFind {
//			return index
//		}
//	}
//	return nil
//}
//
//
//struct Person {
//	var name:String
//	var id:String
//	init(name:String, id:String) {
//		self.name = name
//		self.id   = id
//	}
//}
//
//extension Person:Equatable {
//	static func == (lhs:Person, rhs:Person)-> Bool {
//		return lhs.id == rhs.id
//	}
//}
//
//extension Person:CustomStringConvertible {
//	var description: String{
//		return "\(id) - \(name)"
//	}
//}
//
//extension Person:Hashable {
//	func hash(into hasher: inout Hasher){
//		hasher.combine(id)
//		hasher.combine(name)
//	}
//}
//
//let personOne = Person(name: "Wilson", id: "0001")
//let personTwo = Person(name: "Eduardo", id: "0002")
//let persons = [personOne, personTwo]
//
//if let index = findIndex(of: personOne, in: persons) {
//	//print(index)
//}
//
//let dict:[Person: Any] = [personOne : "Is PersonOne", personTwo : ["is": "second name"]]
////print(personOne.hashValue)
////print(dict[personTwo])
//
//
//protocol Container {
//	associatedtype Elemento
//	mutating func append(_ item: Elemento)
//	var count: Int { get }
//	subscript(i: Int) -> Elemento { get }
//}
//struct Stack<Element>:Container {
//	var items = [Element]()
//	mutating func append(_ item: Element) {
//		items.append(item)
//	}
//	mutating func pop(){
//		items.removeLast()
//	}
//
//	var count: Int {
//		return items.count
//	}
//	subscript(i:Int)->Element{
//		get {
//			assert(items.indices.contains(i), "Index out of range")
//			return items[i]
//		}
//	}
//
//}
//
//
//var newStack = Stack(items: [personOne])
//newStack.append(personTwo)
////print(newStack[1])
//newStack.pop()
////print(newStack[1])
//newStack.append(personTwo)
//newStack.append(personOne)
////print(newStack[0])
//
//
//
//
//var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//func backward(_ s1: String, _ s2: String) -> Bool {
//	return s1 > s2
//}
//names.sort(by: >)
//
////print(names)
//let digitNames = [
//	0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
//	5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
//]
//let numbers = [16, 58, 51]
//let strings = numbers.map { (number) -> String in
//	var number = number
//
//	var output = ""
//	repeat {
//		output = digitNames[number % 10]! + output
//		number /= 10
//	} while number > 0
//	return output
//}
//
//
//func makeIncrementer(forIncrement amount: Int) -> () -> Int {
//	var runningTotal = 0
//	func incrementer() -> Int {
//		runningTotal += amount
//		return runningTotal
//	}
//	return incrementer
//}
//
//var incremental = makeIncrementer(forIncrement: 3)
////print(incremental())
////print(incremental())
//

struct User:Decodable {
	let id_str:String
	let name:String
	let screen_name:String
}

struct Tweet:Decodable {
	let id_str:String
	let text:String
	let user:User
}

//func runRequestUser(completion: @escaping (_ data: Data?, _ response:URLResponse?, _ error:Error?) -> ()){
//	let userLink = "https://wizetwitterproxy.herokuapp.com/api/user"
//	guard let url = URL(string: userLink) else { return }
//	URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//}
//func runTimeLineRequest(completion: @escaping (_ data: Data?, _ response:URLResponse?, _ error:Error?) -> ()){
//	let timelineUrl = "https://wizetwitterproxy.herokuapp.com/api/statuses/user_timeline"
//	guard let url = URL(string: timelineUrl) else { return }
//	URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//}
//
//runRequestUser { (data, response, error) in
//	guard let data = data else { return }
//	//let dataString = String(data: data, encoding: .utf8)
//	do {
////		guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
////		print(json)
//		//After this yo pass the json to a function that parses the dictionary to a Model, this is the old way.
//
//
//		//New way:
//		let user = try JSONDecoder().decode(User.self, from: data)
//		print(user.id_str)
//	}catch{
//		print("Error on desarialization ", error)
//	}
//}
//
//runTimeLineRequest { (data, response, error) in
//	guard let data = data else { return }
//	do {
//		let timeline = try JSONDecoder().decode([Tweet].self, from: data)
//		guard let firstTweet = timeline.first else { return }
//		print(firstTweet.user.name)
//	}catch{
//		print("Error on desarialization ", error)
//	}
//}


public func request<T:Decodable >(t:T.Type, _ urlRequest: String, completion: @escaping ([T]?) -> ()){
	requestToServer(urlRequest: urlRequest) { (data) in
		guard let data = data else { completion(nil); return }
		if let jsonArray = try? JSONDecoder().decode([T].self, from: data) {
			completion(jsonArray)
		}else if let jsonOneElement = try? JSONDecoder().decode(T.self, from: data) {
			completion([jsonOneElement])
		} else {
			completion(nil)
		}
		
	}
}


func requestToServer(urlRequest:String, completion: @escaping (Data?) -> ()){
	
//	//Make request to server
//	Alamofire.request(urlRequest, method: .get, parameters: nil).responseJSON { response in
//
//		switch response.result {
//
//		case .success:
//			guard let data = response.data else { completion(nil); return }
//			completion(data)
//			break
//		case .failure(let error):
//			completion(nil)
//			print("Error on request: ", error.localizedDescription)
//			break
//		}// Ends switch Case
//
//	}// Ends Alamofire
}

request(t: User.self, "") { (result) in
	print(result ?? "No result")
}




