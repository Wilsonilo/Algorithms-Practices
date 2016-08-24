// Algorithm to Factorialize - by Wilson Muñoz

import UIKit

func Factorialize(a:Int, b:Int)->Array<Int>{
    var prev: Int?
    var now: Int?
    var array = [Int]()
    for _ in a ... b {
        if(initial == 1){
            
            now     = initial + initial
            prev    = initial
            initial = now!
            array.append(prev!)
            array.append(now!)
            
        } else {
            now     = prev! + initial
            prev    = initial
            initial = now!
            array.append(now!)
        }
    }
    return array
}

var initial = 1
var finish  = 21

Factorialize(initial, b: finish)