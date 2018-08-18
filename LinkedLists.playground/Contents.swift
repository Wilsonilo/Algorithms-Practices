import Foundation
//Node, damm Playground
class LinkedListNode<T:Equatable>{
	var value:T
	var next:LinkedListNode?
	weak var previous:LinkedListNode?
	
	public init(value:T) {
		self.value = value
	}
	static func == (lhs:LinkedListNode, rhs:LinkedListNode)->Bool{
		return lhs.value == rhs.value
	}
	
}
//List
class LinkedList<T>{
	
	public typealias Node = LinkedListNode<String>
	
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
	func addNode(value:String){
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
			var node = head // Before looping your starting node is head.
			for x in 1...atIndex{
				node = node?.next //Then move to the next node
				if x == atIndex{
					node?.previous?.next = node?.next
				}
			}
		}
	}
	
	
	//get the index of a value
	func getIndex(ofValue:String) -> Int?{
		
		guard (head != nil) else { return nil}
		var index:Int = 0
		var node = head! //Start at root node
		while (node.next != nil) {
			
			//Found it?
			if node.value == ofValue{
				return index
			}
			
			//Check if we are the tail before moving out of loop
			if node.next!.next == nil {
				if node.next!.value == ofValue {
					return index + 1
				}
			}
			
			//Move forward
			node = node.next!
			index += 1
		}
		
		return nil
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
newLinkedList.getIndex(ofValue: "This is a linked list of 3 strings")
newLinkedList.head?.next?.next?.value
//Remove "World"
newLinkedList.removeNode(atIndex: 1)
newLinkedList.head?.value
newLinkedList.head?.next?.value
newLinkedList.removeNode(atIndex: 0)
newLinkedList.head?.value
newLinkedList.head?.next?.value
