//
//  User.swift
//  EatsApp
//
//  Created by Alejandro Velasco on 19/12/20.
//

import Foundation

struct User: Codable {
    var id: String? = nil
    let name: String
    var phone: String
    var password: String
    
    init(name: String, phone: String, password: String){
        self.name = name
        self.phone = phone
        self.password = password
    }
}
