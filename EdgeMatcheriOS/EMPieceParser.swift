//
//  PieceParser.swift
//  EdgeMatcheriOS
//
//  Created by Steven Pautler on 12/27/17.
//  Copyright © 2017 Steve. All rights reserved.
//

import Foundation

class Parser {
    static func getPieces(fromFile: String, withExtension: String) -> [EMPiece] {
        guard let fileUrl = Bundle.main.url(forResource: fromFile, withExtension: withExtension),
            let data = try? Data(contentsOf: fileUrl),
            let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let dict = json as? [String: Any],
            let pieces = dict["pieces"] as? [[String: Any]] else {
            
                print("parsing went wrong")
                return[]
        }
        
        var emPieces: [EMPiece] = []
        
        for pieceDict in pieces {
            if let id = pieceDict["id"] as? Int,
                let edges = pieceDict["edges"] as? [Int] {
                let piece = EMPiece(id, top: edges[0].edge, right: edges[1].edge, bottom: edges[2].edge, left: edges[3].edge)
                emPieces.append(piece)
            }
        }
        
        return emPieces
    }
    
}
