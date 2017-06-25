//
//  EMEdge.swift
//  EdgeMatcheriOS
//
//  Created by Steven Pautler on 6/24/17.
//  Copyright © 2017 Steve. All rights reserved.
//

import Foundation

public struct EMEdge {
    let color: EMColor
}

extension EMEdge: Equatable {
    static public func == (lhs: EMEdge, rhs: EMEdge) -> Bool {
        return lhs.color == rhs.color
    }
}
