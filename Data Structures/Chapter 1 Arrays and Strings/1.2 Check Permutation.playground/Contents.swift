import UIKit

/*:
 1.2 Check permutation
 - Given two strings, write a method to decide if one is a permutation of the other
 
 */

func assert(_ condition: Bool) -> UIColor {
    condition ? UIColor.green : UIColor.red
}

extension String {
    func isPermutation(of value: String) -> Bool {
        guard self.count == value.count else { return false }
        return self.uppercased().sorted() == value.uppercased().sorted()
    }
}

assert("abc".isPermutation(of: "cba")) // ✅
assert("abc".isPermutation(of: "cab")) // ✅
assert("taco".isPermutation(of: "cat")) // ❌
assert("settings".isPermutation(of: "STTSGINE")) // ✅
