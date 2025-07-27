//
//  LoginViewModel.swift
//  recipe-app-ios
//
//  Created by efe arslan on 27.07.2025.
//

import Foundation
import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @EnvironmentObject var session: user_session
    
    func login() {
        session.userId = 123
        session.userName = "efe"
        session.email = email
        session.isLoggedIn = true
    }
}
