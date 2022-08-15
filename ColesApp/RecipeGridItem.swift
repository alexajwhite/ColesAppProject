//
//  RecipeGridItem.swift
//  ColesApp
//
//  Created by Alexander White on 14/8/2022.
//

import SwiftUI
import CachedAsyncImage

//RecipeGridItem Represents a list item that shows the recipe image and title
struct RecipeGridItem: View {
    let recipe: Recipe
    var body: some View {
        VStack(alignment: .leading) {
            CachedAsyncImage(url: URL(string: "https://www.coles.com.au/" + recipe.dynamicThumbnail)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .accessibilityLabel( Text(recipe.dynamicThumbnailAlt))
                    
            } placeholder: {
                ProgressView()
            }
            
            
                
            
            Text("RECIPE")
                .font(.headline)
                .foregroundColor(.red)
                .multilineTextAlignment(.leading)
            Text(recipe.dynamicTitle)
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            
        }
    }
}

struct RecipeGridItem_Previews: PreviewProvider {
   
    static var previews: some View {
        let recipes: [Recipe] = loadJson(filename: "recipesSample") ?? []
        RecipeGridItem(recipe: recipes[0])
            .previewLayout(.fixed(width:300, height: 300))
    }
}
