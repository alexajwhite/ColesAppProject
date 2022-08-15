//
//  ContentView.swift
//  ColesApp
//
//  Created by Alexander White on 14/8/2022.
//

import SwiftUI

//ContentView shows the main view of recipes which is displayed in grid format
struct ContentView: View {
    let recipes:[Recipe]
    
    let columns = [
        GridItem(.adaptive(minimum: 300), alignment: .leading)
    ]
    
    var body: some View {
        ScrollView() {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        RecipeGridItem(recipe: recipe)
                    }
                }
            }
            .padding(20)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(recipes: loadJson(filename: "recipesSample") ?? [])
                .previewInterfaceOrientation(.landscapeRight)
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
