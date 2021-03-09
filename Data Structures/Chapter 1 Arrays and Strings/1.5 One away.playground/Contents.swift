import UIKit

//MARK: One Away

//func oneAway(_ text: String, textEdited: String) -> Bool {
//
//   var dictionary = text.reduce([:]) { (result, character) -> [Character : Int] in
//        var result = result
//        result[character, default: 0] += 1
//        return result
//    }
//    var valuesAdded = 0
//    textEdited.enumerated().forEach { (index, character) in
//        guard index < text.count, dictionary[character] != nil else {
//            // New character inserted
//            if index >= text.count {
//                valuesAdded += 1
//            }
//            return
//        }
//        dictionary[character]! -= 1
//        dictionary
//    }
//    let total = dictionary.values.reduce(0, +) + valuesAdded
//    return total == 0 || total == 1
//}

func oneAway(_ text: String, textEdited: String) -> Bool {

   let dictionary = text.reduce([:]) { (result, character) -> [Character : Int] in
        var result = result
        result[character, default: 0] += 1
        return result
    }
    var result = 0
    
    let dictionaryEdited = textEdited.reduce([:]) { (result, character) -> [Character : Int] in
         var result = result
         result[character, default: 0] += 1
         return result
     }
    
    for letter in textEdited {
        if dictionary[letter] != dictionaryEdited[letter] {
            result += 1
        }
        
        if result == 2 {
            return false
        }
    }
    
    return true
}

oneAway("pale", textEdited: "ple")

public extension Collection {
    
    func indicesElements() -> Zip2Sequence<Indices, Self> {
        return zip(indices, self)
    }
}
public extension String {
    
    mutating func dropLast() {
        let start = index(before: endIndex)
        replaceSubrange(start..<endIndex, with: [])
    }
    
    mutating func replaceAtIndex(i: Index, c: Character) {
        guard i < endIndex else { return }
        replaceSubrange(i...i, with: [c])
    }
}


extension String {

    func zeroOrOneEditAway(from s: String) -> Bool {
        let (shorter, longer) = count < s.count ? (self, s) : (s, self)
        for (i, charShorter) in shorter.indicesElements() {
            let charLonger = longer[i]
            guard charShorter != charLonger else { continue }
            var s2 = shorter
            if shorter.count == longer.count {
                s2.replaceAtIndex(i: i, c: longer[i])
                return s2 == longer
            }
            s2.insert(charLonger, at: i)
            return s2 == longer
        }
        return longer.count - shorter.count <= 1
    }
}

var s1 = "pe"

var s2 = "ple"

assert(s2.zeroOrOneEditAway(from: s1))

s1 = "pale"

s2 = "pale"

assert(s2.zeroOrOneEditAway(from: s1))

s1 = "pale"

s2 = "pales"

assert(s2.zeroOrOneEditAway(from: s1))

s1 = "pale"

s2 = "bake"

assert(!s2.zeroOrOneEditAway(from: s1))
