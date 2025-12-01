import day1
import Testing

@Suite("Day 1 Tests")
struct Day1Tests {
    @Test
    func first() throws {
        try #expect(day1.first(isTest: true) == "3")
        try #expect(day1.first(isTest: false) == "1154")
    }
}
