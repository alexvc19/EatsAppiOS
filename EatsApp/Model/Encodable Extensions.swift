//
//  Encodable Extensions.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 19/12/20.
//

import Foundation

enum MyError: Error{
    case encodingError
}

extension Encodable {
    
    func toJson(excluding keys: [String] = [String]()) throws -> [String: Any] {
        
        let objectData = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: objectData, options: [])
        guard var json = jsonObject as? [String: Any] else { throw MyError.encodingError}
            
        for key in keys {
            json[key] = nil
        }
         
        return json
        
    }
    
}
