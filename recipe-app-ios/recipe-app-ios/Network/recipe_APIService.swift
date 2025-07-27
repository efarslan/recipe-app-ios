//
//  recipe_APIService.swift
//  recipe-app-ios
//
//  Created by efe arslan on 27.07.2025.
//

import Foundation

class APIService {
    static let shared = APIService()
    private init() {}

    let baseURL = "https://recipe-app-backend-production-55c0.up.railway.app"
    
    func registerUser(name: String, email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/kullanicilar") else {
            completion(.failure(NSError(domain: "", code: 0)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: String] = [
            "kullanici_nm": name,
            "email_adres": email,
            "sifre_hash": password
        ]

        request.httpBody = try? JSONEncoder().encode(body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "", code: 1)))
                return
            }

            if httpResponse.statusCode == 200 {
                completion(.success("Kayıt başarılı"))
            } else {
                completion(.failure(NSError(domain: "", code: httpResponse.statusCode)))
            }
        }.resume()
    }
}
