//
//  RecipeModel.swift
//  ColesApp
//
//  Created by Alexander White on 14/8/2022.
//

import SwiftUI
import Foundation

struct RecipeData: Codable {
    var recipes: [Recipe]
}

struct Recipe: Identifiable, Codable {
    let id: UUID = UUID()
    let dynamicTitle: String
    let dynamicDescription: String
    let dynamicThumbnail: String
    let dynamicThumbnailAlt: String
    let recipeDetails: RecipeDetails
    let ingredients: [Ingredient]
    
    
    
    
    struct RecipeDetails : Codable {
        let amountLabel: String
        let amountNumber: Int
        let prepLabel: String
        let prepTime: String
        let prepNote: String?
        let cookingLabel: String
        let cookingTime: String
        let cookTimeAsMinutes: Int
        let prepTimeAsMinutes: Int
    }
    
    struct Ingredient: Codable {
        let ingredient: String
    }
    
    enum codingKeys: String, CodingKey {
        case dynamicTitle, dynamicDescription, dynamicThumbnail, dynamicThumbnailAlt, recipeDetails, ingredients
    }
}



