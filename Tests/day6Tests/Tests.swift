import day6
import Testing

@Suite("Day 6 Tests")
struct Day6Tests {
    @Test
    func first() throws {
        try #expect(day6.first(isTest: true) == 4_277_556)
        try #expect(day6.first(isTest: false) == 5_227_286_044_585)
    }
}
