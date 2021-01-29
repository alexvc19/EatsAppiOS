//
//  Datos.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 28/01/21.
//

import Foundation

struct Restaurant: Codable {
    var name: String
    var deliveryCost: String
    var estimateTime: String
    
}

let jsonString = """
[
    {
        "name": "okuma",
        "deliveryCost": "18",
        "estimateTime": "30min"
    }, {
        "name": "okuma",
        "deliveryCost": "18",
        "estimateTime": "30min"
    }
]
"""

let jsonData = jsonString.data(using: .utf8)!
let decoder = JSONDecoder()
let restaurant = try! decoder.decode(Restaurant.self, from: jsonData)


