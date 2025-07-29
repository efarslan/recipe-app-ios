//
//  home_view.swift
//  recipe-app-ios
//
//  Created by efe arslan on 27.07.2025.
//

import SwiftUI

struct home_view: View {
    @EnvironmentObject var session: user_session
    @State private var searchText: String = ""
    @EnvironmentObject var viewModel: RecipeViewModel

    var body: some View {
        NavigationStack {
            //Karsilama Text
            VStack(alignment: .leading, spacing: 20) {
                Text(session.kullanici_nm.isEmpty ? "Merhaba" : "Merhaba, \(session.kullanici_nm.capitalized)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.secondaryColor)
                    .padding(.top, 16)
                    .padding(.horizontal)
                
                //Arama
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("tarifleri ara", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal)
                
                //Kategoriler
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(["ana-yemek", "kahvalti", "corba", "salata", "tatli", "hamur-isi", "atistirmalik", "icecek"], id: \.self) { kategori in
                            
                            Image(kategori)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(20)
                            
                            
                        }
                    }
                    .padding(.horizontal)
                }
                
                Text("Öneriler")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 40) {
                        ForEach(viewModel.recommendedRecipes, id: \.id) { recipe in
                            NavigationLink(destination: recipeDetail_view(recipe: recipe)) {
                                RecipeCardView(
                                    imageUrl: recipe.imageUrl,
                                    title: recipe.title,
                                    ingredientCount: recipe.malzemeSayisi ?? 0,
                                    cookTime: recipe.toplamSure ?? 0
                                )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal)
                
                
                Spacer()
            }
            .background(Color.background)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                viewModel.loadRecommendedRecipes()
            }
        }
    }
}

#Preview {
    home_view()
        .environmentObject(user_session())
        .environmentObject(RecipeViewModel())
}
 
