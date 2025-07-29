//
//  malzeme_struct.swift
//  recipe-app-ios
//
//  Created by efe arslan on 28.07.2025.
//

struct Malzeme: Identifiable, Codable {
    let id: Int
    let malzemeAdi: String
    let miktar: Double
    let olcu: String
    

    var displayAmount: String {
        return "\(miktar.clean) \(olcu)"
    }

    enum CodingKeys: String, CodingKey {
        case id = "malzeme_id"
        case malzemeAdi = "malzeme_adi"
        case miktar
        case olcu = "cd_olcu"
    }
}

extension Double {
    var clean: String {
        return String(format: "%.1f", self)
    }
}
