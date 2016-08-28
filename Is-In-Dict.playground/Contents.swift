import Foundation

/*
 Given a dictionary of English words, write a function that determines whether an input string is constructed of words in the dictionary.
 
 Assume you have an existing function, isInDict(string), that returns true if a string is in the provided dictionary.
 
 Examples:
 English words: ["i", "a", "am", "uber", "dsfhasu"]
 
 "iauber" -> true
 "iamuber" -> true
 "ia" -> true
 "ixam" -> false
 
 */
let DictionaryFinal = ["i", "a", "am", "uber"]
func isInDict(word:String) -> Bool {
    
    for wordinside in DictionaryFinal{
        if wordinside == word {
            return true
        }
    }
    
    return false
}

func checkifword(word:String) -> Bool{
    
    var arrayWord           = word.characters.map { String($0) }
    var arraylettersDict:Array<String> = []
    
    var result = false
    
    for wordinside in DictionaryFinal{
        
        let letters = wordinside.characters.map { String($0) }
        
        for l in letters {
            if(l != ""){
                arraylettersDict.append(l)
            }
        }
      
    }
    
    for i in 0...arrayWord.count{
        arrayWord[i]
        if(arraylettersDict.contains(arrayWord[i])){
            
            result = true
            
            if(i == arrayWord.count-1){
                if (result == true) {
                    return true
                }
            }
            
        } else {
            return false
        }

    }

    return result
}


checkifword("ixam")