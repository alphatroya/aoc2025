import day3
import Testing

@Suite("Day 3 Tests")
struct Day3Tests {
    @Test
    func first() throws {
        try #expect(day3.first(isTest: true) == 357)
        try #expect(day3.first(isTest: false) == 17142)
    }

    @Test
    func second() throws {
//        try #expect(day3.second(isTest: true) == 3_121_910_778_619)
//        try #expect(day3.second(isTest: false) == 48631958998)
    }
}
