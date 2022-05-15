
enum sqrtError: Error{
    case outOfBounds, noRootFound
}

func oddNumberFinder(length: Int) -> Array<Int> {
    if length > 0{
        return Array(stride(from: 1, to: length * 2, by: 2))
    }else{
        return []
    }
}

func sqrtFinder (number: Int) throws -> Int  {
    if number > 10000 || number < 1 {
        throw sqrtError.outOfBounds
    }
    
    let oddNumbers = oddNumberFinder(length: number)
    var squareRootCounter = 0
    var squareRoot = number
    
    while squareRoot != 0 {
        squareRoot = squareRoot - oddNumbers[squareRootCounter]
        if squareRoot < 0 {
            throw sqrtError.noRootFound
        }
        squareRootCounter+=1
        }
    
    return squareRootCounter
    }

do {
    let squareNum = try sqrtFinder(number: 900)
    print(squareNum)
} catch sqrtError.noRootFound {
    print("No Root Found.")
} catch sqrtError.outOfBounds {
    print("Number entered is not a value between 1 and 10000. Please enter a different number")
}
