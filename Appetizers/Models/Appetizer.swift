//
//  Appetizer.swift
//  Appetizers
//
//  Created by Blaze on 17/12/2023.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name, description: String
    let calories, protein, carbs: Int
    let imageURL: String
    let price: Double
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sample = Appetizer(id: 000, name: "Sample Appetizer", description: "Lorem Ipsum sample description", calories: 450, protein: 160, carbs: 300, imageURL: "", price: 89.76)
    
    
    static let appetizers = [sample, sample, sample, sample, sample]
}
