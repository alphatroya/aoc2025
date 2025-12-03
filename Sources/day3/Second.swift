import utils

public func second(isTest: Bool) throws -> Int {
    var sum = 0
    let lines = try readInput(fileName: isTest ? "test" : "input", bundle: .module)
    for line in lines.components(separatedBy: "\n") {
        var maxNumber = 0
        for (i, char) in line.enumerated().dropLast() {
            let a = Int(String(char))!
            for j in (i + 1) ..< line.count {
                var line = line
                line.remove(at: line.index(line.startIndex, offsetBy: j))
                let b = Int(
                    String(
                        line,
                    ).prefix(12),
                )!
                maxNumber = max(maxNumber, a * 10 + b)
            }
        }
        sum += maxNumber
    }

    return sum
}
