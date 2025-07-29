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
    
    var session: user_session
    
    init(session: user_session) {
        self.session = session
    }
    
    func login() {
        guard let url = URL(string: "https://recipe-app-backend-production-55c0.up.railway.app/kullanicilar/giris") else { return }
        
        let body: [String: Any] = [
            "email_adres": email,
            "sifre": password
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }

            if let user = try? JSONDecoder().decode(Kullanici.self, from: data) {
                DispatchQueue.main.async {
                    self.session.kullanici_id = user.kullanici_id
                    self.session.kullanici_nm = user.kullanici_nm
                    self.session.email = user.email_adres
                }
            } else {
                print("Giriş başarısız veya dönüş parse edilemedi")
            }
        }.resume()
    }
    

}
