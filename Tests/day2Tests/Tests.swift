import day2
import Testing

@Suite("Day 2 Tests")
struct Day2Tests {
    @Test
    func first() throws {
        try #expect(day2.first(isTest: true) == 1227775554)
        try #expect(day2.first(isTest: false) == 29940924880)
    }

    @Test
    func second() throws {
        try #expect(day2.second(isTest: true) == 4174379265)
        try #expect(day2.second(isTest: false) == 48631958998)
    }
}
