//
//  EAHeaderHomeViewModel.swift
//  EatsApp
//
//  Created by DaCodes on 06/09/25.
//
import Foundation

class EAHomeViewModel {
    var categories: [EACategoryModel] = []

    var didUpdateCategories: (() -> Void)?

    func fetchCategories() {
       guard let url = Bundle.main.url(forResource: "Categories", withExtension: "json") else {
           print("JSON file not found")
           return
       }
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(EACategoriesResponse.self, from: data)
            categories = response.categories
            didUpdateCategories?()
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
}
