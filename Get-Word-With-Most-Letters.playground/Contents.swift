// Get Word With Most Letters by Wilson Muñoz
// This also can deliver the number of charachters of that word using map["number] as! String intead of the
// "word"

import UIKit


func findLongestWord(str: String)-> String{
    var arrayOfWords:Array<String>
    var dictionary = [Dictionary<String,AnyObject>]()
    arrayOfWords = str.characters.split(" ").map(String.init)
    
    for i in 0..<arrayOfWords.count {
        let newelements:Dictionary<String,AnyObject> = ["numberofletter": arrayOfWords[i].characters.count,
                                                        "word": arrayOfWords[i]
        ]
        dictionary.append(newelements)
        
    }
    let map = dictionary.maxElement({ ($0["numberofletter"] as? Int) < ($1["numberofletter"] as? Int) })
    
    return map!["word"] as! String
    
}

let phrase = "hola wilson como estas"

findLongestWord(phrase)