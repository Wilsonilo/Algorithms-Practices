//Chiper Caesar by Wilson Muñoz
//Encode and Decode in same Function
//No Refactor this is just a practice to understand and pass the FreeCodeCamp Challengue

import UIKit

func chiperCesar(encoded: String...) -> String{
    
    let alphabet        = [
        0 : "A",
        1 : "B",
        2 : "C",
        3 : "D",
        4 : "E",
        5 : "F",
        6 : "G",
        7 : "H",
        8 : "I",
        9 : "J",
        10 : "K",
        11 : "L",
        12 : "M",
        13 : "N",
        14 : "O",
        15 : "P",
        16 : "Q",
        17 : "R",
        18 : "S",
        19 : "T",
        20 : "U",
        21 : "V",
        22 : "W",
        23 : "X",
        24 : "Y",
        25 : "Z"
    ]
    
    
    let numberletters   = alphabet.count-1
    var newWord:String = ""
    
    //Loop each word
    for word in encoded {
        
        //Translate each letter
        for i in 0..<word.characters.count{
            
            let index = word.startIndex.advancedBy(i)
            
            if(word[index] == " "){
                newWord = newWord + " "
            }
            
            let getIndex = alphabet.filter({ $0.1 == String(word[index]) })
            
            for index in getIndex{
                
                var indexChipher = index.0
                
                if(indexChipher < 13){
                    
                    indexChipher = indexChipher + 13
                    newWord = newWord + alphabet[indexChipher]!
                    
                } else {
                    
                    numberletters  - indexChipher
                    
                    let restantes = numberletters  - indexChipher
                    var paraChiper:Int = 0
                    
                    if(restantes == 0){
                        
                        paraChiper = 12
                        
                    } else {
                        
                        paraChiper = 12 - restantes
                    }
                    
                    
                    newWord = newWord + alphabet[paraChiper]!
                    
                }
                
            }
        }
        
    }
    
    return newWord
}
let stringToEncode  = "I LOVE COFFEEE"
var encodedtest     = chiperCesar(stringToEncode)
var decodetest      = chiperCesar(encodedtest)