import utils

public func first(isTest: Bool) throws -> Int {
    let lines = try readInput(fileName: isTest ? "test" : "input", bundle: .module)
        .components(separatedBy: "\n")

    var freshSet: Set<ClosedRange<Int>> = []
    var idsIndex = 0
    for (i, line) in lines.enumerated() {
        if line.isEmpty {
            idsIndex = i + 1
            break
        }
        let bounds = line.split(separator: "-")
        let lower = Int(bounds[0])!
        let upper = Int(bounds[1])!
        freshSet.insert(lower ... upper)
    }

    var sum = 0
    for line in lines.dropFirst(idsIndex) {
        let id = Int(line)!
        for range in freshSet {
            if range.contains(id) {
                sum += 1
                break
            }
        }
    }

    return sum
}
