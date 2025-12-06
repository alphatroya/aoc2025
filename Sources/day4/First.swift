import utils

let roll: Character = "@"
let space: Character = "."

public func first(isTest: Bool) throws -> Int {
    var sum = 0
    let lines = try readInput(fileName: isTest ? "test" : "input", bundle: .module)
        .components(separatedBy: "\n")
    for (y, line) in lines.enumerated() {
        for (x, char) in line.enumerated() {
            switch char {
            case roll:
                if checkNeighbours(
                    x: x,
                    y: y,
                    maxX: line.count,
                    lines: lines
                ) {
                    print(x, y)
                    sum += 1
                }
            case space:
                continue
            default:
                throw DayError.invalidCharacter(x: x, y: y, char: char)
            }
        }
    }

    return sum
}

private func checkNeighbours(
    x xOrigin: Int,
    y yOrigin: Int,
    maxX: Int,
    lines: [String]
) -> Bool {
    let max = 4
    let maxY = lines.count
    var count = 0
    for x in xOrigin-1...xOrigin+1 {
        for y in yOrigin-1...yOrigin+1 {
            if x == xOrigin, y == yOrigin {
                continue
            }
            if x >= 0,
               x < maxX,
               y >= 0,
               y < maxY,
               lines[y][lines[y].index(lines[y].startIndex, offsetBy: x)] == roll {
                count += 1
                if count >= max {
                    return false
                }
            }
        }
    }
    return true
}
