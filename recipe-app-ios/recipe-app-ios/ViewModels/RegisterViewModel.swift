//
//  RegisterViewModel.swift
//  recipe-app-ios
//
//  Created by efe arslan on 27.07.2025.
//

import Foundation
import Combine
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    private var session: user_session
    
    init(session: user_session) {
        self.session = session
    }

    func register() {
        APIService.shared.registerUser(
            name: fullName,
            email: email,
            password: password
        ) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self.session.kullanici_id = user.kullanici_id
                    self.session.kullanici_nm = user.kullanici_nm
                    self.session.email = user.email_adres

                case .failure(let error):
                    print("Kayıt hatası: \(error.localizedDescription)")
                }
            }
        }
    }
}
