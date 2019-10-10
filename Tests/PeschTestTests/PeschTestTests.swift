import XCTest
@testable import PeschTest

final class PeschTestTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PeschTest().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
