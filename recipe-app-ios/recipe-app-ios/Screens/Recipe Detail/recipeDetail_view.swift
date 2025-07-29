//
//  recipeDetail_view.swift
//  recipe-app-ios
//
//  Created by efe arslan on 28.07.2025.
//

import SwiftUI

struct recipeDetail_view: View {
    let recipe: Recipe
    @EnvironmentObject var viewModel: RecipeViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {

        ScrollView {
            VStack(alignment: .leading) {
                
                ZStack(alignment: .bottom) {
                    ZStack(alignment: .topLeading) {
                        AsyncImage(url: URL(string: recipe.imageUrl)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 450)
                                .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
                        } placeholder: {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 450)
                        }

                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.primaryColor)
                                .padding(15)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(radius: 4)
                        }
                        .padding(.leading, 16)
                        .padding(.top, 50)
                    }

                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(height: 150)
                        .overlay(
                            VStack(spacing: 8) {
                                
                                //Baslik ve Malzeme Adedi
                                VStack {
                                    Text(recipe.title)
                                        .font(.title)
                                        .bold()
                                    
                                    if let count = recipe.malzemeSayisi {
                                        Text("\(count) malzeme")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.bottom, 25)
                                
                                HStack (spacing: 15) {
                                    
                                if let sure = recipe.toplamSure {
                                    HStack(spacing: 5) {
                                        Image(systemName: "clock")
                                            .foregroundColor(.primaryColor)
                                            .font(.system(size: 25))

                                        Text("\(sure) dk")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                                    if let kalori = recipe.kalori {
                                        HStack(spacing: 5) {
                                            Image(systemName: "flame")
                                                .foregroundColor(.primaryColor)
                                                .font(.system(size: 25))
                                            
                                            Text("\(kalori) kcal")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    
                                    HStack(spacing: 5) {
                                        Image(systemName: "tag")
                                            .foregroundColor(.primaryColor)
                                            .font(.system(size: 25))
                                            
                                        Text(recipe.kategori.capitalized)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    
                                }
                                
                            }
                            .padding(),
                            alignment: .center
                        )
                        .padding(.horizontal)
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        .offset(y: 90)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.95)
                }
                //Rounded Rectangle Sonu
                Spacer().frame(height: 100)
                
                Text("Malzemeler")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 15)
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.ingredients, id: \.id) { ingredient in
                            IngredientCard(
                                imageUrl: ingredient.imageUrl ?? "placeholder",
                                name: ingredient.name,
                                amount: "\(ingredient.amount) \(ingredient.unit ?? "")"
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                
            }
            
        }
           .ignoresSafeArea(edges: .top)
           .navigationBarBackButtonHidden(true)
           .onAppear {
               viewModel.loadIngredients(for: recipe.id)
           }
    }
}

#Preview {
    recipeDetail_view(recipe: Recipe(
        id: 1,
        title: "Menemen",
        imageUrl: "https://i.pinimg.com/1200x/40/f7/e2/40f7e227421f6a3cb4d9614522d0525c.jpg",
        malzemeSayisi: 4,
        hazirlanisSure: 5,
        pisirmeSure: 10,
        kategori: "kahvaltı",
        kalori: 250,
        ingredients: [
            Ingredient(id: 1, name: "Yumurta", amount: 2, unit: "adet", imageUrl: nil),
            Ingredient(id: 2, name: "Domates", amount: 1, unit: "adet", imageUrl: nil)
        ],
        toplamSure: 15
    ))
    .environmentObject(RecipeViewModel())
}
