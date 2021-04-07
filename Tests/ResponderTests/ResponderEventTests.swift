import XCTest
@testable import Responder

final class ResponderEventTests: XCTestCase {

    func testCanExecute() throws {
        let sut = ObjectTarget2(nextResponder: nil)
        sut.tryToHandle(Action.here)
        let event = try XCTUnwrap(sut.event)
        XCTAssertEqual(event, .here)
    }

    func testCanExecuteOnChain() throws {
        let sut = ObjectTarget2()
        let out = ObjectTarget1(nextResponder: sut)

        out.tryToHandle(Action.here)
        let event = try XCTUnwrap(sut.event)
        XCTAssertEqual(event, .here)
    }

    func testFirstFindExecuteSkipOthers() throws {
        let sut = ObjectTarget2()
        let out1 = ObjectTarget2(nextResponder: sut)
        let out2 = ObjectTarget1(nextResponder: out1)

        out2.tryToHandle(Action.here)
        XCTAssertNil(sut.event)

        let event = try XCTUnwrap(out1.event)
        XCTAssertEqual(event, .here)
    }

    static var allTests = [
        ("testCanExecute", testCanExecute),
        ("testCanExecuteOnChain", testCanExecuteOnChain),
        ("testFirstFindExecuteSkipOthers", testFirstFindExecuteSkipOthers),
    ]
}

class ObjectTarget1: Responder {
    var nextResponder: Responder?

    init(nextResponder: Responder? = nil) {
        self.nextResponder = nextResponder
    }
}

class ObjectTarget2: ObjectTarget1, ActionProtocol {
    private(set) var event: Action?

    func send(event: Action) {
        self.event = event
    }
}

protocol ActionProtocol {
    func send(event: Action)
}

enum Action: Event {
    case here

    func sendToHandler(_ handler: ActionProtocol) {
        handler.send(event: self)
    }
}
