import Foundation

// MARK: - ReadError

public enum ReadError: Error {
    case fileNotFound
}

public func readInput(fileName: String, bundle: Bundle) throws -> String {
    guard let fileURL = bundle.url(forResource: fileName, withExtension: "txt") else {
        throw ReadError.fileNotFound
    }

    return try String(contentsOf: fileURL, encoding: .utf8)
        .trimmingCharacters(in: .whitespacesAndNewlines)
}
