//
//  ContentView.swift
//  ColesApp
//
//  Created by Alexander White on 14/8/2022.
//

import SwiftUI

struct ContentView: View {
    let recipes:[Recipe]
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                AsyncImage(url: URL(string: "https://www.coles.com.au/" + recipe.dynamicThumbnail))
                    .frame(width: 100, height: 100, alignment: .center)
                Text("RECIPE")
                    .font(.headline)
                Text(recipe.dynamicTitle)
                    .font(.subheadline)
                    .bold()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(recipes: loadJson(filename: "recipesSample") ?? [])
    }
}

func loadJson(filename fileName: String) -> [Recipe]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(RecipeData.self, from: data)
            print(jsonData.recipes)
            return jsonData.recipes
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
