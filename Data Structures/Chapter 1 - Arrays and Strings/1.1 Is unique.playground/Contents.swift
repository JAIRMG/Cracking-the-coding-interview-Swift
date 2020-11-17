import UIKit

/*:
 1.1 Is unique
 - Implement an algorith to determine if a string has all unique characters.
 - What if you cannot use additional data structures?
 
 */

func assert(_ condition: Bool) -> UIColor {
    condition ? UIColor.green : UIColor.red
}

func isUnique(_ value: String) -> Bool {
    var setString = Set<Character>()
    for character in value {
        guard !setString.contains(character) else { return false }
        setString.insert(character)
    }
    return true
}

assert(isUnique("jair")) // is unique
assert(isUnique("alpha")) // not unique

func isUniqueWithoutSet(_ value: String) -> Bool {
    let sortedString = value.sorted()
    let sortedArray = Array(sortedString)
    
    for i in 0 ..< sortedArray.count - 1 {
        if sortedArray[i] == sortedArray[i + 1] {
            return false
        }
    }
    return true
}


assert(isUniqueWithoutSet("jair")) // is unique
assert(isUniqueWithoutSet("alpha")) // not unique
assert(isUniqueWithoutSet("class")) // not unique
assert(isUniqueWithoutSet("uncopyrightable")) // is unique

