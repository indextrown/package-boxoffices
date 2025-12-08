import XCTest
@testable import BoxOffices

final class BoxOfficesTests: XCTestCase {
//    func testExample() throws {
//        // XCTest Documentation
//        // https://developer.apple.com/documentation/xctest
//
//        // Defining Test Cases and Test Methods
//        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
//    }
    
    
    func test_fetchDailyTop10() async throws {
        let boxOffices = BoxOffices(key: "91c037fce2fcb7481f8b8022c4bdc25a")
        let result = await boxOffices.fetchDailyTop10()
        
        // 성공 값
        let topMovies = try result.get()
        XCTAssertEqual(topMovies.count, 10)
    }
}
 
