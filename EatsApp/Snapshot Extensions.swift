//
//  Snapshot Extensions.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 19/12/20.
//

import Foundation
import FirebaseFirestore

extension DocumentSnapshot {
    
    func decode<T: Decodable>(as objectType: T.Type, includingId: Bool = true) throws -> T {
        
        var documentJson = data()
        if includingId {
            documentJson?["id"] = documentID
        }
        
        let documentData = try JSONSerialization.data(withJSONObject: documentJson, options: [])
        let decodeObject = try JSONDecoder().decode(objectType, from: documentData)
        
        return decodeObject
        
    }
}
