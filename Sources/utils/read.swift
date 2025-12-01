import Foundation

// MARK: - ReadError

public enum ReadError: Error {
    case fileNotFound
}

public func readInput(fileName _: String, bundle: Bundle) throws -> String {
    guard let fileURL = bundle.url(forResource: "input", withExtension: "txt") else {
        throw ReadError.fileNotFound
    }

    return try String(contentsOf: fileURL)
}
