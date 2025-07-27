//
//  user_session.swift
//  recipe-app-ios
//
//  Created by efe arslan on 27.07.2025.
//
import SwiftUI
import Foundation

class user_session: ObservableObject {
    
    @Published var userId: Int?
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var isLoggedIn: Bool = false
}
