import day4
import Testing

@Suite("Day 4 Tests")
struct Day4Tests {
    @Test
    func first() throws {
        try #expect(day4.first(isTest: true) == 13)
        try #expect(day4.first(isTest: false) == 1540)
    }
}
