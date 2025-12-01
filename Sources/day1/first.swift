import utils

private let testData = """
L68
L30
R48
L5
R60
L55
L1
L99
R14
L82
"""

// MARK: - Day1Error

enum Day1Error: Error {
    case wrongFirstCharacter(line: String, index: Int)
    case wrongNumberFormat(line: String, index: Int)
}

public func first(isTest: Bool) throws -> String {
    var dialPointCounter = 0
    var point = 50
    let rotations = isTest ? testData : try readInput(fileName: "input.txt", bundle: .module)
    for (index, rotation) in rotations.components(separatedBy: "\n").enumerated() {
        switch rotation.first {
        case "L":
            try handle(rotation: rotation, point: &point, left: true, index: index)
        case "R":
            try handle(rotation: rotation, point: &point, left: false, index: index)
        default:
            throw Day1Error.wrongFirstCharacter(line: rotation, index: index)
        }
        if point == 0 {
            dialPointCounter += 1
        }
    }
    return "\(dialPointCounter)"
}

func handle(rotation: String, point: inout Int, left: Bool, index: Int) throws {
    guard let rotationNumber = Int(rotation.dropFirst()) else {
        throw Day1Error.wrongNumberFormat(line: rotation, index: index)
    }

    if left {
        point -= rotationNumber
        while point < 0 {
            point += 100
        }
    } else {
        point += rotationNumber
        while point >= 100 {
            point -= 100
        }
    }
}
