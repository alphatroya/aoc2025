import utils

public func second(isTest: Bool) throws -> Int {
    var sum = 0
    let ranges = try readInput(fileName: isTest ? "test" : "input", bundle: .module)
    for range in ranges.components(separatedBy: ",") {
        let components = range.components(separatedBy: "-")
        guard components.count == 2 else {
            throw Error.wrongComponent(range)
        }
        guard let a = Int(components[0]), let b = Int(components[1]) else {
            throw Error.wrongComponentItem(range)
        }
        for num in a...b {
            let asString = "\(num)"
            let count = asString.count
            for div in 1..<count {
                guard count.isMultiple(of: div) else { continue }

                if asString.allEqual(byCount: div) {
                    sum += num
                    break
                }
            }

        }
    }
    return sum
}

extension String {
    func allEqual(byCount: Int) -> Bool {
        var prev: Substring?
        for stride in stride(from: 0, to: count, by: byCount) {
            let start = index(startIndex, offsetBy: stride)
            let end = index(start, offsetBy: byCount, limitedBy: endIndex) ?? endIndex
            if let prev, prev != self[start..<end] {
                return false
            }
            prev = self[start..<end]
        }
        return true
    }
}
