//Check if a Number is Prime - Wilson Muñoz

import UIKit

func isPrimer(number: Int)-> Bool{
    var prime:Bool = true
    
    if(number == 1 ){
        prime = false
    }
    
    for i in 2 ..< number{
        
        if(number % i == 0){
            prime = false
        }
        
    }
    
    return prime
}

isPrimer(2)
