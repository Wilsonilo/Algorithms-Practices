//: Dutch National Flag - by Wilson Muñoz

/*
 WIKIPEDIA:
 
 The Dutch national flag problem (DNF)[1] is a computer science programming problem proposed by Edsger Dijkstra.[2] The flag of the Netherlands consists of three colors: red, white and blue. Given balls of these three color arranged randomly in a line (the actual number of balls does not matter), the task is to arrange them such that all balls of the same color are together and their collective color groups are in the correct order.
 
 
 */


import UIKit

func order(array: [Int])-> [Int]{
    
    let max = a.maxElement()
    let min = a.minElement()
    var arrayone = [Int]()
    var arraytwo = [Int]()
    var arraythree = [Int]()
    var newarray = [Int]()
    
    for number in a{
        if(number == min){
            
            arrayone.append(number)
            
        }
        if(number == 2){
            
            arraytwo.append(number)
            
        }
        
        if(number == max){
            
            arraythree.append(number)
            
        }
    }
    newarray.appendContentsOf(arrayone)
    newarray.appendContentsOf(arraytwo)
    newarray.appendContentsOf(arraythree)
    return newarray
}

var a = [1,3,3,2,1]
order(a)
