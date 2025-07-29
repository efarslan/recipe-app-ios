//
//  ingredients_struct.swift
//  recipe-app-ios
//
//  Created by efe arslan on 28.07.2025.
//

import SwiftUI

struct Ingredient: Identifiable, Codable {
    let id: Int
    let name: String
    let amount: Double
    let unit: String
    let imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "malzeme_id"
        case name = "malzeme_adi"
        case amount = "miktar"
        case unit = "cd_olcu"
        case imageUrl = "gorsel_url"
    }
}
