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
        "name": "okuma d",
        "deliveryCost": "18",
        "estimateTime": "30min"
    }, {
        "name": "okuma",
        "deliveryCost": "18",
        "estimateTime": "30min"
    }
]
"""

var tabledata = [Restaurant]()
//
//
//let decoder = JSONDecoder()
//let restaurant = try! decoder.decode(Restaurant.self, from: jsonData)


