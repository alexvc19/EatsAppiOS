//
//  Datos.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 28/01/21.
//

import Foundation

struct ResData {
    var name: String
    var deliveryCost: String
    var estimateTime: String
    var menu:[Food] = []
    
}
struct Food {
    var name: String?
    var price: String?
}

let restaurats = [
    ResData(
        name: "Okuma", deliveryCost: "$20.00", estimateTime: "30 - 40 minutos", menu: foods
    ),
    
    ResData(
        name: "TuSushi", deliveryCost: "$30.00", estimateTime: "30 - 40 minutos", menu: foods
    ),
    
    ResData(
        name: "Sushido", deliveryCost: "$25.00", estimateTime: "30 - 40 minutos", menu: foods
    ),
    ResData(
        name: "Megumi", deliveryCost: "$18.00", estimateTime: "30 - 40 minutos", menu: foods
    ),
    
    ResData(
        name: "Estilo oriental", deliveryCost: "$23.00", estimateTime: "30 - 40 minutos", menu: foods
    ),
]

let foods = [
    Food(name: "Sushi Empanizado", price: "$120.00"),
    Food(name: "Sushi de res", price: "$120.00"),
    Food(name: "Sushi California", price: "$120.00"),
]
