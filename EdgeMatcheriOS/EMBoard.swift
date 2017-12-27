//
//  EMBoard.swift
//  EdgeMatcheriOS
//
//  Created by Steven Pautler on 6/24/17.
//  Copyright © 2017 Steve. All rights reserved.
//

import Foundation

public protocol EMBoard: class {
    var board: [[EMPiece?]] { get set }
    var stack: [EMPiece] { get set }
    
    func edgesMatch(e1: EMEdge, e2: EMEdge) -> Bool
}

public extension EMBoard {
    public subscript(_ x: Int, _ y: Int) -> EMPiece? {
        return board[x][y]
    }
    
    public subscript(_ index: EMIndex) -> EMPiece? {
        return board[index.x][index.y]
    }
    
    public var width: Int {
        return board.count
    }
    
    public var height: Int {
        return board[0].count
    }
    
    public func isValidPush(_ piece: EMPiece) -> Bool {
        guard let index = piece.index else {
            assertionFailure("Can't push a piece without its index set!")
            return false
        }
        
        let isBounded = index.x >= 0 && index.y >= 0 && index.x < width && index.y < height
        if !isBounded {
            return false
        }
        
        if index.x > 0, let leftPiece = board[index.x - 1][index.y] {
            if !edgesMatch(e1: piece.left, e2: leftPiece.right) {
                return false
            }
        }
        
        if index.y > 0, let abovePiece = board[index.x][index.y-1] {
            if !edgesMatch(e1: piece.up, e2: abovePiece.down) {
                return false
            }
        }
        
        if index.x < width - 1, let rightPiece = board[index.x + 1][index.y] {
            if !edgesMatch(e1: piece.right, e2: rightPiece.left) {
                return false
            }
        }
        
        if index.y < height - 1, let belowPiece = board[index.x][index.y + 1] {
            if !edgesMatch(e1: piece.down, e2: belowPiece.up) {
                return false
            }
        }
        
        return true
    }

    public func push(_ piece: EMPiece) {
        board[piece.index!.x][piece.index!.y] = piece
        stack.append(piece)
    }
    
    public func pop() -> EMPiece? {
        guard let piece = stack.popLast(), let index = piece.index else {
            return nil
        }
        
        board[index.x][index.y] = nil
        return piece
    }
}

public class EternityPuzzle: EMBoard {
    public var board: [[EMPiece?]]
    public var stack: [EMPiece] = []
    
    init(width: Int, height: Int) {
        board = Array(repeating: Array(repeating: nil, count: height), count: width)
    }
    
    public func edgesMatch(e1: EMEdge, e2: EMEdge) -> Bool {
        return e1.value == e2.value
    }
}

public class ChristmasPuzzle: EMBoard {
    public var board: [[EMPiece?]]
    public var stack: [EMPiece] = []
    
    init(width: Int, height: Int) {
        board = Array(repeating: Array(repeating: nil, count: height), count: width)
    }
    
    public func edgesMatch(e1: EMEdge, e2: EMEdge) -> Bool {
        return e1.value + e2.value == 10
    }
}
