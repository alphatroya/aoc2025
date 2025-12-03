import day2
import Testing

@Suite("Day 2 Tests")
struct Day2Tests {
    @Test
    func first() throws {
        try #expect(day2.first(isTest: true) == 1_227_775_554)
        try #expect(day2.first(isTest: false) == 29_940_924_880)
    }

    @Test
    func second() throws {
        try #expect(day2.second(isTest: true) == 4_174_379_265)
        try #expect(day2.second(isTest: false) == 48_631_958_998)
    }
}
