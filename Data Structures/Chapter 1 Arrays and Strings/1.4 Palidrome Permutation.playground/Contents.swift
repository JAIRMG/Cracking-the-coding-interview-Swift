import UIKit

// MARK: Palindome Permutation

func isPalindrome(_ text: String, from permutation: String) -> Bool {
    guard text.count == permutation.count else {
        return false
    }
    let inputLetters = text.lowercased().sorted(by: <)
    let permutationLetter = permutation.lowercased().sorted(by: <)
    return inputLetters == permutationLetter
}

isPalindrome("Tact Coa", from: "taco cat")
