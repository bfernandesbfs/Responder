import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ResponderChainTests.allTests),
        testCase(ResponderEventTests.allTests),
    ]
}
#endif
