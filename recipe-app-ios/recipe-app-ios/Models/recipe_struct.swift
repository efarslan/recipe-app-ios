//
//  recipe_struct.swift
//  recipe-app-ios
//
//  Created by efe arslan on 28.07.2025.
//

struct Recipe: Identifiable, Codable {
    let id: Int
    let title: String
    let imageUrl: String
    let malzemeSayisi: Int?
    let hazirlanisSure: Int?
    let pisirmeSure: Int?
    let kategori: String
    let kalori: Int?
    let ingredients: [Ingredient]?
    let toplamSure: Int?

    enum CodingKeys: String, CodingKey {
        case id = "tarif_id"
        case title = "tarif_baslik"
        case imageUrl = "gorsel_url"
        case malzemeSayisi = "malzeme_sayisi"
        case hazirlanisSure = "hazirlanis_sure_dk"
        case pisirmeSure = "pisirme_sure_dk"
        case kategori = "cd_kategori"
        case kalori = "kalori"
        case ingredients
        case toplamSure = "sure"
    }
}
