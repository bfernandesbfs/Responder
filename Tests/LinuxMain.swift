import XCTest

import ResponderTests

var tests = [XCTestCaseEntry]()
tests += ResponderChainTests.allTests()
tests += ResponderEventTests.allTests()
XCTMain(tests)
