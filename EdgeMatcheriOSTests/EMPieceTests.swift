//
//  EMPieceTests.swift
//  EdgeMatcheriOSTests
//
//  Created by Steven Pautler on 9/30/17.
//  Copyright © 2017 Steve. All rights reserved.
//

import XCTest
@testable import EdgeMatcheriOS

class EMPieceTests: XCTestCase {
    func testIsEdge() {
        let cornerPiece = EMPiece(1, top: 0.edge,
                                  right: 0.edge,
                                  bottom: 1.edge,
                                  left: 2.edge)
        if !cornerPiece.isEdge {
            XCTFail("cornerPiece is an edge")
        }
        
        let middlePiece = EMPiece(1, top: 3.edge,
                                  right: 4.edge,
                                  bottom: 1.edge,
                                  left: 2.edge)
        
        if middlePiece.isEdge {
            XCTFail("middlePiece is not an edge")
        }
        
        let nonCornerEdgePiece = EMPiece(1, top: 0.edge,
                                         right: 4.edge,
                                         bottom: 1.edge,
                                         left: 2.edge)
        
        if !nonCornerEdgePiece.isEdge {
            XCTFail("nonCornerEdgePiece is an edge")
        }
    }
    
    func testIsCorner() {
        let cornerPiece = EMPiece(1, top: 0.edge,
                                  right: 0.edge,
                                  bottom: 1.edge,
                                  left: 2.edge)
        if !cornerPiece.isCorner {
            XCTFail("cornerPiece is a corner")
        }
        
        let middlePiece = EMPiece(1, top: 3.edge,
                                  right: 4.edge,
                                  bottom: 1.edge,
                                  left: 2.edge)
        
        if middlePiece.isCorner {
            XCTFail("middlePiece is not a corner")
        }
        
        let nonCornerEdgePiece = EMPiece(1, top: 0.edge,
                                         right: 4.edge,
                                         bottom: 1.edge,
                                         left: 2.edge)
        
        if nonCornerEdgePiece.isCorner {
            XCTFail("nonCornerEdgePiece is not a corner")
        }
    }
    
    func testRotate() {
        let edges = [1.edge, 2.edge, 3.edge, 4.edge]
        let piece = EMPiece(1, top: edges[0], right: edges[1], bottom: edges[2], left: edges[3])
        
        for i in 0..<4 {
            if piece[.up] != edges[i] {
                XCTFail()
            }
            
            if piece[.right] != edges[(i+1) % 4] {
                XCTFail()
            }
            
            if piece[.down] != edges[(i+2) % 4] {
                XCTFail()
            }
            
            if piece[.left] != edges[(i+3) % 4] {
                XCTFail()
            }
            
            piece.rotate()
        }
    }
}
