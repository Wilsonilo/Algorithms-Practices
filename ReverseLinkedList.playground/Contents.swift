//: Playground - noun: a place where people can play

import UIKit

//Create the node base//Make request to server

class Node{
	var value:Int
	var next:Node?
	
	init(value:Int, nextNode:Node? = nil){
		self.value = value
		self.next = nextNode
	}
}

//First we want: 6->5->4->nil
let nodeFour = Node(value:4)
let nodeFive = Node(value:5, nextNode:nodeFour)
let rootNode = Node(value:6, nextNode:nodeFive)

//Second create a simple function to print each node
func printNodes(node:Node?){
	
	var node = node //to loop inside the scoop, start with the root
	
	while(node != nil){
		print("\(node!.value)->")
		node = node!.next
	}
}

printNodes(node:rootNode)


//Now create a function to reverse a linked list and print it again to be sure is reversed with the previous method
func reverseLinkedList(node:Node?)->Node{
	
	var reversedLinkedList:Node?
	var tailNode:Node?
	var pivotNode = node
	var previousNodes:[Node] = []
	
	while pivotNode != nil {
		if pivotNode?.next == nil {
			tailNode = pivotNode
		}
		previousNodes.insert(pivotNode!, at: 0)
		pivotNode = pivotNode?.next
	}
	reversedLinkedList = tailNode
	
	for nodeIndex in 0...previousNodes.count-2{
		reversedLinkedList?.next = previousNodes[nodeIndex]
	}
	
	print(reversedLinkedList)
	return reversedLinkedList!
}
printNodes(node: reverseLinkedList(node: rootNode))
