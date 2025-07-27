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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(session)
        }
    }
}
