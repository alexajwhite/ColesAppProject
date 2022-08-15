//
//  RecipeDetailView.swift
//  ColesApp
//
//  Created by Alexander White on 15/8/2022.
//

import SwiftUI

//RecipeDetailView represent a view showing all the information about the selected recipe
struct RecipeDetailView: View {
    let recipe : Recipe
    
    var body: some View {
        ScrollView() {
            VStack(alignment: .center) {
                Text(recipe.dynamicTitle)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                Spacer(minLength: 20)
                
                Text(recipe.dynamicDescription)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                Spacer(minLength: 20)
                
                AsyncImage(url: URL(string: "https://www.coles.com.au/" + recipe.dynamicThumbnail)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .accessibilityAddTraits(.isImage)
                        .accessibilityLabel( Text(recipe.dynamicThumbnailAlt))
                        
                } placeholder: {
                   ProgressView()
                }
                
                
                
            }
            
            Divider()
            
            HStack {
                VStack {
                    Text(recipe.recipeDetails.amountLabel)
                        .font(.headline)
                    Text(String(recipe.recipeDetails.amountNumber))
                        .font(.subheadline)
                }
                    .frame(maxWidth: .infinity)
                    .accessibilityLabel("Recipe serves \(recipe.recipeDetails.amountNumber) people.")
                Divider()
                VStack {
                    Text(recipe.recipeDetails.prepLabel)
                        .font(.headline)
                    Text(String(recipe.recipeDetails.prepTime))
                        .font(.subheadline)
                }
                    .frame(maxWidth: .infinity)
                    .accessibilityLabel("Recipe takes \(recipe.recipeDetails.prepTime) to prepare.")
                Divider()
                VStack {
                    Text(recipe.recipeDetails.cookingLabel)
                        .font(.headline)
                    Text(String(recipe.recipeDetails.cookingTime))
                        .font(.subheadline)
                }
                    .frame(maxWidth: .infinity)
                    .accessibilityLabel("Recipe takes \(recipe.recipeDetails.cookingTime) to cook.")
                
                }
            Divider()
            
            VStack(alignment: .leading) {
                Text("Ingredients")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer(minLength: 20)
                
                ForEach(0..<recipe.ingredients.count) { i in
                    HStack {
                        Text(">")
                            .font(.body)
                            .accessibility(hidden: true)
                        Text(recipe.ingredients[i].ingredient)
                            .font(.body)
                    }
                    Spacer(minLength: 10)
                }
            }
            
        }
        .padding(10)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let recipes: [Recipe] = loadJson(filename: "recipesSample") ?? []
        RecipeDetailView(recipe: recipes[0])
    }
}
