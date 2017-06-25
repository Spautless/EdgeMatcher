//
//  EMPiece.swift
//  EdgeMatcheriOS
//
//  Created by Steven Pautler on 6/24/17.
//  Copyright © 2017 Steve. All rights reserved.
//

import Foundation

public class EMPiece {
    public var index: EMIndex = .zero
    
    private let unrotatedEdges: [EMEdge] = []

    var rotation = EMRotation.none
    
    subscript(_ direction: EMDirection) -> EMEdge {
        return 
    }
}


public enum EMDirection: Int {
    case up
    case right
    case down
    case left
}

public enum EMRotation: Int {
    case none = 0
    case clockwise
    case upsideDown
    case counterclockwise
    
    var rotated: EMRotation {
        return EMRotation(rawValue: (rawValue + 1) % 4)!
    }
}
