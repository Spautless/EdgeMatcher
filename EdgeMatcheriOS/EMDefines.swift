//
//  EMDefines.swift
//  EdgeMatcheriOS
//
//  Created by Steven Pautler on 9/20/17.
//  Copyright © 2017 Steve. All rights reserved.
//

import Foundation

public struct EMIndex {
    public let x: Int
    public let y: Int
}

public typealias EMValue = Int
public struct EMEdge {
    public let value: EMValue
    
    public static let none = EMEdge(value: 0)
}

extension EMEdge: CustomStringConvertible {
    public var description: String {
        return "\(value)"
    }
}

public enum EMDirection: Int {
    case up
    case right
    case down
    case left
    
    var opposite: EMDirection {
        return EMDirection(rawValue: (rawValue + 2) % 4)!
    }
}

public enum EMRotation: Int {
    case none
    case clockwise
    case upsideDown
    case counterclockwise
    
    var rotated: EMRotation {
        return EMRotation(rawValue: (rawValue + 1) % 4)!
    }
}

extension EMIndex: Equatable {
    static public func ==(_ lhs: EMIndex, _ rhs: EMIndex) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension EMEdge: Equatable {
    static public func ==(lhs: EMEdge, rhs: EMEdge) -> Bool {
        return lhs.value == rhs.value
    }
}
