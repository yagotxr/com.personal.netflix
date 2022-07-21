import XCTest
import SnapshotTesting
@testable import FeatureLogin

final class LoginViewSnapshotTest: XCTestCase {
    
    func testLoginViewEmptyState() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let loginViewController = LoginViewController()
        _ = loginViewController.view
        assertSnapshot(matching: loginViewController, as: .image(on: .iPhone8))
    }
}
