import UIKit

let numbers: [String] = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]

// Print out array in alphabetical order
let alphabaticallySortedArray = numbers.sorted { $0 < $1 }

// Print out the array in reverse numerical order
enum Digit: String {
    
    case one = "one"
    case two = "two"
    case three = "three"
    case four = "four"
    case five = "five"
    case six = "six"
    case seven = "seven"
    case eight = "eight"
    case nine = "nine"
    case ten = "ten"

    var description: Int {
        switch self {
        case .one: return 1
        case .two: return 2
        case .three: return 3
        case .four: return 4
        case .five: return 5
        case .six: return 6
        case .seven: return 7
        case .eight: return 8
        case .nine: return 9
        case .ten: return 10
        }
    }
}

enum Words: Int {
    
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10

    var description: String {
        switch self {
        case .one: return "one"
        case .two: return "two"
        case .three: return "three"
        case .four: return "four"
        case .five: return "five"
        case .six: return "six"
        case .seven: return "seven"
        case .eight: return "eight"
        case .nine: return "nine"
        case .ten: return "ten"
        }
    }
}

var digits: [String] {
    return numbers.compactMap { Digit(rawValue: $0)?.description }.reversed().compactMap { Words(rawValue: $0)?.description }
   }
print(digits)

// Print out all the array elements that start with the letter 't'
var tDigits: [String] {
    return digits.filter { $0.first == "t" }
}
print(tDigits)

// Print out a dictionary of elements grouped by the first letter
var digitDictionary: [Character: String] {
    var results = [Character: String]()
    return digits.reduce([Character: String]()) { (dict, value) -> [Character: String] in
        results.updateValue(value, forKey: value.first!)
        return results
    }
}
print(digitDictionary)

 let dict = [1:"one", 2:"two", 3:"three", 4:"four", 5:"five", 6:"six", 7:"seven", 8:"eight", 9:"nine", 10:"ten", 11:"eleven", 12:"twelve", 13:"thirteen"]

// Print out the keys of all the odd numbered entries in descending order
var oddDicts: [Int: String] {
    return dict.filter { key, value in
        return (key % 2) != 0
    }
}
print(oddDicts)

// Print out the values of all even numbered entries that start with the letter 't'
var evenDictsWithStatingT: [Int: String] {
    return dict.filter { key, value in
        return ((key % 2) == 0) && (value.first == "t")
    }
}
print(evenDictsWithStatingT)

// Print out all the values that are multiples of 3
var multipleOfThreeDicts: [Int: String] {
    return dict.filter { key, value in
        return ((key % 3) == 0)
    }
}
print(multipleOfThreeDicts)
