//
//  RecipeDetailModel.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 10/5/20.
//

import Foundation
struct RecipeDetailModel: Codable {
    var profile: RecipeProfile?
    var galleryImage: [RecipeGalleryImage]?
    var ingredients: [RecipeIngredients]?
    var directions: [RecipeDirections]?
    var additionalInfo: [RecipeAdditionalInfo]?
}

struct RecipeProfile: Codable {
    var recipeLogo: Data?
    var recipeTitle: String?
}

struct RecipeGalleryImage: Codable {
    var image: Data?
}

struct RecipeIngredients: Codable {
    var ingredients: String?
}

struct RecipeDirections: Codable  {
    var cookingDirection: String?
}

struct RecipeAdditionalInfo: Codable {
    var AddInfo: String?
}
