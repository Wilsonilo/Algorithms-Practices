// Understanding BinarySearchTree
// Source: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Search%20Tree


import Foundation


public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    private(set) public var altura: Int?
    
    public init(value: T) {
        self.value = value
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    

    
    //Methods.
    
    //Insert
    public func insert(value: T) {
        insert(value, parent: self)
    }
    
    
    private func insert(value: T, parent: BinarySearchTree) {
        if value < self.value {
            if let left = left {
                left.insert(value, parent: left)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = parent
            }
        } else {
            if let right = right {
                right.insert(value, parent: right)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = parent
            }
        }
    }
    
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    

}




extension BinarySearchTree: CustomStringConvertible {
   
    
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
    
    

}




//Get Number of nodes by Level - Wilson Muñoz.
//Based on the notes of: Freeze Francis
//http://stackoverflow.com/questions/31172940/counting-number-of-nodes-in-a-complete-binary-tree
func leftSide(var node: BinarySearchTree<Int>) -> Int{
    
    var counter:Int = 0

    while(node.hasLeftChild) {
        node = node.left!
        counter += 1
    }
    
    return counter
}


func rightSide(var node: BinarySearchTree<Int>) -> Int{
    
    var counter:Int = 0

    while(node.hasRightChild) {
        node = node.right!
        counter += 1
    }
    
    return counter
}

func countNodes(node: BinarySearchTree<Int>) -> Int{
    
    
    let left = leftSide(node)
    let right = rightSide(node)
    
        if(left % right == 0){
            return 2 * 2
        }
    
    return (countNodes(node.left!)+countNodes(node.right!))

}



let tree = BinarySearchTree<Int>(value: 7)
tree.insert(2)
tree.insert(5)
tree.insert(10)
tree.insert(9)
tree.insert(1)


tree.height()

countNodes(tree)
