import BSON
import Foundation
import Nimble

final class DocumentTests: BSONTestCase {
    // This is a test in itself, will fail to compile on unsupported values
    static let testDoc: BSONDocument = [
        "int": 0xBAD1DEA,
        "int32": .int32(32),
        "int64": .int64(64)
    ]

    func testCount() {
        expect(DocumentTests.testDoc.count).to(equal(3))
    }

    func testKeys() {
        expect(DocumentTests.testDoc.keys).to(equal(["int", "int32", "int64"]))
    }

    func testValues() {
        expect(DocumentTests.testDoc.values[0]).to(equal(0xBAD1DEA))
        expect(DocumentTests.testDoc.values[1]).to(equal(.int32(32)))
        expect(DocumentTests.testDoc.values[2]).to(equal(.int64(64)))
    }

    func testSubscript() {
        expect(DocumentTests.testDoc["int"]).to(equal(0xBAD1DEA))
    }

    func testDynamicMemberLookup() {
        expect(DocumentTests.testDoc.int).to(equal(0xBAD1DEA))
    }
}