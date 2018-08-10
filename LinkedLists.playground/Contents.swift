import Foundation
//Node, damm Playground
class LinkedListNode<T>{
	var value:T
	var next:LinkedListNode?
	weak var previous:LinkedListNode?
	
	public init(value:T) {
		self.value = value
	}
}
//List
class LinkedList<T>{
	
	
	public typealias Node = LinkedListNode<T>
	
	var head:Node?
	
	init() {
		
	}
	
	//Are we empty?
	public var isEmpty : Bool {
		return head == nil
	}
	
	//Return the head of the list
	public var headOfList:Node? {
		return head
	}
	
	
	//Return the Tail of the list
	public var tail:Node? {
		
		//Check if we have a head to start, else the list is empty
		guard var node = head else {
			return nil
		}
		
		while let nextNode = node.next{
			node = nextNode
		}
		return node
	}
	
	//Add nodes to the tree
	func addNode(value:T){
		let newNode = Node(value: value)
		if let lastNode = tail {
			lastNode.next = newNode
			newNode.previous = lastNode
		} else {
			head = newNode
		}
	}
	
	func removeNode(atIndex:Int){
		if atIndex == 0{
			//Shift
			head?.next?.previous = nil
			head = head?.next
		} else {
			var node = head // 1
			for x in 1...atIndex{
				node = node?.next
				if x == atIndex{
					node?.previous?.next = node?.next
				}
			}
		}
	}
}


let newLinkedList = LinkedList<String>()
newLinkedList.isEmpty
newLinkedList.addNode(value: "Hello")
newLinkedList.head?.value
newLinkedList.head?.next?.value
newLinkedList.addNode(value: "World")
newLinkedList.head?.next?.value
newLinkedList.addNode(value: "This is a linked list of 3 strings")
newLinkedList.head?.next?.next?.value
//Remove "World"
newLinkedList.removeNode(atIndex: 1)
newLinkedList.head?.value
newLinkedList.head?.next?.value
newLinkedList.removeNode(atIndex: 0)
newLinkedList.head?.value
newLinkedList.head?.next?.value
