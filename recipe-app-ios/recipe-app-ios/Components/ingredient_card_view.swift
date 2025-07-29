//
//  ingredient_card_view.swift
//  recipe-app-ios
//
//  Created by efe arslan on 28.07.2025.
//

import SwiftUI

struct IngredientCard: View {
    let imageUrl: String
    let name: String
    let amount: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            AsyncImage(url: URL(string: imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .cornerRadius(12)
                } else if phase.error != nil {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipped()
                        .cornerRadius(12)
                } else {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))

            Text(name)
                .font(.subheadline)
                .fontWeight(.bold)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            Text(amount)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(width: 100, height: 160)
    }
}

#Preview {
    IngredientCard(
        imageUrl: "https://github.com/eflaps/my-assets/blob/main/zeytin-yagi.jpg?raw=true",
        name: "Zeytinyağı",
        amount: "1 yemek kaşığı"
    )
}

