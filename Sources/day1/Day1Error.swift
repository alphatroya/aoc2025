enum Day1Error: Error {
    case wrongFirstCharacter(line: String, index: Int)
    case wrongNumberFormat(line: String, index: Int)
}
