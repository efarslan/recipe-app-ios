//
//  RegisterViewModel.swift
//  recipe-app-ios
//
//  Created by efe arslan on 27.07.2025.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    func register() {
        APIService.shared.registerUser(
            name: fullName,
            email: email,
            password: password
        ) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let message):
                    print(message)

                case .failure(let error):
                    print("Kayıt hatası: \(error.localizedDescription)")
                }
            }
        }
    }
}
