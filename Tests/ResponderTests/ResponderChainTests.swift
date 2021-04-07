import XCTest
@testable import Responder

final class ResponderChainTests: XCTestCase {

    func testCheckChain() {

        var data: Responder? = Object(nextResponder: nil, index: 0)

        for item in 1...10 {
            let newData = Object(nextResponder: data, index: item)
            data = newData
        }

        var list: [Int] = []
        while data?.nextResponder != nil {
            if let object = data?.nextResponder as? Object {
                list.append(object.index)
            }
            data = data?.nextResponder
        }

        XCTAssertEqual(list, [9, 8, 7, 6, 5, 4, 3, 2, 1, 0])
    }

    static var allTests = [
        ("testCheckChain", testCheckChain),
    ]
}

struct Object: Responder {
    var nextResponder: Responder?
    let index: Int
}
