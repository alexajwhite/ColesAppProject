//
//  ColesAppApp.swift
//  ColesApp
//
//  Created by Alexander White on 14/8/2022.
//

import SwiftUI



@main
struct ColesAppApp: App {
    var body: some Scene {
        
        WindowGroup {
            NavigationView {
                ContentView(recipes: loadJson(filename: "recipesSample") ?? [])
            }
            
        }
    }
}
