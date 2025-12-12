import day5
import Testing

@Suite("Day 5 Tests")
struct Day5Tests {
    @Test
    func first() throws {
        try #expect(day5.first(isTest: true) == 3)
        try #expect(day5.first(isTest: false) == 558)
    }

//    @Test
//    func second() throws {
//        try #expect(day5.second(isTest: true) == 43)
//        try #expect(day5.second(isTest: false) == 8972)
//    }
}
