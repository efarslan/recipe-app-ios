//
//  RecipeViewModel.swift
//  recipe-app-ios
//
//  Created by efe arslan on 29.07.2025.
//

import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var recommendedRecipes: [Recipe] = []
    @Published var ingredients: [Ingredient] = []

    private let apiService = APIService.shared

    func loadRecommendedRecipes() {
        apiService.fetchRecommendedRecipes { [weak self] recipes in
            self?.recommendedRecipes = recipes
        }
    }

    func loadIngredients(for recipeId: Int) {
        apiService.fetchIngredients(for: recipeId) { [weak self] fetchedIngredients in
            self?.ingredients = fetchedIngredients
        }
    }
}
