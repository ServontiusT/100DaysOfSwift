import Cocoa

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let luckyNumberFinder: Any = luckyNumbers
    .sorted(by: { num, num2 in return num < num2 })
    .filter { num in !num.isMultiple(of: 2) }
    .map { num in print("\(num) is a lucky number") }

luckyNumberFinder
