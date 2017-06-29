//
//  EMBoard.swift
//  EdgeMatcheriOS
//
//  Created by Steven Pautler on 6/24/17.
//  Copyright © 2017 Steve. All rights reserved.
//

import Foundation

public class EMBoard {
    private var board: [[EMPiece?]]
    private var stack: [EMPiece] = []
    
    init(width: Int, height: Int) {
        board = Array(repeating: Array(repeating: nil, count: height), count: width)
    }
    
    public subscript(_ x: Int, _ y: Int) -> EMPiece? {
        return board[x][y]
    }
    
    public subscript(_ index: EMIndex) -> EMPiece? {
        return board[index.x][index.y]
    }
    
    public func push(_ piece: EMPiece) {
        guard let index = piece.index else {
            assertionFailure("Can't push a piece without it's index set!")
            return
        }
        
        board[index.x][index.y] = piece
        stack.append(piece)
    }
    
    public func pop() -> EMPiece? {
        if let piece = stack.popLast(), let index = piece.index {
            board[index.x][index.y] = nil
        }

        return nil
    }
}
