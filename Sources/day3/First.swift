import utils

public func first(isTest: Bool) throws -> Int {
    var sum = 0
    let lines = try readInput(fileName: isTest ? "test" : "input", bundle: .module)
    for line in lines.components(separatedBy: "\n") {
        var maxNumber = 0
        for (i, char) in line.enumerated().dropLast() {
            let a = Int(String(char))!
            for j in (i + 1) ..< line.count {
                let b = Int(String(line[line.index(line.startIndex, offsetBy: j)]))!
                maxNumber = max(maxNumber, a * 10 + b)
            }
        }
        sum += maxNumber
    }

    return sum
}
