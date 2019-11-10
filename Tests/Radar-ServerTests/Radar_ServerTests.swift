import XCTest
@testable import Radar_Server

final class Radar_ServerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Radar_Server().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
