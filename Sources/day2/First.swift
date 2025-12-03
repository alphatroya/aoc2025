import utils

public func first(isTest: Bool) throws -> Int {
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

        for num in a ... b {
            let asString = "\(num)"
            let count = asString.count
            guard count.isMultiple(of: 2) else {
                continue
            }

            if asString.prefix(count / 2) == asString.dropFirst(count / 2) {
                sum += num
            }
        }
    }
    return sum
}
