import utils

public func first(isTest: Bool) throws -> Int {
    let lines = try readInput(fileName: isTest ? "test" : "input", bundle: .module)
        .components(separatedBy: "\n")
    var mtx = [[String]](
        repeating: [String](repeating: "", count: lines.count),
        count: lines.first!
            .components(separatedBy: " ")
            .count(where: { !$0.isEmpty }),
    )
    for (i, line) in lines.enumerated() {
        for (j, char) in line
            .components(separatedBy: " ")
            .filter({ !$0.isEmpty })
            .enumerated()
        {
            if char.isEmpty {
                continue
            }
            mtx[j][i] = char
        }
    }

    var sum = 0
    for row in mtx {
        switch row.last {
        case "*":
            sum += row.dropLast(1)
                .map { Int($0)! }
                .reduce(1, *)

        case "+":
            sum += row.dropLast(1)
                .map { Int($0)! }
                .reduce(0, +)

        default:
            throw DayError.invalidOperation(line: row, operation: row.last)
        }
    }

    return sum
}
