import utils

private let extracted: Character = "x"

public func second(isTest: Bool) throws -> Int {
    let lines = try readInput(fileName: isTest ? "test" : "input", bundle: .module)
        .components(separatedBy: "\n")

    var dataSource: [[Character]] = .init()
    for line in lines {
        var chars = [Character]()
        for char in line {
            chars.append(char)
        }
        dataSource.append(chars)
    }

    var sum = 0
    var sumInTurn = 0
    repeat {
        sum += sumInTurn
        sumInTurn = 0

        let ds = dataSource
        for (y, line) in ds.enumerated() {
            for (x, char) in line.enumerated() {
                switch char {
                case roll:
                    if checkNeighbours(
                        x: x,
                        y: y,
                        maxX: line.count,
                        lines: ds,
                    ) {
                        sumInTurn += 1
                        dataSource[y][x] = extracted
                    }

                case space, extracted:
                    continue

                default:
                    throw DayError.invalidCharacter(x: x, y: y, char: char)
                }
            }
        }
    } while sumInTurn != 0

    return sum
}

private func checkNeighbours(
    x xOrigin: Int,
    y yOrigin: Int,
    maxX: Int,
    lines: [[Character]],
) -> Bool {
    let max = 4
    let maxY = lines.count
    var count = 0
    for x in xOrigin - 1 ... xOrigin + 1 {
        for y in yOrigin - 1 ... yOrigin + 1 {
            if x == xOrigin, y == yOrigin {
                continue
            }
            if x >= 0,
               x < maxX,
               y >= 0,
               y < maxY,
               lines[y][x] == roll
            {
                count += 1
                if count >= max {
                    return false
                }
            }
        }
    }
    return true
}
