import UIKit
/**
This program trim a given String with a given offset, such that the resulted String will not be greater that the given offset
and will have proper english words and do not have a trailing space.
 
 EXAMPLE
 Offset = 17
 Message = "Hi there! It's nice to meet you!"
Output
 1.) 'Hi there! It's ni'  //Invalid
 2.) 'Hi there! It's ni ' //Invalid
 3.) 'Hi there! It's nice to' //Invalid
 4.) 'Hi there! It's' // Valid
*/
public func solution(_ message : inout String, _ K : Int) -> String {
    // write your code in Swift 4.2.1 (Linux)
    let startIndex = 0 // random for this example
    let endIndex = K

    let start = String.Index(utf16Offset: startIndex, in: message)
    let end = String.Index(utf16Offset: endIndex, in: message)

    message = String(message[start..<end])
    message = message.trimmingCharacters(in: .whitespacesAndNewlines)
    return message.words(&message).joined(separator: " ")
}
extension String {
    func words(_ message: inout String) -> [String] {
        
        var words: [String] = []

        message.enumerateSubstrings(in: message.startIndex..<message.endIndex, options: .byWords) { substring, _, _, _ in
            if let substring = substring, isReal(word: substring) {
                words.append(substring)
            }
        }
        
        return words
    }
}
func isReal(word: String) -> Bool {
    let checker = UITextChecker()
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

    return misspelledRange.location == NSNotFound
}
var message = "Hi there! It's nice to meet you!"
print(solution(&message, 17))
