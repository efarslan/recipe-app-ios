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
    
    func registerUser(name: String, email: String, password: String, completion: @escaping (Result<Kullanici, Error>) -> Void) {
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
            "sifre": password
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
                guard let data = data else {
                    completion(.failure(NSError(domain: "", code: 2)))
                    return
                }
                do {
                    let user = try JSONDecoder().decode(Kullanici.self, from: data)
                    completion(.success(user))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError(domain: "", code: httpResponse.statusCode)))
            }
        }.resume()
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/kullanicilar/giris") else {
            completion(.failure(NSError(domain: "", code: 0)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = [
            "email_adres": email,
            "sifre": password
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
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 2)))
                return
            }
            
            if httpResponse.statusCode == 200 {
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        completion(.success(jsonObject))
                    } else {
                        completion(.failure(NSError(domain: "", code: 3)))
                    }
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError(domain: "", code: httpResponse.statusCode)))
            }
        }.resume()
    }
    
    func fetchRecommendedRecipes(completion: @escaping ([Recipe]) -> Void) {
        guard let url = URL(string: "https://recipe-app-backend-production-55c0.up.railway.app/tarifler") else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion([])
                return
            }
            do {
                let decoded = try JSONDecoder().decode([Recipe].self, from: data)
                DispatchQueue.main.async {
                    completion(decoded)
                }
            } catch {
                print("Decode error: \(error)")
                completion([])
            }
        }.resume()
    }
    
    func fetchIngredients(for recipeId: Int, completion: @escaping ([Ingredient]) -> Void) {
        guard let url = URL(string: "\(baseURL)/tarif/\(recipeId)/malzemeler") else {
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion([])
                return
            }

            do {
                let ingredients = try JSONDecoder().decode([Ingredient].self, from: data)
                DispatchQueue.main.async {
                    completion(ingredients)
                }
            } catch {
                print("Malzemeler decode hatası:", error)
                completion([])
            }
        }.resume()
    }
}
