//
//  recipe_app_iosApp.swift
//  recipe-app-ios
//
//  Created by efe arslan on 27.07.2025.
//

import SwiftUI

@main
struct recipe_app_iosApp: App {
    @StateObject var session = user_session()
    @StateObject var recipeViewModel = RecipeViewModel()
    
    var body: some Scene {
        WindowGroup {
            if session.isLoggedIn {
                home_view()
                    .environmentObject(session)
                    .environmentObject(recipeViewModel)
            } else {
                login_view(session: session)
                    .environmentObject(session)
                    .environmentObject(recipeViewModel)
            }
        }
    }
}
