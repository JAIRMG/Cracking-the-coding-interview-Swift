import UIKit

/*:
 1.3 URLify
 - Write a method to replace all spaces in a string with %20. You may assume that the string has sufficient space at the end to hold the additional characters, and that you are given the "true" length of the string.
 
 Example:
 Input: "Mr John Smith   ", 13
 Output: "Mr%20John%20Smith"
 */

extension String {
    
    func URLify(with length: Int) -> String {
        let trimmed = self.prefix(length)
        return trimmed.replacingOccurrences(of: " ", with: "%20")
    }
    
}

assert("Mr John Smith   ".URLify(with: 13) == "Mr%20John%20Smith")
