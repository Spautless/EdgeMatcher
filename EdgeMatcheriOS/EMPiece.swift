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
    
    var up: EMEdge {
        return self[.up]
    }
    
    var right: EMEdge {
        return self[.right]
    }
    
    var down: EMEdge {
        return self[.down]
    }
    
    var left: EMEdge {
        return self[.left]
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

extension EMPiece: CustomStringConvertible {
    public var description: String {
        return "~~EMPiece id=\(identifier)~~\nU:\(self[EMDirection.up]) R:\(self[EMDirection.right]) D:\(self[EMDirection.down]) L:\(self[EMDirection.left])"
    }
}

extension Int {
    var edge: EMEdge {
        return EMEdge(value: self)
    }
}

// MARK :- Helpers
extension EMPiece {
    public var isCorner: Bool {
        for x in 0..<3 {
            if unrotatedEdges[x] == .none, unrotatedEdges[x+1] == .none {
                return true
            }
        }
        
        return false
    }
    
    public var isEdge: Bool {
        for edge in unrotatedEdges {
            if edge == .none {
                return true
            }
        }

        return false
    }
}
