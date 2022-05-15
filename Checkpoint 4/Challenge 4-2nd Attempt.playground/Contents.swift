enum sqrtError: Error{
    case outOfBounds, noRootFound
}

func sqrtFinder(number: Int) throws -> Int {
    if number > 10000 || number < 1 {
        throw sqrtError.outOfBounds
    }
    
    var squareRoot = 0
    var squareRootCounter = 0
    
    while squareRootCounter <= number {
        if squareRootCounter * squareRootCounter == number {
            squareRoot = squareRootCounter
        }
        if squareRootCounter == number && squareRoot == 0 {
            throw sqrtError.noRootFound
        }else {
            squareRootCounter+=1
        }
    }
    return squareRoot
}

do {
    let squareNum = try sqrtFinder(number: 10000)
    print(squareNum)
} catch sqrtError.noRootFound {
    print("No Root Found.")
} catch sqrtError.outOfBounds {
    print("Number entered is not a value between 1 and 10000. Please enter a different number")
}
