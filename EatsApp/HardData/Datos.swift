////
////  Datos.swift
////  EatsApp
////
////  Created by Alejandro Velasco on 28/01/21.
////
//
//import Foundation
//
//struct Root: Codable {
//    var restaurants: [Restaurants]
//    
//    init(restaurants: [Restaurants]) {
//        self.restaurants = restaurants
//    }
//}
//
//struct Restaurants: Codable {
//    let restName: String?
//    let restScore: String
//    let sushies: String
//}
//
//var restaurants = [Root]()
//
//func getFehData(){
//    
//let str = """
//[{
//    "restaurants": [{
//        "rest_Name": "Okuma",
//        "rest_score": 4.5,
//        "sushies": ["california", "enpanizado"]
//    }],
//    "restaurants": [{
//        "rest_Name": "Okuma",
//        "rest_score": 4.5,
//        "sushies": ["california", "enpanizado"]
//    }]
//}]
//"""
//    
//        do {
//            let res = JSONDecoder()
//            res.keyDecodingStrategy = .convertFromSnakeCase
//            //let ss = try res.decode(Root.self, from:Data(str.utf8))
//            //print(ss)
//            //print("numero \(ss)")
//            restaurants = try res.decode([Root].self, from: Data(str.utf8))
//            print(restaurants)
//            
//            
//        }
//        catch {
//            print(error)
//        }
//
//    
//}
//
//
//
