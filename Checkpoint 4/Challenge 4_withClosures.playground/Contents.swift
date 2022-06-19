
enum sqrtError: Error{
    case outOfBounds, noRootFound
}

let squareRootOf = { (number: Int) -> Int in
    if number > 10000 || number < 1 {
        throw sqrtError.outOfBounds
    }
    
    let oddNumbers = { (length: Int) -> Array<Int> in
        if length > 0{
            return Array(stride(from: 1, to: length * 2, by: 2))
        } else {
            return []
        }
        
    }
    var squareRootCounter = 0
    var squareRoot = number
    
    while squareRoot != 0 {
        squareRoot = squareRoot - oddNumbers(number)[squareRootCounter]
        if squareRoot < 0 {
            throw sqrtError.noRootFound
        }
        squareRootCounter+=1
        }
    
    return squareRootCounter
}

do {
    let squareNum = try squareRootOf(25)
    print(squareNum)
} catch sqrtError.noRootFound {
    print("No Root Found.")
} catch sqrtError.outOfBounds {
    print("Number entered is not a value between 1 and 10000. Please enter a different number")
}
