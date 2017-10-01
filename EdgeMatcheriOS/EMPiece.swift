//
//  EMPiece.swift
//  EdgeMatcheriOS
//
//  Created by Steven Pautler on 6/24/17.
//  Copyright © 2017 Steve. All rights reserved.
//

import Foundation

public class EMPiece {
    public let identifier: Int
    public var index: EMIndex?
    fileprivate let unrotatedEdges: [EMEdge]
    
    public init(_ id: Int, top: EMEdge, right: EMEdge, bottom: EMEdge, left: EMEdge) {
        identifier = id
        unrotatedEdges = [top, right, bottom, left]
    }

    private var rotation = EMRotation.none
    
    public func rotate() {
        rotation = rotation.rotated
    }
    
    public subscript(_ direction: EMDirection) -> EMEdge {
        return unrotatedEdges[(rotation.rawValue + direction.rawValue) % 4]
    }
}

extension EMPiece: Equatable {
    public static func == (lhs: EMPiece, rhs: EMPiece) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

// MARK :- Helpers
extension EMPiece {
    public var isCorner: Bool {
        for x in 0..<3 {
            if unrotatedEdges[x].color == .none, unrotatedEdges[x+1].color == .none {
                return true
            }
        }
        
        return false
    }
    
    public var isEdge: Bool {
        for edge in unrotatedEdges {
            if edge.color == .none {
                return true
            }
        }

        return false
    }
}
