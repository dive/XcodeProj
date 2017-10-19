import Foundation
import XCTest
import PathKit
import xcproj

final class XCWorkspaceIntegrationSpec: XCTestCase {

    func test_initTheWorkspaceWithTheRightPropeties() {
        let path = fixturesPath() + Path("iOS/Project.xcodeproj/project.xcworkspace")
        let got = try? XCWorkspace(path: path)
        XCTAssertNotNil(got)
    }

    func test_initFailsIfThePathIsWrong() {
        do {
            _ = try XCWorkspace(path: Path("test"))
            XCTAssertTrue(false, "Expected to throw an error but it didn't")
        } catch {}
    }
    
    func test_empty_returnsAnEmptyWorkspace() {
        XCTAssertTrue(XCWorkspace.empty.data.references.isEmpty)
    }

}
