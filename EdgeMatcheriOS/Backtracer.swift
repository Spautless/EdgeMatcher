//
//  Backtracer.swift
//  EdgeMatcheriOS
//
//  Created by Steven Pautler on 12/27/17.
//  Copyright © 2017 Steve. All rights reserved.
//

import Foundation

func backtrack(board: EMBoard, pieces: [EMPiece]) {
    if let result = internalBacktrack(board: board, remainingPieces: pieces) {
        
        print("SUCCESS!!! \(result)")
    } else {
        print("FAILURE :-(")
    }
}

private func internalBacktrack(board: EMBoard, remainingPieces: [EMPiece]) -> EMBoard? {
    //sentinel
    if remainingPieces.count == 1,
        let lastPiece = remainingPieces.first {
        for _ in 0..<4 {
            lastPiece.rotate() //TODO: one extra rotate command here
            if board.isValidPush(lastPiece) {
                board.push(lastPiece)
                return board
            }
        }
        
        return nil
    }
    
    //more than 1 piece remains. iterate through the remainingPieces to see if there's a valid push
    //and push it, then recurse with the remaining pieces. if the result is nil, continue looking through
    //remaining pieces and trying again until you've exhausted the list, returning nil if that is the case
    for piece in remainingPieces {
        for _ in 0..<4 {
            piece.rotate()
            if board.isValidPush(piece) {
                board.push(piece)
                let filtered = remainingPieces.filter{ $0 != piece }
                if let finished = internalBacktrack(board: board, remainingPieces: filtered) {
                    return finished //OMG WE FOUND IT!
                }
                //we didn't find a solution. pop off the stack and continue
                board.pop()
            }
        }
    }
    
    //there are no valid remaining pieces in our list.
    return nil
}
