//: Playground - noun: a place where people can play

//import UIKit

class Node<T> {
	
	var nextNode:Node<T>?
	var prevNode:Node<T>?
	var value:T
	
	init(value:T) {
		self.value = value
	}
}


class LinkedList<U>{
	
	var head:Node<U>?
	
	init() {
		
	}
	
	var isEmpty:Bool {
		return head == nil
	}
	
	func push(value:U){
		let newNode = Node(value:value)
		if(self.head != nil){
			let head = self.head
			head?.nextNode = newNode
			self.head = newNode
			self.head?.prevNode = head
		} else {
			head = newNode
		}
		
	}
	
	func pop()->U? { //Return the value removed
		
		let head = self.head
		self.head = head?.prevNode
		head?.prevNode = nil
		
		return head?.value
	}
	
	
}


var linkedList = LinkedList<String>()
linkedList.push(value: "hello")
linkedList.push(value: "world")
linkedList.head?.value
linkedList.head?.prevNode?.value
linkedList.pop()
linkedList.head?.value
linkedList.head?.prevNode?.value
