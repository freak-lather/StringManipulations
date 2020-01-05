import UIKit

// increase the count of repeated numbers in array
// example bob is repeating so output will ["bob","alice","ravi","bob1","bob2","alice1"]
let names = ["bob","alice","ravi","bob","bob","alice"]

let uniqueNames = Array(Set(names))
func map(array: [String]) -> [String: Int] {
    var dict = [String: Int]()
    for name in uniqueNames {
        dict[name] = 0
    }
    return dict
}
var mapValue = map(array: uniqueNames)

func userNames(_ array: [String]) -> [String] {
    var userArray = [String]()
    for name in names {
        if mapValue["\(name)"] == 0 {
            userArray.append(name)
        } else {
            userArray.append(name + "\(mapValue["\(name)"] ?? 1)")
        }
        mapValue["\(name)"] = mapValue["\(name)"]! + 1
    }
    return userArray
}

print(userNames(names))

// count of pairs with difference k in given array
// (1, 7) -> 6
// (3, 9) -> 6 (so count is 2)
let numbers = [1,3,8,11,7,9]

let k = 6

func pairs(numbers: [Int], k: Int) -> Int {
    var number = 0
    for i in 0...numbers.count-2 {
        for j in i+1...numbers.count-1 {
            if numbers[i] - numbers[j] == k || numbers[j] - numbers[i] == k {
               number += 1
            }
        }
    }
    return number
}
print(pairs(numbers: numbers, k: k))


