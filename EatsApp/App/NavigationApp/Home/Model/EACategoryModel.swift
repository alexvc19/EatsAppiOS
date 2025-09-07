//
//  Untitled.swift
//  EatsApp
//
//  Created by DaCodes on 06/09/25.
//

struct EACategoryModel: Codable {
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image"
    }
}

struct EACategoriesResponse: Codable {
    let categories: [EACategoryModel]
}
