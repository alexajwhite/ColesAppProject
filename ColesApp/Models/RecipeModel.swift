//
//  RecipeModel.swift
//  ColesApp
//
//  Created by Alexander White on 14/8/2022.
//

import SwiftUI

struct Recipe: Identifiable {
    let id: UUID
    var title: String
    var description: String
    var thumbnail: String
    var thumbnailAlt: String
    var recipeDetails: RecipeDetails
    var ingredients: [String]
    
}

struct RecipeDetails {
    var amountLabel: String
    var amountNumber: Int
    var prepLabel: String
    var prepTime: String
    var prepNote: String
    var cookingLabel: String
    var cookingTime: String
    var cookTimeAsMinutes: Int
    var prepTimeAsMinutes: Int
}
