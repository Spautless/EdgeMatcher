//
//  EMColor.swift
//  EdgeMatcheriOS
//
//  Created by Steven Pautler on 6/24/17.
//  Copyright © 2017 Steve. All rights reserved.
//

import Foundation

public struct EMColor {
    let value: Int
}

extension EMColor: Equatable {    
    static public func == (lhs: EMColor, rhs: EMColor) -> Bool {
        return lhs.value == rhs.value
    }
}

