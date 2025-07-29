//
//  recipe_card_view.swift
//  recipe-app-ios
//
//  Created by efe arslan on 28.07.2025.
//

import SwiftUI

struct RecipeCardView: View {
    let imageUrl: String
    let title: String
    let ingredientCount: Int
    let cookTime: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 300)
                        .clipped()
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 180, height: 160)
                }

                Button(action: {
                    // Favori ekleme işlemi
                }) {
                    Image(systemName: "heart")
                        .padding(8)
                        .background(.ultraThinMaterial)
                        .foregroundColor(Color.primaryColor)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 2)
                        .padding(10)
                }
            }
            .cornerRadius(16)

            Text(title)
                .font(.headline)
                .foregroundColor(.secondaryColor)

            HStack(spacing: 6) {
                Text("\(ingredientCount) malzeme")
                Circle()
                    .frame(width: 4, height: 4)
                Text("\(cookTime) dk")
            }
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        .frame(width: 180)
    }
}
