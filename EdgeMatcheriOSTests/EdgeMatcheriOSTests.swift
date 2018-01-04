//
//  EdgeMatcheriOSTests.swift
//  EdgeMatcheriOSTests
//
//  Created by Steven Pautler on 6/24/17.
//  Copyright © 2017 Steve. All rights reserved.
//

import XCTest
@testable import EdgeMatcheriOS

class EdgeMatcheriOSTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJsonParser() {
        let pieces = Parser.getPieces(fromFile: "ChristmasPuzzle", withExtension: "json")
        assert(pieces.count == 9)
    }
    
    func testChristmasPuzzle() {
        let pieces = Parser.getPieces(fromFile: "ChristmasPuzzle", withExtension: "json")
        let board = ChristmasPuzzle(width: 3, height: 3)
        
        backtrack(board: board, pieces: pieces)
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
