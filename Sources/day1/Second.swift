import utils

public func second(isTest: Bool) throws -> String {
    var dialPointCounter = 0
    var point = 50
    let rotations = try readInput(fileName: isTest ? "test" : "input", bundle: .module)
    for (index, rotation) in rotations.components(separatedBy: "\n").enumerated() {
        switch rotation.first {
        case "L":
            try handle(rotation: rotation, point: &point, left: true, index: index, counter: &dialPointCounter)
        case "R":
            try handle(rotation: rotation, point: &point, left: false, index: index, counter: &dialPointCounter)
        default:
            throw Error.wrongFirstCharacter(line: rotation, index: index)
        }
    }
    return "\(dialPointCounter)"
}

private func handle(rotation: String, point: inout Int, left: Bool, index: Int, counter: inout Int) throws {
    guard let rotationNumber = Int(rotation.dropFirst()) else {
        throw Error.wrongNumberFormat(line: rotation, index: index)
    }

    if left {
        point -= rotationNumber
        while point < 0 {
            point += 100
            counter += 1
        }
    } else {
        point += rotationNumber
        while point >= 100 {
            point -= 100
            counter += 1
        }
    }
}
